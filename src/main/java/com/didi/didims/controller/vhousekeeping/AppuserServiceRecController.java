package com.didi.didims.controller.vhousekeeping;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.didi.common.constant.CommonEmun.OperationStatus;
import com.didi.common.constant.CommonEmun.Request;
import com.didi.common.constant.Dict;
import com.didi.common.exception.ExceptionType;
import com.didi.common.pojo.Page;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.Appuser;
import com.didi.didims.pojo.AppuserServiceRec;
import com.didi.didims.pojo.HomemakingService;
import com.didi.didims.pojo.Result;
import com.didi.didims.service.IAppuserService;
import com.didi.didims.service.IAppuserServiceRecService;
import com.didi.didims.service.IHomemakingServiceService;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 维修人员服务项
 * @author liushijie
 *
 */
@Controller("appuserServiceRecController")
@RequestMapping(value = "/vhousekeeping/appuserManage/appuserServiceRecManage")
public class AppuserServiceRecController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Resource
    private IAppuserServiceRecService appuserServiceRecService;
    
    @Resource
    private IAppuserService appuserService;

    @Resource
    private IHomemakingServiceService homemakingServiceService;
    
    /**
     * 跳转-查询分页列表
     * 
     * @param view
     * @param param
     * @param page
     * @return
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(ModelAndView view, AppuserServiceRec param, Page page) {
        Appuser appuser = new Appuser();
        appuser.setId(param.getAppuserId());
        appuser = appuserService.queryAppuser(appuser);
        param.setAppuserName(appuser.getNickname());
        page = this.appuserServiceRecService.queryAppuserServiceRecPageList(param, page);
        view.setViewName("vhousekeeping.appuserServiceRecManage.list");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        return view;
    }

    /**
     * 跳转新增页面
     */
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpServletRequest request, ModelAndView view, AppuserServiceRec param) {
        Long homemakingId = SessionUtils.getCurrentUser().getHomemakingId();
        HomemakingService homemakingService = new HomemakingService();
        homemakingService.setHomemakingId(homemakingId);
        homemakingService.setStatus(Dict.COMMON_STATUS.USED.toString());
        List<HomemakingService> HomemakinServiceList = homemakingServiceService.queryHomemakingServiceList(homemakingService);
        view.setViewName("vhousekeeping.appuserServiceRecManage.add");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject("HomemakinServiceList", HomemakinServiceList);
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
    public Result addExec(HttpServletRequest request,Long[] serviceTypeChooseN, AppuserServiceRec param) {
        Result result = new Result();
        try {
            Long appuserId = param.getAppuserId();
            List<Long> serviceTypeIdList = Arrays.asList(serviceTypeChooseN);
            String r = appuserServiceRecService.insertHomemakingService(appuserId, serviceTypeIdList);
            if("repeat_service".equals(r)){
                result.setCode(OperationStatus.R0000012);
            }else{
                result.setCode(OperationStatus.R0000000);
            }
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }

    /**
     * 删除
     * 
     * @param request
     * @param manageRole
     * @return
     */
    @RequestMapping(value = "/remove/exec")
    @ResponseBody
    public Result removeExec(HttpServletRequest request, AppuserServiceRec param) {
        Result result = new Result();
        try {
            appuserServiceRecService.deleteAppuserServiceRec(param);
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }
}
