package com.didi.didims.dao;

import com.didi.didims.pojo.ServiceDescription;
import java.util.List;
import java.util.Map;

public interface IServiceDescriptionDao {

	void insertServiceDescription(ServiceDescription param);
	
	void updateServiceDescription(ServiceDescription param);
	
	void deleteServiceDescription(ServiceDescription param);
	
	List<ServiceDescription> queryServiceDescriptionPageList(Map<String, Object> param);
	
	int queryServiceDescriptionPageListCount(Map<String, Object> param);
	
	List<ServiceDescription> queryServiceDescriptionList(Map<String, Object> param);
}