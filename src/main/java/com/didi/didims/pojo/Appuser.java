package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Appuser implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	* 主键
	*/
	private Long id;  
	
	/**
	* 账户名称
	*/
	private String account;  
	
	/**
	* 昵称
	*/
	private String nickname;  
	
	/**
	* 密码
	*/
	private String password;  
	
	/**
	* 用户类型
	*/
	private String type;  
	
	/**
	* 头像地址
	*/
	private String picUrl;  
	
	/**
	* 创建时间
	*/
	private Date createTime;  
	
	/**
	* 最后登录时间
	*/
	private Date lastLoginTime;  
	
	/**
	* 经度
	*/
	private String longitude;  
	
	/**
	* 纬度
	*/
	private String latitude;  
	
	/**
	* 状态
	*/
	private String status;  
	
	/**
	* 家政公司id
	*/
	private Long homemakingId;  
	
	/**
	* 用户来源
	*/
	private String userSource;  
	
	/**
	* 个推ID
	*/
	private String cid;  
	
	
	public void setId(Long id) {
		this.id = id;
	}  
	
	public Long getId() {
		return this.id;
	}  
	public void setAccount(String account) {
		this.account = account;
	}  
	
	public String getAccount() {
		return this.account;
	}  
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}  
	
	public String getNickname() {
		return this.nickname;
	}  
	public void setPassword(String password) {
		this.password = password;
	}  
	
	public String getPassword() {
		return this.password;
	}  
	public void setType(String type) {
		this.type = type;
	}  
	
	public String getType() {
		return this.type;
	}  
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}  
	
	public String getPicUrl() {
		return this.picUrl;
	}  
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}  
	
	public Date getCreateTime() {
		return this.createTime;
	}  
	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}  
	
	public Date getLastLoginTime() {
		return this.lastLoginTime;
	}  
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}  
	
	public String getLongitude() {
		return this.longitude;
	}  
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}  
	
	public String getLatitude() {
		return this.latitude;
	}  
	public void setStatus(String status) {
		this.status = status;
	}  
	
	public String getStatus() {
		return this.status;
	}  
	public void setHomemakingId(Long homemakingId) {
		this.homemakingId = homemakingId;
	}  
	
	public Long getHomemakingId() {
		return this.homemakingId;
	}  
	public void setUserSource(String userSource) {
		this.userSource = userSource;
	}  
	
	public String getUserSource() {
		return this.userSource;
	}  
	public void setCid(String cid) {
		this.cid = cid;
	}  
	
	public String getCid() {
		return this.cid;
	}  

	/**
	* 返回MAP形式封装的参数
	*/
	public Map<String, Object> toParam() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("account", account);
		map.put("nickname", nickname);
		map.put("password", password);
		map.put("type", type);
		map.put("picUrl", picUrl);
		map.put("createTime", createTime);
		map.put("lastLoginTime", lastLoginTime);
		map.put("longitude", longitude);
		map.put("latitude", latitude);
		map.put("status", status);
		map.put("homemakingId", homemakingId);
		map.put("userSource", userSource);
		map.put("cid", cid);
		return map;
	}
	
    @Override
    public String toString() {
        return "Appuser:[" + "id=" + id + "," + "account=" + account + "," + "nickname=" + nickname + "," + "password=" + password + "," + "type=" + type + "," + "picUrl=" + picUrl + "," + "createTime=" + createTime + "," + "lastLoginTime=" + lastLoginTime + "," + "longitude=" + longitude + "," + "latitude=" + latitude + "," + "status=" + status + "," + "homemakingId=" + homemakingId + "," + "userSource=" + userSource + "," + "cid=" + cid + "]";
    }
}