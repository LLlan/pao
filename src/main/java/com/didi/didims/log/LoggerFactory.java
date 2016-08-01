package com.didi.didims.log;

import org.slf4j.Logger;

/**
 * 日志对象工厂
 * 
 * @author liaochente
 * 
 */
public class LoggerFactory {

    private enum LOGGER {
        BUSIN_MANAGE, BUSIN_HOUSEKEEPING, SYSTEM;
    }

    /**
     * 获取系统日志对象
     * 
     * @return
     */
    public static Logger getSystemLogger() {
        return org.slf4j.LoggerFactory.getLogger(LoggerFactory.class);
    }

    /**
     * 获取运营业务日志对象
     * 
     * @return
     */
    public static Logger getManageBusinLogger() {
        return org.slf4j.LoggerFactory.getLogger(LOGGER.BUSIN_MANAGE.toString());
    }

    /**
     * 获取家政业务日志对象
     * 
     * @return
     */
    public static Logger getHouseKeepingBusinLogger() {
        return org.slf4j.LoggerFactory.getLogger(LOGGER.BUSIN_HOUSEKEEPING.toString());
    }
}
