package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class AppuserServiceRec implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 维修师傅ID
     */
    private Long appuserId;

    /**
     * 维修师傅名称
     */
    private String appuserName;

    /**
     * 服务类型ID
     */
    private Long serviceTypeId;

    /**
     * 维修师傅服务项
     */
    private String ServiceTypeName;

    /**
     * 创建时间
     */
    private Date createTime;

    public void setAppuserId(Long appuserId) {
        this.appuserId = appuserId;
    }

    public Long getAppuserId() {
        return this.appuserId;
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

    /**
     * 返回MAP形式封装的参数
     */
    public Map<String, Object> toParam() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("appuserId", appuserId);
        map.put("serviceTypeId", serviceTypeId);
        map.put("createTime", createTime);
        return map;
    }

    public String getAppuserName() {
        return appuserName;
    }

    public void setAppuserName(String appuserName) {
        this.appuserName = appuserName;
    }

    public String getServiceTypeName() {
        return ServiceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        ServiceTypeName = serviceTypeName;
    }

    @Override
    public String toString() {
        return "AppuserServiceRec:[" + "appuserId=" + appuserId + "," + "serviceTypeId=" + serviceTypeId + "," + "createTime=" + createTime + "]";
    }
}