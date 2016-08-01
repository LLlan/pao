package com.didi.didims.service;

import com.didi.didims.pojo.User;

import java.util.List;
import java.util.Map;

import com.didi.common.exception.NoExistesException;
import com.didi.common.pojo.Page;

public interface IUserService {

	Page queryUserPageList(User param, Page page);
	
	User queryUser(User param);

	List<User> queryUserList(User param);

	void insertUser(User param) throws NoExistesException;
	
	void updateUser(User param) throws NoExistesException;
	
	void deleteUser(User param);
	
}