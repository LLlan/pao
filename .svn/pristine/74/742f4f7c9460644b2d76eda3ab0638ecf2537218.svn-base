package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;

import com.didi.common.util.DateUtil;
import com.fasterxml.jackson.annotation.JsonFormat;

public class SystemMessage implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
	* 
	*/
    private Long id;

    /**
     * 内容
     */
    private String content;
    
    /**
     * 推送类型:7业主,8维修工
     */
    private int tipType;

    /**
     * 创建人
     */
    private Long createUser;

    /**
     * 创建时间
     */
    private Date createTime;

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

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return this.content;
    }

    public void setCreateUser(Long createUser) {
        this.createUser = createUser;
    }

    public Long getCreateUser() {
        return this.createUser;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return this.createTime;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getcTime1() {
        return cTime1;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public void setcTime1(Date cTime1) {
        this.cTime1 = cTime1;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getcTime2() {
        return cTime2;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public void setcTime2(Date cTime2) {
        this.cTime2 = cTime2;
    }

    
    public int getTipType() {
        return tipType;
    }

    
    public void setTipType(int tipType) {
        this.tipType = tipType;
    }

    /**
     * 返回MAP形式封装的参数
     */
    public Map<String, Object> toParam() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("content", content);
        map.put("createUser", createUser);
        map.put("createTime", createTime);
        map.put("tipType", tipType);
        map.put("cTime1", cTime1 == null ? null : DateUtil.dateFormatter(cTime1, DateUtil.YYYY_MM_DD_HH_MM_SS));
        map.put("cTime2", cTime2 == null ? null : DateUtil.dateFormatter(cTime2, DateUtil.YYYY_MM_DD_HH_MM_SS));
        return map;
    }

    @Override
    public String toString() {
        return "SystemMessage:[" + "id=" + id + "," + "content=" + content + "," + "createUser=" + createUser + "," + "createTime=" + createTime + "]";
    }
}