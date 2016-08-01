package com.didi.didims.controller.vmanage;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.didi.common.constant.CommonEmun.Identity;
import com.didi.common.constant.CommonEmun.Request;
import com.didi.common.constant.Dict;
import com.didi.common.pojo.Page;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.Opinion;
import com.didi.didims.service.IOpinionService;

/**
 * 用户意见反馈
 * @author liushijie
 *
 */
@Controller("opinionControllor")
@RequestMapping(value = "/vmanage/opinionManage")
public class OpinionController {
    
    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Resource
    private IOpinionService opinionService;
    
    
    /**
     * 跳转-查询分页列表
     * 
     * @param view
     * @param param
     * @param page
     * @return
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(ModelAndView view, Opinion param, Page page) {
        page = this.opinionService.queryOpinionPageList(param, page);
        view.setViewName("vmanage.opinionManage.list");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        view.addObject("appuserTypeList", Dict.APPUSER_TYPE.values());
        return view;
    }

}
