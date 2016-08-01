package com.didi.didims.shiro.bean;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 身份凭证收集器扩展
 * 
 * @author liaochente
 * 
 */
public class ServiceDeskToken extends UsernamePasswordToken {

    private static final long serialVersionUID = 5360549619925786449L;

    /**
     * 角色身份
     */
    private String identityCode;

    /**
     * 构造方法
     * 
     * @param username
     *            用户名
     * @param password
     *            密码
     * @param role
     *            身份CODE
     */
    public ServiceDeskToken(final String username, final String password, final String identityCode) {
        super(username, password);
        this.identityCode = identityCode;
    }

    public String getIdentityCode() {
        return identityCode;
    }

    public void setIdentityCode(String identityCode) {
        this.identityCode = identityCode;
    }

}
