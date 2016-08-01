package com.didi.didims.shiro.util;

/**
 * Redirect Util Object
 * 
 * @author liaochente
 * 
 */
public class RedirectUtils {

    private final static String MANAGE_URL = "vmanage";

    private final static String HOUSEKEEPING_URL = "vhousekeeping";

    private final static String LOGIN_URL = "/loginManage/goLogin";

    /**
     * go login url
     * 
     * @param lastUrl
     * @return
     */
    public final static String redirectToLogin(String lastUrl) {
        String loginUrl = null;
        if (lastUrl.indexOf(MANAGE_URL) > 0) {
            loginUrl = "/" + MANAGE_URL + LOGIN_URL;
        } else if (lastUrl.indexOf(HOUSEKEEPING_URL) > 0) {
            loginUrl = "/" + HOUSEKEEPING_URL + LOGIN_URL;
        }
        return loginUrl;
    }
}
