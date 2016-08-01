package com.didi.didims.service;

import com.didi.didims.pojo.SystemMessage;

import java.util.List;
import java.util.Map;

import com.didi.common.pojo.Page;

public interface ISystemMessageService {

	Page querySystemMessagePageList(SystemMessage param, Page page);
	
	SystemMessage querySystemMessage(SystemMessage param);

	List<SystemMessage> querySystemMessageList(SystemMessage param);

	void insertSystemMessage(SystemMessage param) throws Exception;
	
	void updateSystemMessage(SystemMessage param);
	
	void deleteSystemMessage(SystemMessage param);
	
}