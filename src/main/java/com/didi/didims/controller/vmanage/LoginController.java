package com.didi.didims.controller.vmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.didi.common.constant.CommonEmun.Identity;
import com.didi.common.constant.CommonEmun.OperationStatus;
import com.didi.common.exception.ArgumentException;
import com.didi.common.exception.ExceptionType;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.Menu;
import com.didi.didims.pojo.Result;
import com.didi.didims.pojo.User;
import com.didi.didims.service.IPermissionService;
import com.didi.didims.shiro.bean.ServiceDeskToken;
import com.didi.didims.shiro.util.PasswordPolicy;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 登录控制
 * 
 * @author liaochente
 * 
 */
@Controller("vmanageLoginController")
@RequestMapping(value = "/vmanage/loginManage")
public class LoginController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Resource
    private IPermissionService permissionService;

    /**
     * 跳转平台登录页面
     * 
     * @param view
     * @return
     */
    @RequestMapping(value = "/goLogin")
    public ModelAndView goLogin(ModelAndView view) {
        view.setViewName("vmanage.login");
        return view;
    }

    /**
     * 登录处理-所有登录请求集中处理
     * 
     * @param view
     * @param username
     *            用户名
     * @param password
     *            密码
     * @param roleCode
     *            身份CODE
     * @param session
     * @return
     */
    @RequestMapping(value = "/login")
    @ResponseBody
    public Result login(ModelAndView view, String username, String password, String roleCode, HttpSession session) {
        Result result = new Result();
        ServiceDeskToken token = new ServiceDeskToken(username, password, roleCode);
        try {
            Subject subject = SecurityUtils.getSubject();
            subject.login(token);
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("username", username);
            param.put("identityCode", roleCode);
            User loginUser = this.permissionService.login(param);
            List<Menu> menus = this.permissionService.queryMenuByUser(loginUser);
            loginUser.setMenuList(menus);
            SessionUtils.setCurrentUser(loginUser);
            result.setCode(OperationStatus.R0000000);
        } catch (UnknownAccountException uae) {
            result.setCode(OperationStatus.R0000001);
            token.clear();
            log.info("用户认证失败,用户名错误,username: {}, password:{}, roleCode:{},exception:{}", new Object[] { username, password, roleCode, uae });
        } catch (IncorrectCredentialsException ice) {
            result.setCode(OperationStatus.R0000001);
            token.clear();
            log.info("用户认证失败,密码错误,username: {}, password:{}, roleCode:{},exception:{}", new Object[] { username, password, roleCode, ice });
        } catch (LockedAccountException lae) {
            result.setCode(OperationStatus.R0000002);
            token.clear();
            log.info("用户认证失败,用户锁定,username: {}, password:{}, roleCode:{},exception:{}", new Object[] { username, password, roleCode, lae });
        } catch (ExcessiveAttemptsException e) {
            result.setCode(OperationStatus.R0000002);
            token.clear();
            log.info("用户认证失败,用户锁定redis,username: {}, password:{}, roleCode:{},exception:{}", new Object[] { username, password, roleCode, e });
        } catch (AuthenticationException e) {
            result.setCode(OperationStatus.R9999999);
            token.clear();
            log.info("登录异常,username: {}, password:{}, roleCode:{},exception:{}", new Object[] { username, password, roleCode, e });
        }
        return result;
    }

    /**
     * 平台登录后首页
     * 
     * @param view
     * @return
     */
    @RequestMapping(value = "/index/list")
    public ModelAndView index(ModelAndView view) {
        view.setViewName("vmanage.index");
        return view;
    }

    /**
     * 修改密码
     * 
     * @param identityCode
     * @param oldPassword
     * @param newPassword
     * @return
     */

    @RequestMapping(value = "/editPassword")
    @ResponseBody
    public Result editPassword(Identity identityCode, String oldPassword, String newPassword) {
        Result result = new Result();
        try {
            User user = SessionUtils.getCurrentUser();
            String salt = user.getSalt();
            String pwd = user.getPassword();
            if (pwd == null || salt == null) {
                throw new ArgumentException(OperationStatus.R0000005);
            }
            oldPassword = PasswordPolicy.passwordEncryt(user.getUsername(), oldPassword, salt);
            newPassword = PasswordPolicy.passwordEncryt(user.getUsername(), newPassword, salt);
            if (!pwd.equals(oldPassword)) {
                throw new ArgumentException(OperationStatus.R0000006);
            }
            permissionService.updateUserPassword(user.getId(), newPassword);
            result.setCode(OperationStatus.R0000000);
        } catch (ArgumentException e) {
            result.setCode(e.getStatus());
        } catch (Exception e) {
            result.setCode(OperationStatus.R9999999);
            log.error(ExceptionType.SYSTEM, e);
        }
        return result;
    }

}
