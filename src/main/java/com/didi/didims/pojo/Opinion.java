package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Opinion implements Serializable {

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
     * 用户ID
     */
    private Long appuserId;

    private String account;

    private String nickname;

    /**
     * 用户类型
     */
    private String appuserType;

    /**
     * 创建时间
     */
    private Date createTime;

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

    public void setAppuserId(Long appuserId) {
        this.appuserId = appuserId;
    }

    public Long getAppuserId() {
        return this.appuserId;
    }

    public void setAppuserType(String appuserType) {
        this.appuserType = appuserType;
    }

    public String getAppuserType() {
        return this.appuserType;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return this.createTime;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * 返回MAP形式封装的参数
     */
    public Map<String, Object> toParam() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("content", content);
        map.put("appuserId", appuserId);
        map.put("appuserType", appuserType);
        map.put("createTime", createTime);
        map.put("nickname", nickname);
        map.put("account", account);
        return map;
    }

    @Override
    public String toString() {
        return "Opinion:[" + "id=" + id + "," + "content=" + content + "," + "appuserId=" + appuserId + "," + "appuserType=" + appuserType + "," + "createTime=" + createTime + "]";
    }
}