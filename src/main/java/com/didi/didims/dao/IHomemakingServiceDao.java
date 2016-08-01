package com.didi.didims.dao;

import com.didi.didims.pojo.HomemakingService;

import java.util.List;
import java.util.Map;

public interface IHomemakingServiceDao {

	void insertHomemakingService(HomemakingService param);
	
	void updateHomemakingService(HomemakingService param);
	
	void deleteHomemakingService(HomemakingService param);
	
	List<HomemakingService> queryHomemakingServicePageList(Map<String, Object> param);
	
	int queryHomemakingServicePageListCount(Map<String, Object> param);
	
	List<HomemakingService> queryHomemakingServiceList(Map<String, Object> param);

    int checkRepeatType(Map<String, Object> map);
}