package com.didi.didims.controller.vhousekeeping;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.didi.common.constant.Dict;
import com.didi.common.constant.CommonEmun.Request;
import com.didi.common.pojo.Page;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.Homemaking;
import com.didi.didims.pojo.HomemakingService;
import com.didi.didims.pojo.Order;
import com.didi.didims.service.IHomemakingService;
import com.didi.didims.service.IHomemakingServiceService;
import com.didi.didims.service.IOrderService;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 订单信息管理
 * @author liushijie
 *
 */
@Controller("orderController")
@RequestMapping(value = "/vhousekeeping/orderManage")
public class OrderController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Resource
    private IOrderService orderService;
    
    @Resource
    private IHomemakingServiceService homemakingServiceService;
    @Resource
    private IHomemakingService homemakingService;
    

    /**
     * 跳转-查询分页列表
     * 
     * @param view
     * @param param
     * @param page
     * @return
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(ModelAndView view, Order param, Page page) {
        Long homemakingId = SessionUtils.getCurrentUser().getHomemakingId();
        Homemaking homemaking = new Homemaking();
        homemaking.setId(homemakingId);
        homemaking = homemakingService.queryHomemaking(homemaking);
        
        HomemakingService homemakingService = new HomemakingService();
        homemakingService.setHomemakingId(homemakingId);
        List<HomemakingService> serviceTypeList = homemakingServiceService.queryHomemakingServiceList(homemakingService);
        param.setHomemakingId(homemakingId);
        page = this.orderService.queryOrderPageList(param, page);
        view.setViewName("vhousekeeping.orderManage.list");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        view.addObject("serviceTypeList", serviceTypeList);
        view.addObject("homemaking", homemaking);
        return view;
    }

}
