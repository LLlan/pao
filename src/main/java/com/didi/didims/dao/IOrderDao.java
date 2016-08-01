package com.didi.didims.dao;

import com.didi.didims.pojo.Order;
import java.util.List;
import java.util.Map;

public interface IOrderDao {

	void insertOrder(Order param);
	
	void updateOrder(Order param);
	
	void deleteOrder(Order param);
	
	List<Order> queryOrderPageList(Map<String, Object> param);
	
	int queryOrderPageListCount(Map<String, Object> param);
	
	List<Order> queryOrderList(Map<String, Object> param);
}