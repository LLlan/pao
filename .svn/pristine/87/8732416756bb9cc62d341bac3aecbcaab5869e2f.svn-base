package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Role implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	* 角色id
	*/
	private Long id;  
	
	/**
	* 角色名称
	*/
	private String name;  
	
	/**
	* 排序
	*/
	private int sort;  
	
	/**
	* 所属身份
	*/
	private String identityCode;  
	
	/**
	* 创建者
	*/
	private Long createBy;  
	
	
	public void setId(Long id) {
		this.id = id;
	}  
	
	public Long getId() {
		return this.id;
	}  
	public void setName(String name) {
		this.name = name;
	}  
	
	public String getName() {
		return this.name;
	}  
	public void setSort(int sort) {
		this.sort = sort;
	}  
	
	public int getSort() {
		return this.sort;
	}  
	public void setIdentityCode(String identityCode) {
		this.identityCode = identityCode;
	}  
	
	public String getIdentityCode() {
		return this.identityCode;
	}  
	public void setCreateBy(Long createBy) {
		this.createBy = createBy;
	}  
	
	public Long getCreateBy() {
		return this.createBy;
	}  

	/**
	* 返回MAP形式封装的参数
	*/
	public Map<String, Object> toParam() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		map.put("sort", sort);
		map.put("identityCode", identityCode);
		map.put("createBy", createBy);
		return map;
	}
	
    @Override
    public String toString() {
        return "Role:[" + "id=" + id + "," + "name=" + name + "," + "sort=" + sort + "," + "identityCode=" + identityCode + "," + "createBy=" + createBy + "]";
    }
}