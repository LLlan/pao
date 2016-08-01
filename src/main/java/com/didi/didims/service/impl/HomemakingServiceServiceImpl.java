package com.didi.didims.service.impl;

import com.didi.didims.pojo.HomemakingService;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.didi.common.constant.CommonEmun.OperationStatus;
import com.didi.common.constant.Dict;
import com.didi.common.pojo.Page;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.didi.didims.dao.IHomemakingServiceDao;
import com.didi.didims.service.IHomemakingServiceService;

@Service
public class HomemakingServiceServiceImpl implements IHomemakingServiceService {

	@Resource
	private IHomemakingServiceDao homemakingServiceDao;
	
	@Override
    public Page queryHomemakingServicePageList(HomemakingService param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<HomemakingService> list = homemakingServiceDao.queryHomemakingServicePageList(map);
        int total = homemakingServiceDao.queryHomemakingServicePageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public HomemakingService queryHomemakingService(HomemakingService param) {
        HomemakingService result = null;
        List<HomemakingService> list = homemakingServiceDao.queryHomemakingServiceList(param.toParam());
        if(list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<HomemakingService> queryHomemakingServiceList(HomemakingService param) {
        return homemakingServiceDao.queryHomemakingServiceList(param.toParam());
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void updateHomemakingService(HomemakingService param) {
        homemakingServiceDao.updateHomemakingService(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void deleteHomemakingService(HomemakingService param) {
        homemakingServiceDao.deleteHomemakingService(param);
    }

    @Transactional(rollbackFor = {Exception.class})
    @Override
    public String insertHomemakingService(Long userId, Long homemakingId, List<Long> serviceTypeIdList) {
        //判断是否已经存在相同类型
        Map<String, Object> map =new HashMap<>();
        map.put("homemakingId", homemakingId);
        map.put("serviceTypeIdList", serviceTypeIdList);
        int count = homemakingServiceDao.checkRepeatType(map);
        if(count>0){
            return "repeat_type";
        }
        for(Long serviceTypeId : serviceTypeIdList){
            HomemakingService homemakingService = new HomemakingService();
            homemakingService.setHomemakingId(homemakingId);
            homemakingService.setServiceTypeId(serviceTypeId);
            homemakingService.setCreateTime(new Date());
            homemakingService.setCreateUser(userId);
            homemakingService.setStatus(Dict.COMMON_STATUS.USED.toString());
            homemakingServiceDao.insertHomemakingService(homemakingService);
        }
        return "success";
    }
	
}