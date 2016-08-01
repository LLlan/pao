package com.didi.didims.shiro.filter;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.web.util.WebUtils;

import com.didi.didims.shiro.util.RedirectUtils;

/**
 * 授权过滤器
 * 
 * @author liaochente
 * 
 */
public class PermissionsAuthorizationFilter extends org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter {

    @Override
    protected void redirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
        HttpServletRequest r = (HttpServletRequest) request;
        String loginURL = null;
        if (r != null) {
            StringBuffer sb = r.getRequestURL();
            if (sb != null && !"".equals(sb.toString())) {
                loginURL = RedirectUtils.redirectToLogin(sb.toString());
                if (loginURL == null) {
                    loginURL = this.getLoginUrl();
                }
            }
            WebUtils.issueRedirect(request, response, loginURL);
        }
    }

}
