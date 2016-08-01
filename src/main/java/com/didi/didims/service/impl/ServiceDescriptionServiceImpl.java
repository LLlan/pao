package com.didi.didims.service.impl;

import com.didi.didims.pojo.ServiceDescription;
import java.util.List;
import java.util.Map;
import com.didi.common.pojo.Page;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.didi.didims.dao.IServiceDescriptionDao;
import com.didi.didims.service.IServiceDescriptionService;

@Service
public class ServiceDescriptionServiceImpl implements IServiceDescriptionService {

	@Resource
	private IServiceDescriptionDao serviceDescriptionDao;
	
	@Override
    public Page queryServiceDescriptionPageList(ServiceDescription param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<ServiceDescription> list = serviceDescriptionDao.queryServiceDescriptionPageList(map);
        int total = serviceDescriptionDao.queryServiceDescriptionPageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public ServiceDescription queryServiceDescription(ServiceDescription param) {
        ServiceDescription result = null;
        List<ServiceDescription> list = serviceDescriptionDao.queryServiceDescriptionList(param.toParam());
        if(list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<ServiceDescription> queryServiceDescriptionList(ServiceDescription param) {
        return serviceDescriptionDao.queryServiceDescriptionList(param.toParam());
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void insertServiceDescription(ServiceDescription param) {
        serviceDescriptionDao.insertServiceDescription(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void updateServiceDescription(ServiceDescription param) {
        serviceDescriptionDao.updateServiceDescription(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void deleteServiceDescription(ServiceDescription param) {
        serviceDescriptionDao.deleteServiceDescription(param);
    }
	
}