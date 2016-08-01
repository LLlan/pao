package com.didi.didims.service;

import java.util.List;
import java.util.Map;

import com.didi.common.constant.CommonEmun.Identity;
import com.didi.didims.pojo.Menu;
import com.didi.didims.pojo.Tree;
import com.didi.didims.pojo.User;

public interface IPermissionService {

    /**
     * 查询所有菜单拥有资源权限列表
     * 
     * @param param
     * @return
     */
    List<Map<String, Object>> queryPermissions(Map<String, Object> param);

    /**
     * 获取登录用户信息
     * 
     * @param param
     * @return
     */
    User login(Map<String, Object> param);

    /**
     * 查询当前用户拥有的菜单列表
     * 
     * @param param
     * @return
     */
    List<Menu> queryMenuByUser(User param);

    /**
     * 查询角色拥有的权限资源
     * 
     * @param param
     * @return
     */
    List<Map<String, Object>> queryPermissionsByRole(Map<String, Object> param);

    /**
     * 根据身份查询菜单-权限树形结构数据
     * 
     * @param param
     * @return
     */
    List<Tree> queryMenuFunctionTreeListByIdentity(Identity param);

    /**
     * 修改在线用户密码
     * 
     * @param userId
     * @param password
     */
    void updateUserPassword(Long userId, String password);

}
