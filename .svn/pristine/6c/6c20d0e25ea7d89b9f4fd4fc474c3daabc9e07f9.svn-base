package com.didi.didims.controller.vmanage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.didi.common.constant.CommonEmun.Identity;
import com.didi.common.constant.CommonEmun.OperationStatus;
import com.didi.common.constant.CommonEmun.Request;
import com.didi.common.exception.ExceptionType;
import com.didi.common.pojo.Page;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.Result;
import com.didi.didims.pojo.Role;
import com.didi.didims.pojo.Tree;
import com.didi.didims.service.IPermissionService;
import com.didi.didims.service.IRoleService;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 角色管理
 * 
 * @author liaochente
 * 
 */
@Controller
@RequestMapping(value = "/vmanage/roleManage")
public class RoleController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Resource
    private IRoleService manageRoleService;

    @Resource
    private IPermissionService managePermisssionService;

    /**
     * 跳转-查询分页列表
     * 
     * @param view
     * @param param
     * @param page
     * @return
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(ModelAndView view, Role param, Page page) {
        page = this.manageRoleService.queryRolePageList(param, page);
        view.setViewName("vmanage.roleManage.list");
        view.addObject("identitys", Identity.values());
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        return view;
    }

    /**
     * 跳转新增页面
     */
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpServletRequest request, ModelAndView view) {
        view.setViewName("vmanage.roleManage.add");
        view.addObject("identitys", Identity.values());
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
    public Result addExec(HttpServletRequest request, Role manageRole, String functions) {
        Result result = new Result();
        try {
            manageRole.setCreateBy(SessionUtils.getCurrentUser().getId());
            manageRoleService.insertRole(manageRole, functions);
            result.setCode(OperationStatus.R0000000);
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
    public Result removeExec(HttpServletRequest request, Role manageRole) {
        Result result = new Result();
        try {
            manageRoleService.deleteRole(manageRole);
            result.setCode(OperationStatus.R0000000);
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
    public ModelAndView edit(ModelAndView view, Role param) {
        Role manageRole = manageRoleService.queryRole(param);
        view.setViewName("vmanage.roleManage.edit");
        view.addObject(Request.PAGE_DATA.toString(), manageRole);
        view.addObject("identitys", Identity.values());
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
    public Result editExec(HttpServletRequest request, Role manageRole, String functions) {
        Result result = new Result();
        try {
            manageRoleService.updateRole(manageRole, functions);
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }

    /**
     * 查询当前登陆人当前身份拥有的菜单权限
     * 
     * @return
     */
    @RequestMapping(value = "/queryTreeData")
    @ResponseBody
    public Result queryMenuTreeListByIdentity(String roleId, Identity identityCode) {
        Result result = new Result();
        Map<String, Object> map = new HashMap<String, Object>();
        if (StringUtils.isNotEmpty(roleId)) {
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("id", roleId);
            List<Map<String, Object>> perms = managePermisssionService.queryPermissionsByRole(param);
            List<Object> selecteds = new ArrayList<Object>();
            for (Map<String, Object> p : perms) {
                selecteds.add(p.get("menuFunctionId"));
            }
            map.put("perms", selecteds);
        }
        List<Tree> trees = managePermisssionService.queryMenuFunctionTreeListByIdentity(identityCode);
        map.put("tree", trees);
        result.setCode(OperationStatus.R0000000);
        result.setData(map);
        return result;
    }

}
