package com.didi.didims.service;

import com.didi.didims.pojo.ServiceType;

import java.util.List;

import org.csource.client.DeleteServerException;

import com.didi.common.pojo.Page;
import com.didi.common.pojo.UploadFile;

public interface IServiceTypeService {

	Page queryServiceTypePageList(ServiceType param, Page page);
	
	ServiceType queryServiceType(ServiceType param);

	List<ServiceType> queryServiceTypeList(ServiceType param);

	/**
	 * 新增分类信息
	 * @param param
	 * @param logoUploadFile
	 * @param picUploadFile
	 */
	void insertServiceType(ServiceType param, UploadFile logoUploadFile, UploadFile picUploadFile);
	
	/**
	 * 修改分类信息
	 * @param param
	 * @param logoUploadFile
	 * @param picUploadFile
	 */
	void updateServiceType(ServiceType param, UploadFile logoUploadFile, UploadFile picUploadFile) throws DeleteServerException ;
	
	void deleteServiceType(ServiceType param);
	
}
