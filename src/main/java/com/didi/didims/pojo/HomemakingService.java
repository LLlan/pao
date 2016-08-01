package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class HomemakingService implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	* 
	*/
	private Long id;  
	
	/**
	* 家政公司id
	*/
	private Long homemakingId;  
	
	/**
	* 服务类型id
	*/
	private Long serviceTypeId;  
	
	/**
	 * 服务类型名称
	 */
	private String serviceTypeName;
	
	/**
	* 创建时间
	*/
	private Date createTime;  
	
	/**
	* 创建人
	*/
	private Long createUser;  
	
	/**
	* 修改时间
	*/
	private Date updateTime;  
	
	/**
	* 修改人
	*/
	private Long updateUser;  
	
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
	public void setHomemakingId(Long homemakingId) {
		this.homemakingId = homemakingId;
	}  
	
	public Long getHomemakingId() {
		return this.homemakingId;
	}  
	public void setServiceTypeId(Long serviceTypeId) {
		this.serviceTypeId = serviceTypeId;
	}  
	
	public Long getServiceTypeId() {
		return this.serviceTypeId;
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
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}  
	
	public Date getUpdateTime() {
		return this.updateTime;
	}  
	public void setUpdateUser(Long updateUser) {
		this.updateUser = updateUser;
	}  
	
	public Long getUpdateUser() {
		return this.updateUser;
	}  
	public void setStatus(String status) {
		this.status = status;
	}  
	
	public String getStatus() {
		return this.status;
	}  

	
    public String getServiceTypeName() {
        return serviceTypeName;
    }

    
    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }

    /**
	* 返回MAP形式封装的参数
	*/
	public Map<String, Object> toParam() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("homemakingId", homemakingId);
		map.put("serviceTypeId", serviceTypeId);
		map.put("createTime", createTime);
		map.put("createUser", createUser);
		map.put("updateTime", updateTime);
		map.put("updateUser", updateUser);
		map.put("status", status);
        map.put("serviceTypeName", serviceTypeName);
		return map;
	}
	
    @Override
    public String toString() {
        return "HomemakingService:[" + "id=" + id + "," + "homemakingId=" + homemakingId + "," + "serviceTypeId=" + serviceTypeId + "," + "createTime=" + createTime + "," + "createUser=" + createUser + "," + "updateTime=" + updateTime + "," + "updateUser=" + updateUser + "," + "status=" + status + "]";
    }
}