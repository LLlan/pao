package com.didi.didims.service;

import com.didi.didims.pojo.HomemakingService;

import java.util.List;
import java.util.Map;

import com.didi.common.pojo.Page;

public interface IHomemakingServiceService {

	Page queryHomemakingServicePageList(HomemakingService param, Page page);
	
	HomemakingService queryHomemakingService(HomemakingService param);

	List<HomemakingService> queryHomemakingServiceList(HomemakingService param);

	void updateHomemakingService(HomemakingService param);
	
	void deleteHomemakingService(HomemakingService param);

	/**
	 * 新增家政服务类型
	 * @param homemakingId
	 * @param serviceTypeIdList
	 * @return
	 */
    String insertHomemakingService(Long userId, Long homemakingId, List<Long> serviceTypeIdList);
	
}