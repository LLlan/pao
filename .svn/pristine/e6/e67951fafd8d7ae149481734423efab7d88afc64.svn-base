package com.didi.didims.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.didi.common.pojo.Page;
import com.didi.didims.dao.IRoleDao;
import com.didi.didims.pojo.Role;
import com.didi.didims.service.IRoleService;

@Service
public class RoleServiceImpl implements IRoleService {

    @Resource
    private IRoleDao roleDao;

    @Override
    public Page queryRolePageList(Role param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<Role> list = roleDao.queryRolePageList(map);
        int total = roleDao.queryRolePageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public Role queryRole(Role param) {
        Role result = null;
        List<Role> list = roleDao.queryRoleList(param.toParam());
        if (list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<Role> queryRoleList(Role param) {
        return roleDao.queryRoleList(param.toParam());
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void insertRole(Role param, String functions) {
        roleDao.insertRole(param);
        if (StringUtils.isNotEmpty(functions)) {
            // 赋予权限
            String[] functionArr = functions.split(",");
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("roleId", param.getId());
            map.put("menuFunctionIds", functionArr);
            roleDao.insertRoleMenuFunctionRec(map);
        }
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void updateRole(Role param, String functions) {
        roleDao.updateRole(param);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("roleId", param.getId());
        roleDao.deleteRoleMenuFunctionRec(map);
        if (StringUtils.isNotEmpty(functions)) {
            // 赋予权限
            String[] functionArr = functions.split(",");
            map.put("menuFunctionIds", functionArr);
            roleDao.insertRoleMenuFunctionRec(map);
        }
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void deleteRole(Role param) {
        roleDao.deleteRole(param);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("roleId", param.getId());
        roleDao.deleteRoleMenuFunctionRec(map);
    }

}