package com.didi.didims.service.impl;

import com.didi.didims.pojo.Appuser;
import com.didi.didims.pojo.SystemMessage;
import com.didi.didims.pojo.TipInfo;
import com.didi.didims.push.gexin.PushToList;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.didi.common.constant.Dict;
import com.didi.common.pojo.Page;

import javax.annotation.Resource;

import org.mvel2.optimizers.impl.refl.nodes.ArrayAccessor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.didi.didims.dao.IAppuserDao;
import com.didi.didims.dao.ISystemMessageDao;
import com.didi.didims.service.ISystemMessageService;
import com.gexin.rp.sdk.base.impl.ListMessage;
import com.gexin.rp.sdk.template.TransmissionTemplate;

@Service
public class SystemMessageServiceImpl implements ISystemMessageService {

    @Resource
    private ISystemMessageDao systemMessageDao;
    @Resource
    private IAppuserDao appuserDao;
    
    
    PushToList push = new PushToList();
    private Long OFFLINE_OUTTIME = 1000*1800L;

    @Override
    public Page querySystemMessagePageList(SystemMessage param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<SystemMessage> list = systemMessageDao.querySystemMessagePageList(map);
        int total = systemMessageDao.querySystemMessagePageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public SystemMessage querySystemMessage(SystemMessage param) {
        SystemMessage result = null;
        List<SystemMessage> list = systemMessageDao.querySystemMessageList(param.toParam());
        if (list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<SystemMessage> querySystemMessageList(SystemMessage param) {
        return systemMessageDao.querySystemMessageList(param.toParam());
    }
    
    /**
     * 发送平台通知
     * @throws Exception 
     */
    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void insertSystemMessage(SystemMessage param) throws Exception {
        int tipType = param.getTipType();
        Map<String, Object> map = new HashMap<>();
        List<Appuser> appuserList = new ArrayList<>();
        Integer orderTipType = null;
        Map<Integer,List<TipInfo>> tipTypeListMapApp = new HashMap<Integer,List<TipInfo>>();
        Map<Integer,ListMessage> transmissionTemplateMapApp = new HashMap<Integer,ListMessage>();
        //业主
        if (Dict.ORDER_TIP_TYPE.PLATFORM_O.getIndex() == tipType) {
            map.put("type", Dict.APPUSER_TYPE.OWNER.toString());
            map.put("status", Dict.COMMON_STATUS.USED.toString());
            orderTipType = Dict.ORDER_TIP_TYPE.PLATFORM_O.getIndex();
        }
        //维修工
        if(Dict.ORDER_TIP_TYPE.PLATFORM_W.getIndex() == tipType){
            map.put("type", Dict.APPUSER_TYPE.WORKER.toString());
            map.put("status", Dict.COMMON_STATUS.USED.toString());
            orderTipType = Dict.ORDER_TIP_TYPE.PLATFORM_W.getIndex();
        }
        map.put("cid", "isNotNull");
        //需要推送的用户
        appuserList = appuserDao.queryAppuserList(map);
        //组装数据   APP推送
        List<TipInfo> tipList = new ArrayList<TipInfo>();
        for(Appuser user : appuserList){
            TipInfo tip = new TipInfo();
            tip.setType(0);//推送类型：0平台推送
            tip.setStatus(Dict.PUSH_STATUS.WAIT.getIndex());
            tip.setOrderTipType(orderTipType);
            tip.setCreateTime(new Date());
            tip.setAppUser(user);
            tip.setContent(param.getContent());
            tip.setApnContent(param.getContent());
            tipList.add(tip);
        }
        if(!CollectionUtils.isEmpty(tipList)){
            Map<String,Object> params = new HashMap<String,Object>();
            params.put("type", Dict.USER_SOURCE.APP.getName());
            tipTypeListMapApp.put(orderTipType, tipList);

            TipInfo tip = tipList.get(0);
            transmissionTemplateMapApp.put(orderTipType, getTransmissionTemplate(tip, orderTipType, true));
            //推送
            List<TipInfo> tipInfoList = push.pushOperate(transmissionTemplateMapApp,tipTypeListMapApp);
            systemMessageDao.insertTipInfoList(tipInfoList);
        }
        systemMessageDao.insertSystemMessage(param);
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void updateSystemMessage(SystemMessage param) {
        systemMessageDao.updateSystemMessage(param);
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void deleteSystemMessage(SystemMessage param) {
        systemMessageDao.deleteSystemMessage(param);
    }

    /**
     * 个推透传
     * @param tip
     * @return
     * @throws Exception
     */
    @SuppressWarnings("static-access")
    public ListMessage getTransmissionTemplate(TipInfo tip, Integer type, boolean isApn) throws Exception{
        TransmissionTemplate template = push.TransmissionTemplateDemo(tip, type, isApn);
        ListMessage message = new ListMessage();
        message.setData(template);
        message.setOffline(true);
        //离线有效时间，单位为毫秒，可选
        message.setOfflineExpireTime(OFFLINE_OUTTIME);
        return message;
    }
}