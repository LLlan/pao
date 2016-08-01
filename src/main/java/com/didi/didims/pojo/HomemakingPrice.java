package com.didi.didims.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class HomemakingPrice implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
	* 
	*/
    private Long id;

    /**
     * 家政公司服务id
     */
    private Long homemakingServiceId;

    /**
     * 家政服务名称
     */
    private String homemakingServiceName;

    /**
     * 服务描述ID
     */
    private Long serviceDescriptionId;

    /**
     * 服务描述
     */
    private String serviceDescriptionName;

    /**
     * 价格
     */
    private BigDecimal price;

    /**
     * 备注
     */
    private String remarks;

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

    /**
     * 服务类型ID
     */
    private Long serviceTypeId;

    /**
     * 描述状态
     */
    private String descriptionStatus;

    /**
     * 描述备注
     */
    private String descriptionRemarks;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return this.id;
    }

    public void setHomemakingServiceId(Long homemakingServiceId) {
        this.homemakingServiceId = homemakingServiceId;
    }

    public Long getHomemakingServiceId() {
        return this.homemakingServiceId;
    }

    public void setServiceDescriptionId(Long serviceDescriptionId) {
        this.serviceDescriptionId = serviceDescriptionId;
    }

    public Long getServiceDescriptionId() {
        return this.serviceDescriptionId;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPrice() {
        return this.price;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getRemarks() {
        return this.remarks;
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

    public String getHomemakingServiceName() {
        return homemakingServiceName;
    }

    public void setHomemakingServiceName(String homemakingServiceName) {
        this.homemakingServiceName = homemakingServiceName;
    }

    public String getServiceDescriptionName() {
        return serviceDescriptionName;
    }

    public void setServiceDescriptionName(String serviceDescriptionName) {
        this.serviceDescriptionName = serviceDescriptionName;
    }

    public Long getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(Long serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

    public String getDescriptionStatus() {
        return descriptionStatus;
    }

    public void setDescriptionStatus(String descriptionStatus) {
        this.descriptionStatus = descriptionStatus;
    }

    public String getDescriptionRemarks() {
        return descriptionRemarks;
    }

    public void setDescriptionRemarks(String descriptionRemarks) {
        this.descriptionRemarks = descriptionRemarks;
    }

    /**
     * 返回MAP形式封装的参数
     */
    public Map<String, Object> toParam() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("homemakingServiceId", homemakingServiceId);
        map.put("serviceDescriptionId", serviceDescriptionId);
        map.put("price", price);
        map.put("remarks", remarks);
        map.put("createTime", createTime);
        map.put("createUser", createUser);
        map.put("updateTime", updateTime);
        map.put("updateUser", updateUser);
        map.put("status", status);
        map.put("serviceTypeId", serviceTypeId);
        map.put("descriptionStatus", descriptionStatus);
        return map;
    }

    @Override
    public String toString() {
        return "HomemakingPrice:[" + "id=" + id + "," + "homemakingServiceId=" + homemakingServiceId + "," + "serviceDescriptionId=" + serviceDescriptionId + "," + "price=" + price + "," + "remarks="
                + remarks + "," + "createTime=" + createTime + "," + "createUser=" + createUser + "," + "updateTime=" + updateTime + "," + "updateUser=" + updateUser + "," + "status=" + status + "]";
    }
}