package com.didi.didims.controller.vhousekeeping;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.didi.common.constant.Dict;
import com.didi.common.constant.CommonEmun.OperationStatus;
import com.didi.common.constant.CommonEmun.Request;
import com.didi.common.exception.ExceptionType;
import com.didi.common.pojo.Page;
import com.didi.common.pojo.UploadFile;
import com.didi.common.util.FileUtil;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.Appuser;
import com.didi.didims.pojo.Result;
import com.didi.didims.service.IAppuserService;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 
 * @author liushijie
 *
 */
@Controller("appuserController")
@RequestMapping(value = "/vhousekeeping/appuserManage")
public class AppuserController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Resource
    private IAppuserService appuserService;

    /**
     * 跳转-查询分页列表
     * 
     * @param view
     * @param param
     * @param page
     * @return
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(ModelAndView view, Appuser param, Page page) {
        Long homemakingId = SessionUtils.getCurrentUser().getHomemakingId();
        param.setHomemakingId(homemakingId);
        
        page = this.appuserService.queryAppuserPageList(param, page);
        view.setViewName("vhousekeeping.appuserManage.list");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        view.addObject("statusList", Dict.COMMON_STATUS.values());
        return view;
    }
    
    /**
     * 跳转新增页面
     */
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpServletRequest request, ModelAndView view) {
        view.setViewName("vhousekeeping.appuserManage.add");
        return view;
    }

    /**
     * 新增信息
     * 
     * @param request
     * @param manageRole
     * @return
     */
    @SuppressWarnings("deprecation")
    @RequestMapping(value = "/add/exec")
    @ResponseBody
    public Result addExec(HttpServletRequest request, MultipartFile file, Appuser appuser) {
        Result result = new Result();
        Long homemakingId = SessionUtils.getCurrentUser().getHomemakingId();
        try {
            appuser.setHomemakingId(homemakingId);
            appuser.setType(Dict.APPUSER_TYPE.WORKER.toString());
            appuser.setCreateTime(new Date());
            appuser.setStatus(Dict.COMMON_STATUS.USED.toString());

            UploadFile picUploadFile = null;
            if (file != null) {
                picUploadFile = new UploadFile();
                picUploadFile.setFileName(file.getOriginalFilename());
                picUploadFile.setExtName(FileUtil.getExtName(file.getOriginalFilename()));
                picUploadFile.setFiles(file.getBytes());
            }
            String r = appuserService.insertAppuser(appuser, picUploadFile);
            if("repeat_account".equals(r)){
                result.setCode(OperationStatus.R0000011);
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
     * 跳转编辑页面
     * 
     * @param request
     * @param view
     * @return
     */
    @RequestMapping(value = "/edit")
    public ModelAndView edit(ModelAndView view, Appuser param) {
        Appuser appuser = appuserService.queryAppuser(param);
        view.setViewName("vhousekeeping.appuserManage.edit");
        view.addObject(Request.PAGE_DATA.toString(), appuser);
        return view;
    }
    
    /**
     * 更新信息
     * 
     * @param request
     * @param manageRole
     * @return
     */
    @SuppressWarnings("deprecation")
    @RequestMapping(value = "/edit/exec")
    @ResponseBody
    public Result editExec(HttpServletRequest request, MultipartFile file, Appuser param) {
        Result result = new Result();
        try {
            UploadFile picUploadFile = null;
            if (file != null) {
                picUploadFile = new UploadFile();
                picUploadFile.setFileName(file.getOriginalFilename());
                picUploadFile.setExtName(FileUtil.getExtName(file.getOriginalFilename()));
                picUploadFile.setFiles(file.getBytes());
            }
            String r = appuserService.updateAppuser(param, picUploadFile);
            if("repeat_account".equals(r)){
                result.setCode(OperationStatus.R0000011);
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
     * 启用
     * 
     * @param request
     * @param manageRole
     * @return
     */
    @RequestMapping(value = "/turnon/exec")
    @ResponseBody
    public Result turnonExec(HttpServletRequest request, Appuser param) {
        Result result = new Result();
        try {
            String r = appuserService.turnonExec(param);
            if("repeat_account".equals(r)){
                result.setCode(OperationStatus.R0000011);
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
     * 停用
     * 
     * @param request
     * @param manageRole
     * @return
     */
    @RequestMapping(value = "/shut/exec")
    @ResponseBody
    public Result shutExec(HttpServletRequest request, Appuser param) {
        Result result = new Result();
        try {
            appuserService.shutExec(param);
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }
    
}
