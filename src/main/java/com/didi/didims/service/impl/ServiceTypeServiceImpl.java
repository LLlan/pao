package com.didi.didims.service.impl;

import com.didi.didims.pojo.ServiceType;

import java.util.List;
import java.util.Map;

import com.didi.common.constant.Config;
import com.didi.common.constant.RedisKeys;
import com.didi.common.pojo.Page;
import com.didi.common.pojo.UploadFile;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.csource.client.Client;
import org.csource.client.DeleteServerException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.didi.didims.dao.IServiceTypeDao;
import com.didi.didims.redis.IRedisDao;
import com.didi.didims.service.IServiceTypeService;

@Service
public class ServiceTypeServiceImpl implements IServiceTypeService {

    @Resource
    private IServiceTypeDao serviceTypeDao;

    @Resource
    private IRedisDao redisDao;

    @Override
    public Page queryServiceTypePageList(ServiceType param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<ServiceType> list = serviceTypeDao.queryServiceTypePageList(map);
        int total = serviceTypeDao.queryServiceTypePageListCount(map);
        // 拼接URL
        String picUrlRediskey = RedisKeys.CORE_CONFIG + Config.PIC_URL.getId();
        if (redisDao.exists(picUrlRediskey) && total > 0) {
            String picUrlPrefix = redisDao.get(picUrlRediskey).toString();
            for (ServiceType s : list) {
                if (!StringUtils.isEmpty(s.getPicUrl())) {
                    s.setPicUrl(picUrlPrefix + s.getPicUrl());
                }
                if (!StringUtils.isEmpty(s.getLogoFile())) {
                    s.setLogoFile(picUrlPrefix + s.getLogoFile());
                }
            }
        }
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public ServiceType queryServiceType(ServiceType param) {
        ServiceType result = null;
        List<ServiceType> list = serviceTypeDao.queryServiceTypeList(param.toParam());
        if (list != null && list.size() > 0) {
            result = list.get(0);
            // 拼接URL
            String picUrlRediskey = RedisKeys.CORE_CONFIG + Config.PIC_URL.getId();
            if (redisDao.exists(picUrlRediskey)) {
                String picUrlPrefix = redisDao.get(picUrlRediskey).toString();
                if (!StringUtils.isEmpty(result.getPicUrl())) {
                    result.setPicUrl(picUrlPrefix + result.getPicUrl());
                }
                if (!StringUtils.isEmpty(result.getLogoFile())) {
                    result.setLogoFile(picUrlPrefix + result.getLogoFile());
                }

            }
        }
        return result;
    }

    @Override
    public List<ServiceType> queryServiceTypeList(ServiceType param) {
        return serviceTypeDao.queryServiceTypeList(param.toParam());
    }

    /**
     * 新增分类信息
     * 
     * @param param
     * @param logoUploadFile
     * @param picUploadFile
     */
    @SuppressWarnings("deprecation")
    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void insertServiceType(ServiceType param, UploadFile logoUploadFile, UploadFile picUploadFile) {
        Client fileClient = new Client();
        String logoId = fileClient.upload(logoUploadFile.getFiles(), logoUploadFile.getExtName(), null);
        if (logoId == null) {// 上传失败

        }
        String picId = fileClient.upload(picUploadFile.getFiles(), picUploadFile.getExtName(), null);
        if (picId == null) {// 上传失败

        }
        param.setLogoFile(logoId);
        param.setPicUrl(picId);
        serviceTypeDao.insertServiceType(param);
    }

    /**
     * 修改分类信息
     * 
     * @param param
     * @param logoUploadFile
     * @param picUploadFile
     * @throws DeleteServerException
     */
    @SuppressWarnings("deprecation")
    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void updateServiceType(ServiceType param, UploadFile logoUploadFile, UploadFile picUploadFile) throws DeleteServerException {
        // 获取旧的图片地址
        ServiceType oldServiceType = new ServiceType();
        oldServiceType.setId(param.getId());
        List<ServiceType> list = serviceTypeDao.queryServiceTypeList(param.toParam());
        if (list != null && list.size() > 0) {
            oldServiceType = list.get(0);
        }
        // 上传
        if (logoUploadFile != null) {
            Client fileClient = new Client();
            String logoId = fileClient.upload(logoUploadFile.getFiles(), logoUploadFile.getExtName(), null);
            if (logoId == null) {// 上传失败

            }
            if (!StringUtils.isEmpty(oldServiceType.getLogoFile()))
                fileClient.delete(oldServiceType.getLogoFile());
            param.setLogoFile(logoId);
        }
        if (picUploadFile != null) {
            Client fileClient = new Client();
            String picId = fileClient.upload(picUploadFile.getFiles(), picUploadFile.getExtName(), null);
            if (picId == null) {// 上传失败

            }
            if (!StringUtils.isEmpty(oldServiceType.getPicUrl()))
                fileClient.delete(oldServiceType.getPicUrl());
            param.setPicUrl(picId);
        }
        serviceTypeDao.updateServiceType(param);
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void deleteServiceType(ServiceType param) {
        serviceTypeDao.deleteServiceType(param);
    }

}