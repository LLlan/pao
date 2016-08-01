package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class AppVersion implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	* 主键
	*/
	private Long id;  
	
	/**
	* 版本号
	*/
	private String versionNumber;  
	
	/**
	* APP分类 家政 用户
	*/
	private String category;  
	
	/**
	* 类型 android或者ios
	*/
	private String type;  
	
	/**
	* 下载路径
	*/
	private String filePath;  
	
	/**
	* 更新日志
	*/
	private String updateLog;  
	
	/**
	* 是否强制更新
	*/
	private String updateInstall;  
	
	/**
	* 是否可用
	*/
	private String isShow;  
	
	/**
	* 更新时间
	*/
	private Date updateTime;  
	
	/**
	* file_name
	*/
	private String fileName;  
	
	public void setId(Long id) {
		this.id = id;
	}  
	
	public Long getId() {
		return this.id;
	}  
	public void setVersionNumber(String versionNumber) {
		this.versionNumber = versionNumber;
	}  
	
	public String getVersionNumber() {
		return this.versionNumber;
	}  
	public void setCategory(String category) {
		this.category = category;
	}  
	
	public String getCategory() {
		return this.category;
	}  
	public void setType(String type) {
		this.type = type;
	}  
	
	public String getType() {
		return this.type;
	}  
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}  
	
	public String getFilePath() {
		return this.filePath;
	}  
	public void setUpdateLog(String updateLog) {
		this.updateLog = updateLog;
	}  
	
	public String getUpdateLog() {
		return this.updateLog;
	}  
	public void setUpdateInstall(String updateInstall) {
		this.updateInstall = updateInstall;
	}  
	
	public String getUpdateInstall() {
		return this.updateInstall;
	}  
	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}  
	
	public String getIsShow() {
		return this.isShow;
	}  
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}  
	
	public Date getUpdateTime() {
		return this.updateTime;
	}  
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}  
	
	public String getFileName() {
		return this.fileName;
	}  

	/**
	* 返回MAP形式封装的参数
	*/
	public Map<String, Object> toParam() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("versionNumber", versionNumber);
		map.put("category", category);
		map.put("type", type);
		map.put("filePath", filePath);
		map.put("updateLog", updateLog);
		map.put("updateInstall", updateInstall);
		map.put("isShow", isShow);
		map.put("updateTime", updateTime);
		map.put("fileName", fileName);
		return map;
	}
	
    @Override
    public String toString() {
        return "AppVersion:[" + "id=" + id + "," + "versionNumber=" + versionNumber + "," + "category=" + category + "," + "type=" + type + "," + "filePath=" + filePath + "," + "updateLog=" + updateLog + "," + "updateInstall=" + updateInstall + "," + "isShow=" + isShow + "," + "updateTime=" + updateTime + "," + "fileName=" + fileName + "]";
    }
}