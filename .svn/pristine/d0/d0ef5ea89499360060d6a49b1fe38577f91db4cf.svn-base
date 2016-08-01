package com.didi.didims.dao;

import com.didi.didims.pojo.Appuser;
import java.util.List;
import java.util.Map;

public interface IAppuserDao {

	void insertAppuser(Appuser param);
	
	void updateAppuser(Appuser param);
	
	void deleteAppuser(Appuser param);
	
	List<Appuser> queryAppuserPageList(Map<String, Object> param);
	
	int queryAppuserPageListCount(Map<String, Object> param);
	
	List<Appuser> queryAppuserList(Map<String, Object> param);

    int checkRepeatAccount(Appuser param);

    void updateStatus(Appuser param);
}