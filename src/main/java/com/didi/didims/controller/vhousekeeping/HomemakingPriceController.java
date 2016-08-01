package com.didi.didims.controller.vhousekeeping;

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
import com.didi.common.constant.Dict;
import com.didi.common.exception.ExceptionType;
import com.didi.common.pojo.Page;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.HomemakingPrice;
import com.didi.didims.pojo.HomemakingService;
import com.didi.didims.pojo.Result;
import com.didi.didims.pojo.ServiceDescription;
import com.didi.didims.service.IHomemakingPriceService;
import com.didi.didims.service.IHomemakingServiceService;
import com.didi.didims.service.IServiceDescriptionService;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 家政服务价格
 * 
 * @author liushijie
 * 
 */
@Controller("homemakingPriceController")
@RequestMapping(value = "/vhousekeeping/homemakingServiceManage/homemakingPriceManage")
public class HomemakingPriceController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Resource
    private IHomemakingPriceService homemakingPriceService;

    @Resource
    private IHomemakingServiceService homemakingServiceService;

    @Resource
    private IServiceDescriptionService serviceDescriptionService;

    /**
     * 跳转-查询分页列表
     * 
     * @param view
     * @param param
     * @param page
     * @return
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(ModelAndView view, HomemakingPrice param, Page page) {
        HomemakingService homemakingService = new HomemakingService();
        homemakingService.setId(param.getHomemakingServiceId());
        homemakingService = homemakingServiceService.queryHomemakingService(homemakingService);
        param.setHomemakingServiceName(homemakingService.getServiceTypeName());
        param.setDescriptionStatus(Dict.COMMON_STATUS.USED.toString());

        page = this.homemakingPriceService.queryHomemakingPricePageList(param, page);
        view.setViewName("vhousekeeping.homemakingPriceManage.list");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        return view;
    }

    /**
     * 跳转编辑页面
     * 
     * @param request
     * @param view
     * @return
     */
    @RequestMapping(value = "/edit")
    public ModelAndView edit(ModelAndView view, HomemakingPrice param) {
        HomemakingPrice homemakingPrice = new HomemakingPrice();
        ServiceDescription serviceDescription = new ServiceDescription();
        serviceDescription.setId(param.getServiceDescriptionId());
        serviceDescription = serviceDescriptionService.queryServiceDescription(serviceDescription);

        if (param.getId() == null) {// 新增
            param.setServiceDescriptionName(serviceDescription.getDescription());
            param.setDescriptionRemarks(serviceDescription.getRemarks());
            view.addObject(Request.PAGE_DATA.toString(), param);
        } else {// 修改
            homemakingPrice.setId(param.getId());
            homemakingPrice = homemakingPriceService.queryHomemakingPrice(homemakingPrice);
            homemakingPrice.setServiceTypeId(param.getServiceTypeId());
            homemakingPrice.setServiceDescriptionName(serviceDescription.getDescription());
            homemakingPrice.setDescriptionRemarks(serviceDescription.getRemarks());
            view.addObject(Request.PAGE_DATA.toString(), homemakingPrice);
        }
        view.setViewName("vhousekeeping.homemakingPriceManage.edit");
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
    public Result editExec(HttpServletRequest request, HomemakingPrice param) {
        Result result = new Result();
        try {
            if (param.getId() == null) {// 新增
                param.setCreateUser(SessionUtils.getCurrentUser().getId());
                param.setCreateTime(new Date());
                param.setStatus(Dict.COMMON_STATUS.USED.toString());
                homemakingPriceService.insertHomemakingPrice(param);
            } else {// 修改
                param.setUpdateUser(SessionUtils.getCurrentUser().getId());
                param.setUpdateTime(new Date());
                homemakingPriceService.updateHomemakingPrice(param);
            }
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }

}
