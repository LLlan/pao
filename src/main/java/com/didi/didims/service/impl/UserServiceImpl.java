package com.didi.didims.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.didi.common.constant.CommonEmun.Identity;
import com.didi.common.constant.CommonEmun.OperationStatus;
import com.didi.common.exception.NoExistesException;
import com.didi.common.pojo.Page;
import com.didi.didims.dao.IUserDao;
import com.didi.didims.pojo.User;
import com.didi.didims.service.IUserService;
import com.didi.didims.shiro.util.PasswordPolicy;

@Service
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    @Override
    public Page queryUserPageList(User param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<User> list = userDao.queryUserPageList(map);
        int total = userDao.queryUserPageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public User queryUser(User param) {
        User result = null;
        List<User> list = userDao.queryUserList(param.toParam());
        if (list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<User> queryUserList(User param) {
        return userDao.queryUserList(param.toParam());
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void insertUser(User param) throws NoExistesException {
        String salt = PasswordPolicy.randomSalt();
        param.setPassword(PasswordPolicy.passwordEncryt(param.getUsername(), param.getPassword(), salt));
        param.setIdentityCode(Identity.ADMIN.toString());
        param.setSalt(salt);
        userDao.insertUser(param);
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void updateUser(User param) throws NoExistesException {
        Map<String, Object> oldMap = new HashMap<String, Object>();
        User oldObj = null;
        List<User> list = userDao.queryUserList(oldMap);
        if (list != null && list.size() > 0) {
            oldObj = list.get(0);
            // 加密
            if (!oldObj.getPassword().equals(param.getPassword())) {
                String newPassword = PasswordPolicy.passwordEncryt(oldObj.getUsername(), param.getPassword(), oldObj.getSalt());
                param.setPassword(newPassword);
            }
            userDao.updateUser(param);
        } else {
            throw new NoExistesException(OperationStatus.R0000003);
        }
    }

    @Transactional(rollbackFor = { Exception.class })
    @Override
    public void deleteUser(User param) {
        userDao.deleteUser(param);
    }

}