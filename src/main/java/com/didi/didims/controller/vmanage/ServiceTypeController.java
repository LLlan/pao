package com.didi.didims.controller.vmanage;

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
import com.didi.didims.pojo.Result;
import com.didi.didims.pojo.ServiceType;
import com.didi.didims.service.IServiceTypeService;
import com.didi.didims.shiro.util.SessionUtils;

/**
 * 服务大类
 * 
 * @author liushijie
 * 
 */
@Controller("serviceTypeControllor")
@RequestMapping(value = "/vmanage/serviceTypeManage")
public class ServiceTypeController {

    /**
     * 日志
     */
    private static Logger log = LoggerFactory.getManageBusinLogger();

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
    public ModelAndView list(ModelAndView view, ServiceType param, Page page) {
        page = this.serviceTypeService.queryServiceTypePageList(param, page);
        view.setViewName("vmanage.serviceTypeManage.list");
        view.addObject(Request.PARAMS.toString(), param);
        view.addObject(Request.PAGE.toString(), page);
        return view;
    }

    /**
     * 跳转新增页面
     */
    @RequestMapping(value = "/add")
    public ModelAndView add(HttpServletRequest request, ModelAndView view) {
        view.setViewName("vmanage.serviceTypeManage.add");
        return view;
    }

    /**
     * 新增信息
     * @param request
     * @param logoFile
     * @param picFile
     * @return
     */
    @SuppressWarnings("deprecation")
    @RequestMapping(value = "/add/exec")
    @ResponseBody
    public Result addExec(HttpServletRequest request, MultipartFile logoFile, MultipartFile picFile) {
        Result result = new Result();
        String typeName = request.getParameter("typeName").toString();
        String serviceStandard = request.getParameter("serviceStandard").toString();
        int sort = Integer.parseInt(request.getParameter("sort").toString());
        try {
            ServiceType serviceType = new ServiceType();
            serviceType.setTypeName(typeName);
            serviceType.setServiceStandard(serviceStandard);
            serviceType.setSort(sort);
            serviceType.setCreateUser(SessionUtils.getCurrentUser().getId());
            serviceType.setCreateTime(new Date());
            serviceType.setStatus(Dict.COMMON_STATUS.USED.toString());
            // 上传的文件
            UploadFile logoUploadFile = null;
            UploadFile picUploadFile = null;
            if (logoFile != null) {
                logoUploadFile = new UploadFile();
                logoUploadFile.setFileName(logoFile.getOriginalFilename());
                logoUploadFile.setExtName(FileUtil.getExtName(logoFile.getOriginalFilename()));
                logoUploadFile.setFiles(logoFile.getBytes());
            }
            if (picFile != null) {
                picUploadFile = new UploadFile();
                picUploadFile.setFileName(picFile.getOriginalFilename());
                picUploadFile.setExtName(FileUtil.getExtName(picFile.getOriginalFilename()));
                picUploadFile.setFiles(picFile.getBytes());
            }
            serviceTypeService.insertServiceType(serviceType, logoUploadFile, picUploadFile);
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
    public ModelAndView edit(ModelAndView view, ServiceType param) {
        ServiceType serviceType = serviceTypeService.queryServiceType(param);
        view.setViewName("vmanage.serviceTypeManage.edit");
        view.addObject(Request.PAGE_DATA.toString(), serviceType);
        return view;
    }

    /**
     * 更新信息
     * @param request
     * @param logoFile
     * @param picFile
     * @return
     */
    @SuppressWarnings("deprecation")
    @RequestMapping(value = "/edit/exec")
    @ResponseBody
    public Result editExec(HttpServletRequest request, MultipartFile logoFile, MultipartFile picFile) {
        Result result = new Result();
        Long id = Long.parseLong(request.getParameter("id").toString());
        String typeName = request.getParameter("typeName").toString();
        String serviceStandard = request.getParameter("serviceStandard").toString();
        int sort = Integer.parseInt(request.getParameter("sort").toString());
        try {
            ServiceType serviceType = new ServiceType();
            serviceType.setId(id);
            serviceType.setTypeName(typeName);
            serviceType.setServiceStandard(serviceStandard);
            serviceType.setSort(sort);
            // 上传的文件
            UploadFile logoUploadFile = null;
            UploadFile picUploadFile = null;
            if (logoFile != null) {
                logoUploadFile = new UploadFile();
                logoUploadFile.setFileName(logoFile.getOriginalFilename());
                logoUploadFile.setExtName(FileUtil.getExtName(logoFile.getOriginalFilename()));
                logoUploadFile.setFiles(logoFile.getBytes());
            }
            if (picFile != null) {
                picUploadFile = new UploadFile();
                picUploadFile.setFileName(picFile.getOriginalFilename());
                picUploadFile.setExtName(FileUtil.getExtName(picFile.getOriginalFilename()));
                picUploadFile.setFiles(picFile.getBytes());
            }
            serviceTypeService.updateServiceType(serviceType, logoUploadFile, picUploadFile);
            result.setCode(OperationStatus.R0000000);
        } catch (Exception e) {
            log.error(ExceptionType.SYSTEM, e);
            result.setCode(OperationStatus.R9999999);
        }
        return result;
    }
}
