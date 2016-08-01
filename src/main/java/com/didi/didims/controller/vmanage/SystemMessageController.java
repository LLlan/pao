package com.didi.didims.controller.vmanage;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.didi.common.constant.CommonEmun.OperationStatus;
import com.didi.common.constant.CommonEmun.Request;
import com.didi.common.exception.ExceptionType;
import com.didi.common.pojo.Page;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.Result;
import com.didi.didims.pojo.SystemMessage;
import com.didi.didims.service.ISystemMessageService;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 系统通知
 * @author liushijie
 *
 */
@Controller("systemMessageControllor")
@RequestMapping(value = "/vmanage/systemMessageManage")
public class SystemMessageController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Resource
    private ISystemMessageService systemMessageService;

    /**
     * 跳转-查询分页列表
     * 
     * @param view
     * @param param
     * @param page
     * @return
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(ModelAndView view, SystemMessage param, Page page) {
        page = this.systemMessageService.querySystemMessagePageList(param, page);
        view.setViewName("vmanage.systemMessageManage.list");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        return view;
    }

    /**
     * 跳转新增页面
     */
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpServletRequest request, ModelAndView view) {
        view.setViewName("vmanage.systemMessageManage.add");
        return view;
    }


    /**
     * 新增信息
     * @param request
     * @param param
     * @return
     */
    @RequestMapping(value = "/add/exec")
    @ResponseBody
    public Result addExec(HttpServletRequest request, SystemMessage param) {
        Result result = new Result();
        try {
            param.setCreateTime(new Date());
            param.setCreateUser(SessionUtils.getCurrentUser().getId());
            systemMessageService.insertSystemMessage(param);
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }
    
    
    
}
