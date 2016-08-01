package com.didi.didims.service.impl;

import com.didi.didims.pojo.HomemakingPrice;
import java.util.List;
import java.util.Map;
import com.didi.common.pojo.Page;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.didi.didims.dao.IHomemakingPriceDao;
import com.didi.didims.service.IHomemakingPriceService;

@Service
public class HomemakingPriceServiceImpl implements IHomemakingPriceService {

	@Resource
	private IHomemakingPriceDao homemakingPriceDao;
	
	@Override
    public Page queryHomemakingPricePageList(HomemakingPrice param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<HomemakingPrice> list = homemakingPriceDao.queryHomemakingPricePageList(map);
        int total = homemakingPriceDao.queryHomemakingPricePageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public HomemakingPrice queryHomemakingPrice(HomemakingPrice param) {
        HomemakingPrice result = null;
        List<HomemakingPrice> list = homemakingPriceDao.queryHomemakingPriceList(param.toParam());
        if(list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<HomemakingPrice> queryHomemakingPriceList(HomemakingPrice param) {
        return homemakingPriceDao.queryHomemakingPriceList(param.toParam());
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void insertHomemakingPrice(HomemakingPrice param) {
        homemakingPriceDao.insertHomemakingPrice(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void updateHomemakingPrice(HomemakingPrice param) {
        homemakingPriceDao.updateHomemakingPrice(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void deleteHomemakingPrice(HomemakingPrice param) {
        homemakingPriceDao.deleteHomemakingPrice(param);
    }
	
}