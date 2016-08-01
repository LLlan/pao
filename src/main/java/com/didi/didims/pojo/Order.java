package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;

import com.didi.common.util.DateUtil;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Order implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 订单号
     */
    private String orderNo;

    /**
     * 订单状态：0-待抢单,1-已抢单,2-已完成,3-已取消,4-超时失效,5-已删除,6-无效，7-开工，8-收工
     */
    private int status;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private Long createUser;

    /**
     * 订单分类类型
     */
    private String serviceType;

    /**
     * 经度
     */
    private String posLongitude;

    /**
     * 纬度
     */
    private String posLatitude;

    /**
     * 服务时间
     */
    private Date serviceTime;

    /**
     * 联系电话
     */
    private String telephone;

    /**
     * 详细地址
     */
    private String serviceAddress;

    /**
     * 资质标准
     */
    private String qualificationsLevel;

    /**
     * 是否愿意付小费:正数0表示不愿意，大于0表示愿意
     */
    private float isPayFee;

    /**
     * 备注
     */
    private String remark;

    /**
     * 服务开始时间
     */
    private Date serviceStartTime;

    /**
     * 服务结束时间
     */
    private Date serviceEndTime;

    /**
     * 服务时间段
     */
    private String serviceTimeScope;

    /**
	* 
	*/
    private String cancleOrderReason;

    /**
     * 家政公司ID
     */
    private Long homemakingId;

    /**
     * 服务项名称
     */
    private String serviceTypeName;

    /**
     * 维修师傅ID
     */
    private Long serviceUserId;

    /**
     * 维修师傅名称
     */
    private String serviceUserName;
    
    /**
     * 过滤条件
     */
    private Date cTime1;
    private Date cTime2;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return this.id;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getOrderNo() {
        return this.orderNo;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatus() {
        return this.status;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getCreateTime() {
        return this.createTime;
    }

    public void setCreateUser(Long createUser) {
        this.createUser = createUser;
    }

    public Long getCreateUser() {
        return this.createUser;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public String getServiceType() {
        return this.serviceType;
    }

    public void setPosLongitude(String posLongitude) {
        this.posLongitude = posLongitude;
    }

    public String getPosLongitude() {
        return this.posLongitude;
    }

    public void setPosLatitude(String posLatitude) {
        this.posLatitude = posLatitude;
    }

    public String getPosLatitude() {
        return this.posLatitude;
    }

    public void setServiceTime(Date serviceTime) {
        this.serviceTime = serviceTime;
    }

    public Date getServiceTime() {
        return this.serviceTime;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getTelephone() {
        return this.telephone;
    }

    public void setServiceAddress(String serviceAddress) {
        this.serviceAddress = serviceAddress;
    }

    public String getServiceAddress() {
        return this.serviceAddress;
    }

    public void setQualificationsLevel(String qualificationsLevel) {
        this.qualificationsLevel = qualificationsLevel;
    }

    public String getQualificationsLevel() {
        return this.qualificationsLevel;
    }

    public void setIsPayFee(float isPayFee) {
        this.isPayFee = isPayFee;
    }

    public float getIsPayFee() {
        return this.isPayFee;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
        return this.remark;
    }

    public void setServiceStartTime(Date serviceStartTime) {
        this.serviceStartTime = serviceStartTime;
    }

    public Date getServiceStartTime() {
        return this.serviceStartTime;
    }

    public void setServiceEndTime(Date serviceEndTime) {
        this.serviceEndTime = serviceEndTime;
    }

    public Date getServiceEndTime() {
        return this.serviceEndTime;
    }

    public void setServiceTimeScope(String serviceTimeScope) {
        this.serviceTimeScope = serviceTimeScope;
    }

    public String getServiceTimeScope() {
        return this.serviceTimeScope;
    }

    public void setCancleOrderReason(String cancleOrderReason) {
        this.cancleOrderReason = cancleOrderReason;
    }

    public String getCancleOrderReason() {
        return this.cancleOrderReason;
    }

    
    public Long getHomemakingId() {
        return homemakingId;
    }

    
    public void setHomemakingId(Long homemakingId) {
        this.homemakingId = homemakingId;
    }

    
    public String getServiceTypeName() {
        return serviceTypeName;
    }

    
    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }

    
    public Long getServiceUserId() {
        return serviceUserId;
    }

    
    public void setServiceUserId(Long serviceUserId) {
        this.serviceUserId = serviceUserId;
    }

    
    public String getServiceUserName() {
        return serviceUserName;
    }

    
    public void setServiceUserName(String serviceUserName) {
        this.serviceUserName = serviceUserName;
    }


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getcTime1() {
        return cTime1;
    }


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setcTime1(Date cTime1) {
        this.cTime1 = cTime1;
    }


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getcTime2() {
        return cTime2;
    }


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setcTime2(Date cTime2) {
        this.cTime2 = cTime2;
    }

    /**
     * 返回MAP形式封装的参数
     */
    public Map<String, Object> toParam() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("orderNo", orderNo);
        map.put("status", status);
        map.put("createTime", createTime);
        map.put("createUser", createUser);
        map.put("serviceType", serviceType);
        map.put("posLongitude", posLongitude);
        map.put("posLatitude", posLatitude);
        map.put("serviceTime", serviceTime);
        map.put("telephone", telephone);
        map.put("serviceAddress", serviceAddress);
        map.put("qualificationsLevel", qualificationsLevel);
        map.put("isPayFee", isPayFee);
        map.put("remark", remark);
        map.put("serviceStartTime", serviceStartTime);
        map.put("serviceEndTime", serviceEndTime);
        map.put("serviceTimeScope", serviceTimeScope);
        map.put("cancleOrderReason", cancleOrderReason);
        map.put("homemakingId", homemakingId);
        map.put("serviceTypeName", serviceTypeName);
        map.put("serviceUserId", serviceUserId);
        map.put("serviceUserName", serviceUserName);
        map.put("cTime1", cTime1==null?null:DateUtil.dateFormatter(cTime1, DateUtil.YYYY_MM_DD_HH_MM_SS));
        map.put("cTime2", cTime2==null?null:DateUtil.dateFormatter(cTime2, DateUtil.YYYY_MM_DD_HH_MM_SS));
        return map;
    }

    @Override
    public String toString() {
        return "Order:[" + "id=" + id + "," + "orderNo=" + orderNo + "," + "status=" + status + "," + "createTime=" + createTime + "," + "createUser=" + createUser + "," + "serviceType="
                + serviceType + "," + "posLongitude=" + posLongitude + "," + "posLatitude=" + posLatitude + "," + "serviceTime=" + serviceTime + "," + "telephone=" + telephone + ","
                + "serviceAddress=" + serviceAddress + "," + "qualificationsLevel=" + qualificationsLevel + "," + "isPayFee=" + isPayFee + "," + "remark=" + remark + "," + "serviceStartTime="
                + serviceStartTime + "," + "serviceEndTime=" + serviceEndTime + "," + "serviceTimeScope=" + serviceTimeScope + "," + "cancleOrderReason=" + cancleOrderReason + "]";
    }
}