package com.didi.didims.service.impl;

import com.didi.didims.pojo.Appuser;

import java.util.List;
import java.util.Map;

import com.didi.common.constant.Config;
import com.didi.common.constant.Dict;
import com.didi.common.constant.RedisKeys;
import com.didi.common.pojo.Page;
import com.didi.common.pojo.UploadFile;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.csource.client.Client;
import org.csource.client.DeleteServerException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.didi.didims.dao.IAppuserDao;
import com.didi.didims.redis.IRedisDao;
import com.didi.didims.service.IAppuserService;

@Service
public class AppuserServiceImpl implements IAppuserService {

	@Resource
	private IAppuserDao appuserDao;
	
    @Resource
    private IRedisDao redisDao;
	
	@Override
    public Page queryAppuserPageList(Appuser param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<Appuser> list = appuserDao.queryAppuserPageList(map);
        int total = appuserDao.queryAppuserPageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public Appuser queryAppuser(Appuser param) {
        Appuser result = null;
        List<Appuser> list = appuserDao.queryAppuserList(param.toParam());
        if(list != null && list.size() > 0) {
            result = list.get(0);
            // 拼接URL
            String picUrlRediskey = RedisKeys.CORE_CONFIG + Config.PIC_URL.getId();
            if (redisDao.exists(picUrlRediskey) && !StringUtils.isEmpty(result.getPicUrl())) {
                String picUrlPrefix = redisDao.get(picUrlRediskey).toString();
                result.setPicUrl(picUrlPrefix + result.getPicUrl());
            }
        }
        return result;
    }

    @Override
    public List<Appuser> queryAppuserList(Appuser param) {
        return appuserDao.queryAppuserList(param.toParam());
    }

	@SuppressWarnings("deprecation")
    @Transactional(rollbackFor = {Exception.class})
    @Override
    public String insertAppuser(Appuser param, UploadFile picUploadFile) {
	    Appuser appuser = new Appuser();
	    appuser.setAccount(param.getAccount());
	    appuser.setStatus(Dict.COMMON_STATUS.USED.toString());
        int count = appuserDao.checkRepeatAccount(appuser);
	    if(count>0){
	        return "repeat_account";
	    }
	    
        Client fileClient = new Client();
        String picId = fileClient.upload(picUploadFile.getFiles(), picUploadFile.getExtName(), null);
        if (picId == null) {// 上传失败

        }
        param.setPicUrl(picId);
        appuserDao.insertAppuser(param);
        return "success";
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public String updateAppuser(Appuser param, UploadFile picUploadFile) throws DeleteServerException {
	    param.setStatus(Dict.COMMON_STATUS.USED.toString());
	    int count = appuserDao.checkRepeatAccount(param);
	    if(count>0){
            return "repeat_account";
	    }
	    Appuser oldAppuser = new Appuser();
	    oldAppuser.setId(param.getId());
        List<Appuser> list = appuserDao.queryAppuserList(oldAppuser.toParam());
        if(list != null && list.size() > 0) {
            oldAppuser = list.get(0);
        }
        if (picUploadFile != null) {
            Client fileClient = new Client();
            String picId = fileClient.upload(picUploadFile.getFiles(), picUploadFile.getExtName(), null);
            if (picId == null) {// 上传失败

            }
            if (!StringUtils.isEmpty(oldAppuser.getPicUrl()))
                fileClient.delete(oldAppuser.getPicUrl());
            param.setPicUrl(picId);
        }
        appuserDao.updateAppuser(param);
        return "success";
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void deleteAppuser(Appuser param) {
        appuserDao.deleteAppuser(param);
    }

    /**
     * 启用
     * @param param
     * @return
     */
    @Override
    public String turnonExec(Appuser param) {
        Appuser appuser = this.queryAppuser(param);
        param.setAccount(appuser.getAccount());
        param.setStatus(Dict.COMMON_STATUS.USED.toString());
        int count = appuserDao.checkRepeatAccount(param);
        if(count>0){
            return "repeat_account";
        }
        appuserDao.updateStatus(param);
        return null;
    }

    /**
     * 停用
     * @param param
     * @return
     */
    @Override
    public String shutExec(Appuser param) {
        param.setStatus(Dict.COMMON_STATUS.DISABLE.toString());
        appuserDao.updateStatus(param);
        return "success";
    }

	
}