package com.didi.didims.controller.vmanage;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.csource.client.Client;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.didi.common.constant.CommonEmun.Identity;
import com.didi.common.constant.CommonEmun.OperationStatus;
import com.didi.common.constant.CommonEmun.Request;
import com.didi.common.constant.Config;
import com.didi.common.constant.Dict.APP_CATEGORY;
import com.didi.common.constant.Dict.APP_TYPE;
import com.didi.common.constant.Dict.YES_OR_NO;
import com.didi.common.constant.RedisKeys;
import com.didi.common.exception.ExceptionType;
import com.didi.common.pojo.Page;
import com.didi.common.util.FileUtil;
import com.didi.didims.log.LoggerFactory;
import com.didi.didims.pojo.AppVersion;
import com.didi.didims.pojo.Result;
import com.didi.didims.pojo.Role;
import com.didi.didims.redis.IRedisDao;
import com.didi.didims.service.IAppVersionService;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * APP版本管理
 * 
 * @author liaochente
 * 
 */
@Controller
@RequestMapping(value = "/vmanage/appVersionManage")
public class AppVersionManageController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

    @Autowired
    private IAppVersionService appVersionService;

    @Resource
    private IRedisDao redisDao;

    /**
     * 文件上传对象
     */
    private Client client = new Client();

    /**
     * 跳转-查询分页列表
     * 
     * @param view
     * @param version_number
     * @param isShow
     * @param updateInstall
     * @param identityId
     * @param estateId
     * @param page
     * @return
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(ModelAndView view, String versionNumber, YES_OR_NO isShow, YES_OR_NO updateInstall, APP_CATEGORY category, APP_TYPE type, Page page) {
        AppVersion param = new AppVersion();
        param.setVersionNumber(versionNumber);
        if (isShow != null) {
            param.setIsShow(isShow.toString());
        }
        if (updateInstall != null) {
            param.setUpdateInstall(updateInstall.toString());
        }
        if (type != null) {
            param.setType(type.toString());
        }
        if (category != null) {
            param.setCategory(category.toString());
        }
        page = this.appVersionService.queryAppVersionPageList(param, page);
        view.setViewName("vmanage.appVersionManage.list");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        view.addObject("androidFix", redisDao.get(RedisKeys.CORE_CONFIG + Config.ANDROID_URL.getId()));
        view.addObject("iosFix", redisDao.get(RedisKeys.CORE_CONFIG + Config.PLIST_URL.getId()));
        view.addObject("yesOrNos", YES_OR_NO.values());
        view.addObject("types", APP_TYPE.values());
        view.addObject("categorys", APP_CATEGORY.values());
        return view;
    }

    /**
     * 跳转新增页面
     */
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpServletRequest request, ModelAndView view) {
        view.setViewName("vmanage.appVersionManage.add");
        view.addObject("yesOrNos", YES_OR_NO.values());
        view.addObject("types", APP_TYPE.values());
        view.addObject("categorys", APP_CATEGORY.values());
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
    public Result addExec(HttpServletRequest request, AppVersion param, MultipartFile file) {
        Result result = new Result();
        try {
            if (file != null && !file.isEmpty()) {
                String extName = FileUtil.getExtName(file.getOriginalFilename());
                String groupId = client.upload(file.getBytes(), extName, null);
                param.setFilePath(groupId);
            }
            param.setUpdateTime(new Date());
            this.appVersionService.insertAppVersion(param);
            // 如果是IOS版，要同时上传PLIST文件
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
    public ModelAndView edit(ModelAndView view, AppVersion param) {
        view.setViewName("vmanage.appVersionManage.edit");
        view.addObject("yesOrNos", YES_OR_NO.values());
        view.addObject("types", APP_TYPE.values());
        view.addObject("categorys", APP_CATEGORY.values());
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
    public Result editExec(HttpServletRequest request, AppVersion param, MultipartFile file) {
        Result result = new Result();
        try {
            AppVersion av = new AppVersion();
            av.setId(param.getId());
            av = this.appVersionService.queryAppVersion(av);
            if (file != null && !file.isEmpty()) {
                String extName = FileUtil.getExtName(file.getOriginalFilename());
                String groupId = client.upload(file.getBytes(), extName, null);
                param.setFilePath(groupId);
                client.delete(av.getFilePath());
            }
            param.setUpdateTime(new Date());
            this.appVersionService.updateAppVersion(param);
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
    public Result removeExec(HttpServletRequest request, AppVersion param) {
        Result result = new Result();
        try {
            AppVersion av = new AppVersion();
            av.setId(param.getId());
            av = this.appVersionService.queryAppVersion(av);
            this.appVersionService.deleteAppVersion(param);
            client.delete(av.getFilePath());
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }

}
