package com.didi.didims.service.impl;

import com.didi.didims.pojo.Homemaking;
import com.didi.didims.pojo.Role;
import com.didi.didims.pojo.User;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.didi.common.constant.CommonEmun.Identity;
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

import com.didi.didims.dao.IHomemakingDao;
import com.didi.didims.dao.IRoleDao;
import com.didi.didims.dao.IUserDao;
import com.didi.didims.redis.IRedisDao;
import com.didi.didims.service.IHomemakingService;
import com.didi.didims.shiro.util.PasswordPolicy;

@Service
public class HomemakingServiceImpl implements IHomemakingService {

    @Resource
    private IHomemakingDao homemakingDao;

    @Resource
    private IRedisDao redisDao;

    @Resource
    private IRoleDao roleDao;

    @Resource
    private IUserDao userDao;

    @Override
    public Page queryHomemakingPageList(Homemaking param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<Homemaking> list = homemakingDao.queryHomemakingPageList(map);
        int total = homemakingDao.queryHomemakingPageListCount(map);
        // 拼接URL
        String picUrlRediskey = RedisKeys.CORE_CONFIG + Config.PIC_URL.getId();
        if (redisDao.exists(picUrlRediskey) && total > 0) {
            String picUrlPrefix = redisDao.get(picUrlRediskey).toString();
            for (Homemaking h : list) {
                if (!StringUtils.isEmpty(h.getLogoFile())) {
                    h.setLogoFile(picUrlPrefix + h.getLogoFile());
                }
            }
        }
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public Homemaking queryHomemaking(Homemaking param) {
        Homemaking result = null;
        List<Homemaking> list = homemakingDao.queryHomemakingList(param.toParam());
        if (list != null && list.size() > 0) {
            result = list.get(0);
            // 拼接URL
            String picUrlRediskey = RedisKeys.CORE_CONFIG + Config.PIC_URL.getId();
            if (redisDao.exists(picUrlRediskey) && !StringUtils.isEmpty(result.getLogoFile())) {
                String picUrlPrefix = redisDao.get(picUrlRediskey).toString();
                result.setLogoFile(picUrlPrefix + result.getLogoFile());
            }
        }
        return result;
    }

    @Override
    public List<Homemaking> queryHomemakingList(Homemaking param) {
        return homemakingDao.queryHomemakingList(param.toParam());
    }

    /**
     * 新增家政公司
     * 
     * @param param
     * @param logoUploadFile
     */
    @SuppressWarnings("deprecation")
    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void insertHomemaking(Homemaking param, UploadFile logoUploadFile) {

        Client fileClient = new Client();
        String logoId = fileClient.upload(logoUploadFile.getFiles(), logoUploadFile.getExtName(), null);
        if (logoId == null) {// 上传失败

        }
        param.setLogoFile(logoId);
        homemakingDao.insertHomemaking(param);
        // 新增用户信息
        String salt = PasswordPolicy.randomSalt();
        String pwd = PasswordPolicy.passwordEncryt(param.getAccount(), "123456", salt);
        Map<String, Object> roleMap = new HashMap<>();
        roleMap.put("identityCode", Identity.HOUSEKEEPING.toString());
        List<Role> list = roleDao.queryRoleList(roleMap);

        User user = new User();
        user.setUsername(param.getAccount());
        user.setPassword(pwd);
        user.setSalt(salt);
        user.setIdentityCode(Identity.HOUSEKEEPING.toString());
        user.setRoleId(list.get(0).getId());
        user.setHomemakingId(param.getId());
        userDao.insertUser(user);
    }

    /**
     * 修改家政公司信息
     * 
     * @param param
     * @param logoUploadFile
     * @throws DeleteServerException
     */
    @SuppressWarnings("deprecation")
    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void updateHomemaking(Homemaking param, UploadFile logoUploadFile) throws DeleteServerException {
        // 获取旧logofile
        Homemaking oldHomemaking = new Homemaking();
        oldHomemaking.setId(param.getId());
        List<Homemaking> list = homemakingDao.queryHomemakingList(oldHomemaking.toParam());
        if (list != null && list.size() > 0) {
            oldHomemaking = list.get(0);
        }
        if (logoUploadFile != null) {
            Client fileClient = new Client();
            String logoId = fileClient.upload(logoUploadFile.getFiles(), logoUploadFile.getExtName(), null);
            if (logoId == null) {// 上传失败

            }
            if (!StringUtils.isEmpty(oldHomemaking.getLogoFile()))
                fileClient.delete(oldHomemaking.getLogoFile());
            param.setLogoFile(logoId);
        }
        homemakingDao.updateHomemaking(param);
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void deleteHomemaking(Homemaking param) {
        homemakingDao.deleteHomemaking(param);
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void resetPassword(Homemaking homemaking) {
        homemaking = this.queryHomemaking(homemaking);

        User user = new User();
        user.setUsername(homemaking.getAccount());
        user.setHomemakingId(homemaking.getId());
        List<User> userList = userDao.queryUserList(user.toParam());
        if (userList != null && userList.size() > 0) {
            user = userList.get(0);
        }
        String salt = user.getSalt();
        String pwd = PasswordPolicy.passwordEncryt(homemaking.getAccount(), "123456", salt);
        user.setPassword(pwd);
        user.setSalt(salt);
        userDao.updateUser(user);
    }

}