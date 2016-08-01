package com.didi.didims.service.impl;

import com.didi.didims.pojo.Menu;
import java.util.List;
import java.util.Map;
import com.didi.common.pojo.Page;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.didi.didims.dao.IMenuDao;
import com.didi.didims.service.IMenuService;

@Service
public class MenuServiceImpl implements IMenuService {

	@Resource
	private IMenuDao menuDao;
	
	@Override
    public Page queryMenuPageList(Menu param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<Menu> list = menuDao.queryMenuPageList(map);
        int total = menuDao.queryMenuPageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public Menu queryMenu(Menu param) {
        Menu result = null;
        List<Menu> list = menuDao.queryMenuList(param.toParam());
        if(list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<Menu> queryMenuList(Menu param) {
        return menuDao.queryMenuList(param.toParam());
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void insertMenu(Menu param) {
        menuDao.insertMenu(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void updateMenu(Menu param) {
        menuDao.updateMenu(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void deleteMenu(Menu param) {
        menuDao.deleteMenu(param);
    }
	
}