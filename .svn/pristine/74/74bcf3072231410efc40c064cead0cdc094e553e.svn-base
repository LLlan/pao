package com.didi.didims.service.impl;

import com.didi.didims.pojo.Order;
import java.util.List;
import java.util.Map;
import com.didi.common.pojo.Page;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.didi.didims.dao.IOrderDao;
import com.didi.didims.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService {

	@Resource
	private IOrderDao orderDao;
	
	@Override
    public Page queryOrderPageList(Order param, Page page) {
        Map<String, Object> map = param.toParam();
        map.put("page", page);
        List<Order> list = orderDao.queryOrderPageList(map);
        int total = orderDao.queryOrderPageListCount(map);
        page.setTotal(total);
        page.setRecords(list);
        return page;
    }

    @Override
    public Order queryOrder(Order param) {
        Order result = null;
        List<Order> list = orderDao.queryOrderList(param.toParam());
        if(list != null && list.size() > 0) {
            result = list.get(0);
        }
        return result;
    }

    @Override
    public List<Order> queryOrderList(Order param) {
        return orderDao.queryOrderList(param.toParam());
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void insertOrder(Order param) {
        orderDao.insertOrder(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void updateOrder(Order param) {
        orderDao.updateOrder(param);
    }

	@Transactional(rollbackFor = {Exception.class})
    @Override
    public void deleteOrder(Order param) {
        orderDao.deleteOrder(param);
    }
	
}