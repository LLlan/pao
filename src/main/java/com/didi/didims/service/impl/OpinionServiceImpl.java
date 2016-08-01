package com.didi.didims.service.impl;

import com.didi.didims.pojo.Opinion;
import java.util.List;
import java.util.Map;
import com.didi.common.pojo.Page;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.didi.didims.dao.IOpinionDao;
import com.didi.didims.service.IOpinionService;

@Service
public class OpinionServiceImpl implements IOpinionService {

	@Resource
	private IOpinionDao opinionDao;
	
	@Override
    public Page queryOpinionPageList(Opinion param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<Opinion> list = opinionDao.queryOpinionPageList(map);
        int total = opinionDao.queryOpinionPageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public Opinion queryOpinion(Opinion param) {
        Opinion result = null;
        List<Opinion> list = opinionDao.queryOpinionList(param.toParam());
        if(list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<Opinion> queryOpinionList(Opinion param) {
        return opinionDao.queryOpinionList(param.toParam());
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void insertOpinion(Opinion param) {
        opinionDao.insertOpinion(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void updateOpinion(Opinion param) {
        opinionDao.updateOpinion(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void deleteOpinion(Opinion param) {
        opinionDao.deleteOpinion(param);
    }
	
}