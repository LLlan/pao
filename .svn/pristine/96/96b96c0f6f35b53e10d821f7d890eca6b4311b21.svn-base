package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 加密盐
     */
    private String salt;

    /**
     * 身份CODE
     */
    private String identityCode;

    /**
     * 角色id
     */
    private Long roleId;

    /**
     * 家政公司ID
     */
    private Long homemakingId;

    /**
	 * 
	 */
    private List<Menu> menuList;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return this.id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return this.username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return this.password;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getSalt() {
        return this.salt;
    }

    public void setIdentityCode(String identityCode) {
        this.identityCode = identityCode;
    }

    public String getIdentityCode() {
        return this.identityCode;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getRoleId() {
        return this.roleId;
    }

    public Long getHomemakingId() {
        return homemakingId;
    }

    public void setHomemakingId(Long homemakingId) {
        this.homemakingId = homemakingId;
    }

    /**
     * 返回MAP形式封装的参数
     */
    public Map<String, Object> toParam() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("username", username);
        map.put("password", password);
        map.put("salt", salt);
        map.put("identityCode", identityCode);
        map.put("roleId", roleId);
        map.put("homemakingId", homemakingId);
        return map;
    }

    @Override
    public String toString() {
        return "User:[" + "id=" + id + "," + "username=" + username + "," + "password=" + password + "," + "salt=" + salt + "," + "identityCode=" + identityCode + "," + "roleId=" + roleId + "]";
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }
}