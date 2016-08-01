package com.didi.didims.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Homemaking implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
	* 
	*/
    private Long id;

    /**
     * 家政公司账号
     */
    private String account;

    /**
     * 家政公司名称
     */
    private String name;
    
    /**
     * 家政公司LOGO
     */
    private String logoFile;

    /**
     * 评级
     */
    private BigDecimal homemakingGrade;

    /**
     * 联系电话
     */
    private String phoneNumber;

    /**
     * 介绍
     */
    private String introduction;

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
     * 账户余额
     */
    private BigDecimal balance;

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

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public BigDecimal getHomemakingGrade() {
        return homemakingGrade;
    }

    public void setHomemakingGrade(BigDecimal homemakingGrade) {
        this.homemakingGrade = homemakingGrade;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() {
        return this.phoneNumber;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getIntroduction() {
        return this.introduction;
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

    
    public String getLogoFile() {
        return logoFile;
    }

    
    public void setLogoFile(String logoFile) {
        this.logoFile = logoFile;
    }

    
    public BigDecimal getBalance() {
        return balance;
    }

    
    public void setBalance(BigDecimal balance) {
        this.balance = balance;
    }

    /**
     * 返回MAP形式封装的参数
     */
    public Map<String, Object> toParam() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("account", account);
        map.put("name", name);
        map.put("homemakingGrade", homemakingGrade);
        map.put("phoneNumber", phoneNumber);
        map.put("introduction", introduction);
        map.put("createTime", createTime);
        map.put("createUser", createUser);
        map.put("updateTime", updateTime);
        map.put("updateUser", updateUser);
        map.put("logoFile", logoFile);
        map.put("status", status);
        map.put("balance", balance);
        return map;
    }

    @Override
    public String toString() {
        return "Homemaking:[" + "id=" + id + "," + "account=" + account + "," + "name=" + name + "," + "homemakingGrade=" + homemakingGrade + "," + "phoneNumber=" + phoneNumber + ","
                + "introduction=" + introduction + "," + "createTime=" + createTime + "," + "createUser=" + createUser + "," + "updateTime=" + updateTime + "," + "updateUser=" + updateUser + ","
                + "status=" + status + "]";
    }
}