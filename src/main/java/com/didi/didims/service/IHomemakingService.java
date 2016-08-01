package com.didi.didims.service;

import com.didi.didims.pojo.Homemaking;

import java.util.List;
import java.util.Map;

import org.csource.client.DeleteServerException;

import com.didi.common.pojo.Page;
import com.didi.common.pojo.UploadFile;

public interface IHomemakingService {

	Page queryHomemakingPageList(Homemaking param, Page page);
	
	Homemaking queryHomemaking(Homemaking param);

	List<Homemaking> queryHomemakingList(Homemaking param);

	/**
	 * 新增家政公司
	 * @param param
	 * @param logoUploadFile
	 */
	void insertHomemaking(Homemaking param, UploadFile logoUploadFile);
	
	/**
	 * 修改家政公司信息
	 * @param param
	 * @param logoUploadFile
	 */
	void updateHomemaking(Homemaking param, UploadFile logoUploadFile) throws DeleteServerException;
	
	void deleteHomemaking(Homemaking param);

	/**
	 * 密码重置
	 * @param homemaking
	 */
    void resetPassword(Homemaking homemaking);
	
}