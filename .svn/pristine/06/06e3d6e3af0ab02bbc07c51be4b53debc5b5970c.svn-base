package com.didi.didims.pojo;

import com.didi.common.constant.CommonEmun.OperationStatus;

/**
 * ajax json返回体
 * <p>
 * 同时调用setCode和setMsg的时候，一定要先调用setCode
 * </p>
 * 
 * @author liaochente
 * 
 */
public class Result {

    /**
     * 操作状态
     */
    private OperationStatus code;

    /**
     * 提示消息
     */
    private String msg;

    /**
     * 返回数据
     */
    private Object data;

    public String getMsg() {
        return code == null ? null : code.getName();
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public OperationStatus getCode() {
        return code;
    }

    public void setCode(OperationStatus code) {
        this.code = code;
    }
}
