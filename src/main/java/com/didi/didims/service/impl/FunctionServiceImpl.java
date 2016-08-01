package com.didi.didims.service.impl;

import com.didi.didims.pojo.Function;
import java.util.List;
import java.util.Map;
import com.didi.common.pojo.Page;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.didi.didims.dao.IFunctionDao;
import com.didi.didims.service.IFunctionService;

@Service
public class FunctionServiceImpl implements IFunctionService {

	@Resource
	private IFunctionDao functionDao;
	
	@Override
    public Page queryFunctionPageList(Function param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<Function> list = functionDao.queryFunctionPageList(map);
        int total = functionDao.queryFunctionPageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public Function queryFunction(Function param) {
        Function result = null;
        List<Function> list = functionDao.queryFunctionList(param.toParam());
        if(list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<Function> queryFunctionList(Function param) {
        return functionDao.queryFunctionList(param.toParam());
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void insertFunction(Function param) {
        functionDao.insertFunction(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void updateFunction(Function param) {
        functionDao.updateFunction(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void deleteFunction(Function param) {
        functionDao.deleteFunction(param);
    }
	
}