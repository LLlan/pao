package com.didi.didims.service.impl;

import com.didi.didims.pojo.AppuserServiceRec;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.didi.common.pojo.Page;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.didi.didims.dao.IAppuserServiceRecDao;
import com.didi.didims.service.IAppuserServiceRecService;

@Service
public class AppuserServiceRecServiceImpl implements IAppuserServiceRecService {

    @Resource
    private IAppuserServiceRecDao appuserServiceRecDao;

    @Override
    public Page queryAppuserServiceRecPageList(AppuserServiceRec param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<AppuserServiceRec> list = appuserServiceRecDao.queryAppuserServiceRecPageList(map);
        int total = appuserServiceRecDao.queryAppuserServiceRecPageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public AppuserServiceRec queryAppuserServiceRec(AppuserServiceRec param) {
        AppuserServiceRec result = null;
        List<AppuserServiceRec> list = appuserServiceRecDao.queryAppuserServiceRecList(param.toParam());
        if (list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<AppuserServiceRec> queryAppuserServiceRecList(AppuserServiceRec param) {
        return appuserServiceRecDao.queryAppuserServiceRecList(param.toParam());
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public String insertHomemakingService(Long appuserId, List<Long> serviceTypeIdList) {
        Map<String, Object> map = new HashMap<>();
        map.put("appuserId", appuserId);
        map.put("serviceTypeIdList", serviceTypeIdList);
        int count = appuserServiceRecDao.checkRepeatService(map);
        if (count > 0) {
            return "repeat_service";
        }
        for(Long serviceTypeId : serviceTypeIdList){
            AppuserServiceRec a = new AppuserServiceRec();
            a.setAppuserId(appuserId);
            a.setServiceTypeId(serviceTypeId);
            a.setCreateTime(new Date());
            appuserServiceRecDao.insertAppuserServiceRec(a);
        }
        return null;
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void updateAppuserServiceRec(AppuserServiceRec param) {
        appuserServiceRecDao.updateAppuserServiceRec(param);
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void deleteAppuserServiceRec(AppuserServiceRec param) {
        appuserServiceRecDao.deleteAppuserServiceRec(param);
    }

}