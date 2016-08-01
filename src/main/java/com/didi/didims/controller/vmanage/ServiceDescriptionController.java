package com.didi.didims.controller.vmanage;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.didi.common.constant.Dict;
import com.didi.common.constant.CommonEmun.OperationStatus;
import com.didi.common.constant.CommonEmun.Request;
import com.didi.common.exception.ExceptionType;
import com.didi.common.pojo.Page;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.Result;
import com.didi.didims.pojo.ServiceDescription;
import com.didi.didims.pojo.ServiceType;
import com.didi.didims.service.IServiceDescriptionService;
import com.didi.didims.service.IServiceTypeService;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 服务描述
 * 
 * @author liushijie
 * 
 */
@Controller("serviceDescriptionControllor")
@RequestMapping(value = "/vmanage/serviceTypeManage/serviceDescriptionManage")
public class ServiceDescriptionController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Resource
    private IServiceDescriptionService serviceDescriptionService;

    @Resource
    private IServiceTypeService serviceTypeService;

    /**
     * 跳转-查询分页列表
     * 
     * @param view
     * @param param
     * @param page
     * @return
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(ModelAndView view, ServiceDescription param, Page page) {
        ServiceType serviceType = new ServiceType();
        serviceType.setId(param.getServiceTypeId());
        serviceType = serviceTypeService.queryServiceType(serviceType);
        param.setServiceTypeName(serviceType.getTypeName());

        page = this.serviceDescriptionService.queryServiceDescriptionPageList(param, page);
        view.setViewName("vmanage.serviceDescriptionManage.list");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        return view;
    }

    /**
     * 跳转新增页面
     */
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpServletRequest request, ModelAndView view, ServiceDescription param) {
        view.setViewName("vmanage.serviceDescriptionManage.add");
        view.addObject(Request.PARAMS.toString(), param);
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
    public Result addExec(HttpServletRequest request, ServiceDescription param) {
        Result result = new Result();
        try {
            param.setCreateUser(SessionUtils.getCurrentUser().getId());
            param.setCreateTime(new Date());
            param.setStatus(Dict.COMMON_STATUS.USED.toString());
            serviceDescriptionService.insertServiceDescription(param);
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
    public ModelAndView edit(ModelAndView view, ServiceDescription param) {
        ServiceDescription serviceDescription = serviceDescriptionService.queryServiceDescription(param);
        view.setViewName("vmanage.serviceDescriptionManage.edit");
        view.addObject(Request.PAGE_DATA.toString(), serviceDescription);
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
    public Result editExec(HttpServletRequest request, ServiceDescription param) {
        Result result = new Result();
        try {
            param.setUpdateUser(SessionUtils.getCurrentUser().getId());
            param.setUpdateTime(new Date());

            
            serviceDescriptionService.updateServiceDescription(param);
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }
}
