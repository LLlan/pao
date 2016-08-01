package com.didi.didims.shiro.util;

import org.apache.poi.ss.formula.functions.T;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;

import com.didi.didims.pojo.User;
import com.didi.didims.shiro.bean.SessionKey;

/**
 * Shiro Session操作工具类
 * 
 * @author liaochente
 * 
 */
public class SessionUtils {

    /**
     * 获取当前登录用户对象
     * 
     * @return
     */
    public final static User getCurrentUser() {
        Session session = SecurityUtils.getSubject().getSession();
        return (User) session.getAttribute(SessionKey.USER_INFO);
    }

    /**
     * 设置当前登录用户对象
     * 
     * @param user
     */
    public final static void setCurrentUser(User user) {
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute(SessionKey.USER_INFO, user);
    }

    /**
     * 设置当前会话属性
     * 
     * @param sessionKey
     * @param object
     */
    public final static void setAttribute(String sessionKey, Object object) {
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute(sessionKey, object);
    }

    /**
     * 获取当前会话属性
     * 
     * @param sessionKey
     * @return
     */
    public final static Object getAttribute(String sessionKey) {
        Session session = SecurityUtils.getSubject().getSession();
        Object obj = session.getAttribute(sessionKey);
        return obj;

    }
}
