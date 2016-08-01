package com.didi.didims.service;

import com.didi.didims.pojo.Appuser;

import java.util.List;
import java.util.Map;

import org.csource.client.DeleteServerException;
import org.springframework.web.multipart.MultipartFile;

import com.didi.common.pojo.Page;
import com.didi.common.pojo.UploadFile;

public interface IAppuserService {

	Page queryAppuserPageList(Appuser param, Page page);
	
	Appuser queryAppuser(Appuser param);

	List<Appuser> queryAppuserList(Appuser param);

	/**
	 * 新增师傅
	 * @param param
	 * @param picUploadFile
	 * @return 
	 */
	@SuppressWarnings("deprecation")
    String insertAppuser(Appuser param, UploadFile picUploadFile);
	/**
	 * 更新师傅信息
	 * @param param
	 * @param picUploadFile
	 */
	String updateAppuser(Appuser param, UploadFile picUploadFile) throws DeleteServerException ;
	
	void deleteAppuser(Appuser param);

	/**
	 * 启用
	 * @param param
	 * @return
	 */
    String turnonExec(Appuser param);
	/**
	 * 停用
	 * @param param
	 * @return
	 */
    String shutExec(Appuser param);
	
}