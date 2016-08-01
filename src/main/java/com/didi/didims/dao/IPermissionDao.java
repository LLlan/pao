package com.didi.didims.dao;

import java.util.List;
import java.util.Map;

import com.didi.didims.pojo.Menu;
import com.didi.didims.pojo.User;

public interface IPermissionDao {

    /**
     * 查询所有菜单拥有资源权限列表
     * 
     * @param param
     * @return
     */
    List<Map<String, Object>> queryPermissions(Map<String, Object> param);

    /**
     * 查询登录用户信息
     * 
     * @param param
     * @return
     */
    List<User> login(Map<String, Object> param);

    /**
     * 查询用户拥有父菜单列表
     * 
     * @param param
     * @return
     */
    List<Menu> queryMenuByUser(Map<String, Object> param);

    /**
     * 查询用户拥有子菜单列表
     * 
     * @param param
     * @return
     */
    List<Menu> querySubMenuByUser(Map<String, Object> param);

    /**
     * 查询角色拥有的权限资源
     * 
     * @param param
     * @return
     */
    List<Map<String, Object>> queryPermissionsByRole(Map<String, Object> param);

    /**
     * 根据身份查询完整的属性菜单结构数据
     * 
     * @param param
     * @return
     */
    List<Menu> queryAllMenuPermissions(Map<String, Object> param);

    /**
     * 修改在线用户密码
     * 
     * @param param
     */
    void updateUserPassword(Map<String, Object> param);
}
