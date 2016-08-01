package com.didi.didims.controller.vmanage;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.didi.common.constant.CommonEmun.Identity;
import com.didi.common.constant.CommonEmun.OperationStatus;
import com.didi.common.constant.CommonEmun.Request;
import com.didi.common.exception.BusinessException;
import com.didi.common.exception.ExceptionType;
import com.didi.common.pojo.Page;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.Result;
import com.didi.didims.pojo.Role;
import com.didi.didims.pojo.User;
import com.didi.didims.service.IRoleService;
import com.didi.didims.service.IUserService;

/**
 * 用户管理
 * 
 * @author liaochente
 * 
 */
@Controller
@RequestMapping(value = "/vmanage/userManage")
public class UserController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Resource
    private IRoleService manageRoleService;

    @Resource
    private IUserService userService;

    /**
     * 跳转-查询分页列表
     * 
     * @param view
     * @param param
     * @param page
     * @return
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(ModelAndView view, User param, Page page) {
        page = this.userService.queryUserPageList(param, page);
        Role roleParam = new Role();
        roleParam.setIdentityCode(Identity.ADMIN.toString());
        view.setViewName("vmanage.userManage.list");
        view.addObject("roles", manageRoleService.queryRoleList(roleParam));
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        return view;
    }

    /**
     * 跳转新增页面
     */
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpServletRequest request, ModelAndView view) {
        Role roleParam = new Role();
        roleParam.setIdentityCode(Identity.ADMIN.toString());
        view.setViewName("vmanage.userManage.add");
        view.addObject("roles", manageRoleService.queryRoleList(roleParam));
        return view;
    }

    /**
     * 新增信息
     * 
     * @param request
     * @param manageRole
     * @return
     */
    @RequestMapping(value = "/add/exec")
    @ResponseBody
    public Result addExec(HttpServletRequest request, User param) {
        Result result = new Result();
        try {
            userService.insertUser(param);
            result.setCode(OperationStatus.R0000000);
        } catch (BusinessException e) {
            result.setCode(e.getStatus());
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }

    /**
     * 跳转编辑页面
     * 
     * @param request
     * @param view
     * @return
     */
    @RequestMapping(value = "/edit")
    public ModelAndView edit(ModelAndView view, User param) {
        Role roleParam = new Role();
        roleParam.setIdentityCode(Identity.ADMIN.toString());
        User item = userService.queryUser(param);
        view.setViewName("vmanage.userManage.edit");
        view.addObject(Request.PAGE_DATA.toString(), item);
        view.addObject("roles", manageRoleService.queryRoleList(roleParam));
        return view;
    }

    /**
     * 更新信息
     * 
     * @param request
     * @param manageRole
     * @return
     */
    @RequestMapping(value = "/edit/exec")
    @ResponseBody
    public Result editExec(HttpServletRequest request, User param) {
        Result result = new Result();
        try {
            userService.updateUser(param);
            result.setCode(OperationStatus.R0000000);
        } catch (BusinessException e) {
            result.setCode(e.getStatus());
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }

    /**
     * 删除信息
     * 
     * @param request
     * @param manageRole
     * @return
     */
    @RequestMapping(value = "/remove/exec")
    @ResponseBody
    public Result removeExec(HttpServletRequest request, User param) {
        Result result = new Result();
        try {
            userService.deleteUser(param);
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }

}
