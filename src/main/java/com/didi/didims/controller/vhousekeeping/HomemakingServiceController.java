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
import com.didi.didims.pojo.HomemakingService;
import com.didi.didims.pojo.Result;
import com.didi.didims.pojo.ServiceType;
import com.didi.didims.service.IHomemakingServiceService;
import com.didi.didims.service.IServiceTypeService;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 服务分类
 * @author liushijie
 *
 */
@Controller("homemakingServiceController")
@RequestMapping(value = "/vhousekeeping/homemakingServiceManage")
public class HomemakingServiceController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Resource
    private IHomemakingServiceService homemakingServiceService;

    @Resource
    private IServiceTypeService serviceTypeervice;
    

    /**
     * 跳转-查询分页列表
     * 
     * @param view
     * @param param
     * @param page
     * @return
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(ModelAndView view, HomemakingService param, Page page) {
        Long homemakingId = SessionUtils.getCurrentUser().getHomemakingId();
        param.setHomemakingId(homemakingId);
        page = this.homemakingServiceService.queryHomemakingServicePageList(param, page);
        view.setViewName("vhousekeeping.homemakingServiceManage.list");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        return view;
    }
    
    /**
     * 跳转新增页面
     */
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpServletRequest request, ModelAndView view) {
        ServiceType serviceType = new ServiceType();
        serviceType.setStatus(Dict.COMMON_STATUS.USED.toString());
        List<ServiceType> serviceTypeList = serviceTypeervice.queryServiceTypeList(serviceType);
        view.setViewName("vhousekeeping.homemakingServiceManage.add");
        view.addObject("serviceTypeList", serviceTypeList);
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
    public Result addExec(HttpServletRequest request,Long[] serviceTypeChooseN) {
        Result result = new Result();
        try {
            Long userId = SessionUtils.getCurrentUser().getId();
            Long homemakingId = SessionUtils.getCurrentUser().getHomemakingId();
            List<Long> serviceTypeIdList = Arrays.asList(serviceTypeChooseN);
            String r = homemakingServiceService.insertHomemakingService(userId, homemakingId, serviceTypeIdList);
            if("repeat_type".equals(r)){
                result.setCode(OperationStatus.R0000010);
            }else{
                result.setCode(OperationStatus.R0000000);
            }
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }
    
}
