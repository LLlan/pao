package com.didi.didims.service;

import com.didi.didims.pojo.HomemakingPrice;
import java.util.List;
import java.util.Map;
import com.didi.common.pojo.Page;

public interface IHomemakingPriceService {

	Page queryHomemakingPricePageList(HomemakingPrice param, Page page);
	
	HomemakingPrice queryHomemakingPrice(HomemakingPrice param);

	List<HomemakingPrice> queryHomemakingPriceList(HomemakingPrice param);

	void insertHomemakingPrice(HomemakingPrice param);
	
	void updateHomemakingPrice(HomemakingPrice param);
	
	void deleteHomemakingPrice(HomemakingPrice param);
	
}