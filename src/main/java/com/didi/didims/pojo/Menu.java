package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Menu implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	* 菜单id
	*/
	private Long id;  
	
	/**
	* 菜单唯一标志
	*/
	private String code;  
	
	/**
	* 图标
	*/
	private String logo;  
	
	/**
	* 排序
	*/
	private int sort;  
	
	/**
	* 菜单全路径
	*/
	private String path;  
	
	/**
	* 父节点
	*/
	private Long parentId;  
	
	/**
	* 菜单名
	*/
	private String name;  
	
	/**
	* 身份code
	*/
	private String identityCode;  
	
	/**
	 * 子菜单
	 */
	private List<Menu> subMenu;
	
	/**
	 * 拥有资源权限
	 */
	private List<Function> functions;
 	
	public void setId(Long id) {
		this.id = id;
	}  
	
	public Long getId() {
		return this.id;
	}  
	public void setCode(String code) {
		this.code = code;
	}  
	
	public String getCode() {
		return this.code;
	}  
	public void setLogo(String logo) {
		this.logo = logo;
	}  
	
	public String getLogo() {
		return this.logo;
	}  
	public void setSort(int sort) {
		this.sort = sort;
	}  
	
	public int getSort() {
		return this.sort;
	}  
	public void setPath(String path) {
		this.path = path;
	}  
	
	public String getPath() {
		return this.path;
	}  
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}  
	
	public Long getParentId() {
		return this.parentId;
	}  
	public void setName(String name) {
		this.name = name;
	}  
	
	public String getName() {
		return this.name;
	}  
	public void setIdentityCode(String identityCode) {
		this.identityCode = identityCode;
	}  
	
	public String getIdentityCode() {
		return this.identityCode;
	}  

	/**
	* 返回MAP形式封装的参数
	*/
	public Map<String, Object> toParam() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("code", code);
		map.put("logo", logo);
		map.put("sort", sort);
		map.put("path", path);
		map.put("parentId", parentId);
		map.put("name", name);
		map.put("identityCode", identityCode);
		return map;
	}
	
    @Override
    public String toString() {
        return "Menu:[" + "id=" + id + "," + "code=" + code + "," + "logo=" + logo + "," + "sort=" + sort + "," + "path=" + path + "," + "parentId=" + parentId + "," + "name=" + name + "," + "identityCode=" + identityCode + "]";
    }

    
    public List<Menu> getSubMenu() {
        return subMenu;
    }

    
    public void setSubMenu(List<Menu> subMenu) {
        this.subMenu = subMenu;
    }

    
    public List<Function> getFunctions() {
        return functions;
    }

    
    public void setFunctions(List<Function> functions) {
        this.functions = functions;
    }
}