package com.didi.didims.dao;

import com.didi.didims.pojo.HomemakingPrice;
import java.util.List;
import java.util.Map;

public interface IHomemakingPriceDao {

	void insertHomemakingPrice(HomemakingPrice param);
	
	void updateHomemakingPrice(HomemakingPrice param);
	
	void deleteHomemakingPrice(HomemakingPrice param);
	
	List<HomemakingPrice> queryHomemakingPricePageList(Map<String, Object> param);
	
	int queryHomemakingPricePageListCount(Map<String, Object> param);
	
	List<HomemakingPrice> queryHomemakingPriceList(Map<String, Object> param);
}