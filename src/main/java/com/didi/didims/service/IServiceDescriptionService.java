package com.didi.didims.service;

import com.didi.didims.pojo.ServiceDescription;
import java.util.List;
import java.util.Map;
import com.didi.common.pojo.Page;

public interface IServiceDescriptionService {

	Page queryServiceDescriptionPageList(ServiceDescription param, Page page);
	
	ServiceDescription queryServiceDescription(ServiceDescription param);

	List<ServiceDescription> queryServiceDescriptionList(ServiceDescription param);

	void insertServiceDescription(ServiceDescription param);
	
	void updateServiceDescription(ServiceDescription param);
	
	void deleteServiceDescription(ServiceDescription param);
	
}