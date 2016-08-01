package com.didi.didims.controller.vmanage;

import java.math.BigDecimal;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.didi.common.constant.CommonEmun.OperationStatus;
import com.didi.common.constant.CommonEmun.Request;
import com.didi.common.constant.Dict;
import com.didi.common.exception.ExceptionType;
import com.didi.common.pojo.Page;
import com.didi.common.pojo.UploadFile;
import com.didi.common.util.FileUtil;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.Homemaking;
import com.didi.didims.pojo.Result;
import com.didi.didims.service.IHomemakingService;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 家政公司管理
 * 
 * @author liushijie
 * 
 */
@Controller("homemakingControllor")
@RequestMapping(value = "/vmanage/homemakingManage")
public class HomemakingControllor {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

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
    public ModelAndView list(ModelAndView view, Homemaking param, Page page) {
        page = this.homemakingService.queryHomemakingPageList(param, page);
        view.setViewName("vmanage.homemakingManage.list");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        return view;
    }

    /**
     * 跳转新增页面
     */
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpServletRequest request, ModelAndView view) {
        view.setViewName("vmanage.homemakingManage.add");
        return view;
    }
    
    /**
     * 新增信息
     * @param request
     * @param file
     * @return
     */
    @SuppressWarnings("deprecation")
    @RequestMapping(value = "/add/exec")
    @ResponseBody
    public Result addExec(HttpServletRequest request, MultipartFile file) {
        Result result = new Result();
        String account = request.getParameter("account").toString();
        String name = request.getParameter("name").toString();
        BigDecimal homemakingGrade = new BigDecimal(request.getParameter("homemakingGrade").toString());
        BigDecimal balance = new BigDecimal(request.getParameter("balance").toString());
        String phoneNumber = request.getParameter("phoneNumber").toString();
        String introduction = request.getParameter("introduction").toString();
        try {
            Homemaking homemaking = new Homemaking();
            homemaking.setAccount(account);
            homemaking.setName(name);
            homemaking.setBalance(balance);
            homemaking.setHomemakingGrade(homemakingGrade);
            homemaking.setPhoneNumber(phoneNumber);
            homemaking.setIntroduction(introduction);
            homemaking.setCreateUser(SessionUtils.getCurrentUser().getId());
            homemaking.setCreateTime(new Date());
            homemaking.setStatus(Dict.COMMON_STATUS.USED.toString());

            UploadFile logoUploadFile = null;
            if (file != null) {
                logoUploadFile = new UploadFile();
                logoUploadFile.setFileName(file.getOriginalFilename());
                logoUploadFile.setExtName(FileUtil.getExtName(file.getOriginalFilename()));
                logoUploadFile.setFiles(file.getBytes());
            }
            homemakingService.insertHomemaking(homemaking, logoUploadFile);
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }
    
    /**
     * 跳转编辑页面
     * @param view
     * @param param
     * @return
     */
    @RequestMapping(value = "/edit")
    public ModelAndView edit(ModelAndView view, Homemaking param) {
        Homemaking homemaking = homemakingService.queryHomemaking(param);
        view.setViewName("vmanage.homemakingManage.edit");
        view.addObject(Request.PAGE_DATA.toString(), homemaking);
        return view;
    }

    /**
     * 更新信息
     * @param request
     * @param file
     * @return
     */
    @SuppressWarnings("deprecation")
    @RequestMapping(value = "/edit/exec")
    @ResponseBody
    public Result editExec(HttpServletRequest request, MultipartFile file) {
        Result result = new Result();
        Long id = Long.parseLong(request.getParameter("id").toString());
        String name = request.getParameter("name").toString();
        BigDecimal balance = new BigDecimal(request.getParameter("balance").toString());
        BigDecimal homemakingGrade = new BigDecimal(request.getParameter("homemakingGrade").toString());
        String phoneNumber = request.getParameter("phoneNumber").toString();
        String introduction = request.getParameter("introduction").toString();
        try {
            Homemaking homemaking = new Homemaking();
            homemaking.setId(id);
            homemaking.setName(name);
            homemaking.setBalance(balance);
            homemaking.setHomemakingGrade(homemakingGrade);
            homemaking.setPhoneNumber(phoneNumber);
            homemaking.setIntroduction(introduction);
            homemaking.setUpdateUser(SessionUtils.getCurrentUser().getId());
            homemaking.setUpdateTime(new Date());

            UploadFile logoUploadFile = null;
            if (file != null) {
                logoUploadFile = new UploadFile();
                logoUploadFile.setFileName(file.getOriginalFilename());
                logoUploadFile.setExtName(FileUtil.getExtName(file.getOriginalFilename()));
                logoUploadFile.setFiles(file.getBytes());
            }

            homemakingService.updateHomemaking(homemaking, logoUploadFile);
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }
    
    /**
     * 密码重置
     * @param request
     * @param homemaking
     * @return
     */
    @RequestMapping(value = "/resetPassword/exec")
    @ResponseBody
    public Result resetPassword(HttpServletRequest request, Homemaking homemaking) {
        Result result = new Result();
        try {
            homemakingService.resetPassword(homemaking);
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }

}
