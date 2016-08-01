package com.didi.didims.dao;

import com.didi.didims.pojo.Role;

import java.util.List;
import java.util.Map;

public interface IRoleDao {

	void insertRole(Role param);
	
	void updateRole(Role param);
	
	void deleteRole(Role param);
	
	List<Role> queryRolePageList(Map<String, Object> param);
	
	int queryRolePageListCount(Map<String, Object> param);
	
	List<Role> queryRoleList(Map<String, Object> param);

    /**
     * 插入角色与菜单权限关系
     * 
     * @param param
     */
    void insertRoleMenuFunctionRec(Map<String, Object> param);

    /**
     * 删除角色与菜单权限关系
     * 
     * @param param
     */
    void deleteRoleMenuFunctionRec(Map<String, Object> param);
}