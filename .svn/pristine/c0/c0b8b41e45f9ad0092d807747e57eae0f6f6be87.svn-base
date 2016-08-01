package com.didi.didims.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.didi.common.constant.CommonEmun.Identity;
import com.didi.common.util.ListUtil;
import com.didi.didims.dao.IPermissionDao;
import com.didi.didims.pojo.Function;
import com.didi.didims.pojo.Menu;
import com.didi.didims.pojo.Tree;
import com.didi.didims.pojo.User;
import com.didi.didims.service.IPermissionService;

@Service
public class PermissionServiceImpl implements IPermissionService {

    @Resource
    private IPermissionDao permissionDao;

    @Override
    public List<Map<String, Object>> queryPermissions(Map<String, Object> param) {
        return permissionDao.queryPermissions(param);
    }

    @Override
    public User login(Map<String, Object> param) {
        User user = null;
        List<User> list = permissionDao.login(param);
        if (ListUtil.isNotEmpty(list)) {
            user = list.get(0);
        }
        return user;
    }

    @Override
    public List<Menu> queryMenuByUser(User param) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("roleId", param.getRoleId());
        List<Menu> menus = permissionDao.queryMenuByUser(map);
        if (ListUtil.isNotEmpty(menus)) {
            for (Menu menu : menus) {
                map.put("parentId", menu.getId());
                menu.setSubMenu(permissionDao.querySubMenuByUser(map));
            }
        }
        return menus;
    }

    @Override
    public List<Map<String, Object>> queryPermissionsByRole(Map<String, Object> param) {
        return permissionDao.queryPermissionsByRole(param);
    }

    @Override
    public List<Tree> queryMenuFunctionTreeListByIdentity(Identity param) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("identityCode", param);
        List<Tree> trees = new ArrayList<Tree>();
        List<Menu> list = permissionDao.queryAllMenuPermissions(map);
        if (ListUtil.isNotEmpty(list)) {
            for (Menu menu : list) {
                Tree data1 = new Tree();
                List<Tree> child1 = new ArrayList<Tree>();
                data1.setId(menu.getId().toString());
                data1.setText(menu.getName());
                data1.setType("folder");
                data1.addChildren(child1);
                trees.add(data1);
                if (menu.getSubMenu() != null) {
                    for (Menu menu2 : menu.getSubMenu()) {
                        Tree data2 = new Tree();
                        List<Tree> child2 = new ArrayList<Tree>();
                        data2.setId(menu2.getId().toString());
                        data2.setText(menu2.getName());
                        data2.setType("folder");
                        data2.addChildren(child2);
                        child1.add(data2);
                        for (Function func : menu2.getFunctions()) {
                            Tree item = new Tree();
                            item.setId(func.getMenuFunctionId().toString());
                            item.setText(func.getName());
                            item.setType("item");
                            child2.add(item);
                        }
                    }
                }
            }
        }
        return trees;
    }

    @Override
    public void updateUserPassword(Long userId, String password) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("userId", userId);
        param.put("newPassword", password);
        this.permissionDao.updateUserPassword(param);
        
    }

}
