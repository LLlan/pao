package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class ServiceType implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	* 主键
	*/
	private Long id;  
	
	/**
	* 类型名称
	*/
	private String typeName;  
	
	/**
	* 服务标准
	*/
	private String serviceStandard;  
	
	/**
	* Logo地址
	*/
	private String logoFile;  
	
	/**
	* 图片地址
	*/
	private String picUrl;  
	
	/**
	* 排序
	*/
	private int sort;  
	
	/**
	* 创建时间
	*/
	private Date createTime;  
	
	/**
	* 创建人
	*/
	private Long createUser;  
	
	/**
	* 状态
	*/
	private String status;  
	
	
	public void setId(Long id) {
		this.id = id;
	}  
	
	public Long getId() {
		return this.id;
	}  
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}  
	
	public String getTypeName() {
		return this.typeName;
	}  
	public void setServiceStandard(String serviceStandard) {
		this.serviceStandard = serviceStandard;
	}  
	
	public String getServiceStandard() {
		return this.serviceStandard;
	}  
	public void setLogoFile(String logoFile) {
		this.logoFile = logoFile;
	}  
	
	public String getLogoFile() {
		return this.logoFile;
	}  
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}  
	
	public String getPicUrl() {
		return this.picUrl;
	}  
	public void setSort(int sort) {
		this.sort = sort;
	}  
	
	public int getSort() {
		return this.sort;
	}  
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}  
	
	public Date getCreateTime() {
		return this.createTime;
	}  
	public void setCreateUser(Long createUser) {
		this.createUser = createUser;
	}  
	
	public Long getCreateUser() {
		return this.createUser;
	}  
	public void setStatus(String status) {
		this.status = status;
	}  
	
	public String getStatus() {
		return this.status;
	}  

	/**
	* 返回MAP形式封装的参数
	*/
	public Map<String, Object> toParam() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("typeName", typeName);
		map.put("serviceStandard", serviceStandard);
		map.put("logoFile", logoFile);
		map.put("picUrl", picUrl);
		map.put("sort", sort);
		map.put("createTime", createTime);
		map.put("createUser", createUser);
		map.put("status", status);
		return map;
	}
	
    @Override
    public String toString() {
        return "ServiceType:[" + "id=" + id + "," + "typeName=" + typeName + "," + "serviceStandard=" + serviceStandard + "," + "logoFile=" + logoFile + "," + "picUrl=" + picUrl + "," + "sort=" + sort + "," + "createTime=" + createTime + "," + "createUser=" + createUser + "," + "status=" + status + "]";
    }
}