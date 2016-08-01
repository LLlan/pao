package com.didi.didims.dao;

import com.didi.didims.pojo.AppVersion;
import java.util.List;
import java.util.Map;

public interface IAppVersionDao {

	void insertAppVersion(AppVersion param);
	
	void updateAppVersion(AppVersion param);
	
	void deleteAppVersion(AppVersion param);
	
	List<AppVersion> queryAppVersionPageList(Map<String, Object> param);
	
	int queryAppVersionPageListCount(Map<String, Object> param);
	
	List<AppVersion> queryAppVersionList(Map<String, Object> param);
}