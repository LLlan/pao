package com.didi.didims.service;

import com.didi.didims.pojo.Menu;
import java.util.List;
import java.util.Map;
import com.didi.common.pojo.Page;

public interface IMenuService {

	Page queryMenuPageList(Menu param, Page page);
	
	Menu queryMenu(Menu param);

	List<Menu> queryMenuList(Menu param);

	void insertMenu(Menu param);
	
	void updateMenu(Menu param);
	
	void deleteMenu(Menu param);
	
}