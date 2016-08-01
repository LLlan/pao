package com.didi.didims.shiro.realm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import com.didi.didims.pojo.User;
import com.didi.didims.service.IPermissionService;
import com.didi.didims.shiro.bean.ByteSourceSerializable;
import com.didi.didims.shiro.bean.ServiceDeskToken;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 身份认证和授权器
 * 
 * @author liaochente
 * 
 */

public class ServiceDeskRealm extends AuthorizingRealm {

    // private final static Logger log = LoggerFactory.getSystemLogger();

    @Resource
    private IPermissionService permissionService;

    /**
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String userName = (String) super.getAvailablePrincipal(principals);
        SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
        if (null != userName) {
            User admin = SessionUtils.getCurrentUser();
            this.loadPrivileges(admin.getRoleId(), simpleAuthorInfo);
            return simpleAuthorInfo;
        }
        // 若该方法什么都不做直接返回null的话,就会导致任何用户访问控制的页面时都会自动跳转到unauthorizedUrl指定的地址
        // 详见applicationContext.xml中的<bean id="shiroFilter">的配置
        return null;
    }

    /**
     * 认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        ServiceDeskToken token = (ServiceDeskToken) authcToken;
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("username", token.getUsername());
        param.put("identityCode", token.getIdentityCode());
        User admin = permissionService.login(param);
        if (admin != null) {
            SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(admin.getUsername(), admin.getPassword(), new ByteSourceSerializable(admin.getUsername() + admin.getSalt()),
                    getName());
            clearCachedAuthorizationInfo(authenticationInfo.getPrincipals());
            return authenticationInfo;
        } else {
            throw new UnknownAccountException("帐号没有找到");
        }
    }

    /**
     * 加载角色对应的页面功能权限
     * 
     * @param roleId
     */
    private void loadPrivileges(Long roleId, SimpleAuthorizationInfo simpleAuthorInfo) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("id", roleId);
        List<Map<String, Object>> permissions = permissionService.queryPermissionsByRole(param);
        // 添加权限
        for (Map<String, Object> map : permissions) {
            simpleAuthorInfo.addStringPermission(map.get("permissionCode").toString());
            // 加载页面权限
            String pagePerms = map.get("struct").toString();
            if (StringUtils.isNotEmpty(pagePerms)) {
                String[] perms = pagePerms.split("/");
                for (String p : perms) {
                    if (StringUtils.isNotEmpty(p)) {
                        simpleAuthorInfo.addStringPermission("page:" + p);
                    }
                }
            }
        }
    }

}
