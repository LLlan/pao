package com.didi.didims.service.impl;

import com.didi.didims.pojo.AppVersion;
import java.util.List;
import java.util.Map;
import com.didi.common.pojo.Page;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.didi.didims.dao.IAppVersionDao;
import com.didi.didims.service.IAppVersionService;

@Service
public class AppVersionServiceImpl implements IAppVersionService {

	@Resource
	private IAppVersionDao appVersionDao;
	
	@Override
    public Page queryAppVersionPageList(AppVersion param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<AppVersion> list = appVersionDao.queryAppVersionPageList(map);
        int total = appVersionDao.queryAppVersionPageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public AppVersion queryAppVersion(AppVersion param) {
        AppVersion result = null;
        List<AppVersion> list = appVersionDao.queryAppVersionList(param.toParam());
        if(list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<AppVersion> queryAppVersionList(AppVersion param) {
        return appVersionDao.queryAppVersionList(param.toParam());
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void insertAppVersion(AppVersion param) {
        appVersionDao.insertAppVersion(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void updateAppVersion(AppVersion param) {
        appVersionDao.updateAppVersion(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void deleteAppVersion(AppVersion param) {
        appVersionDao.deleteAppVersion(param);
    }
	
}