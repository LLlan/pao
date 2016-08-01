package com.didi.didims.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 平台推送消息实体
 * @author liuyong
 *
 */
public class TipInfo implements Serializable{
    private static final long serialVersionUID = 4400573105776493736L;
    /**id*/
    private Long id;
    /**类型：0-平台消息，1-订单消息*/
    private Integer type;
    /**状态：0-待推送,1-已推送,2-已收到,3-未收到,4-已删除*/
    private Integer status;
    /**操作时间*/
    private Date createTime;
    /**用户*/
    private Appuser appUser;
    /**消息内容*/
    private String content;
    
    /**
     * IOS通知apn消息
     */
    private String apnContent;
    
    /**订单提示类型*/
    private Integer orderTipType;
    /**订单id*/
    private Long orderId;
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    
    public Appuser getAppUser() {
        return appUser;
    }
    public void setAppUser(Appuser appUser) {
        this.appUser = appUser;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    
    public Integer getOrderTipType() {
        return orderTipType;
    }
    
    public void setOrderTipType(Integer orderTipType) {
        this.orderTipType = orderTipType;
    }
    
    public String getApnContent() {
		return apnContent;
	}
	public void setApnContent(String apnContent) {
		this.apnContent = apnContent;
	}
    
    public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	/**
     * 返回MAP形式封装的参数
     */
    public Map<String, Object> toParam() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("type", type);
        map.put("createTime", createTime);
        map.put("appUser", appUser);
        map.put("content", content);
        map.put("apnContent", apnContent);
        map.put("status", status);
        map.put("orderTipType", orderTipType);
        map.put("orderId", orderId);
        return map;
    }
}
