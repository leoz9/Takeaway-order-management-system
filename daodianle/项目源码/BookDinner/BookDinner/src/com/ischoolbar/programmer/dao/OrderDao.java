package com.ischoolbar.programmer.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ischoolbar.programmer.entity.Order;
import com.ischoolbar.programmer.entity.OrderItem;
/**
 * ∂©µ•–≈œ¢dao
 * @author llq
 *
 */
@Repository
public interface OrderDao {
	public int add(Order Order);
	public int addItem(OrderItem orderItem);
	public int edit(Order Order);
	public List<Order> findList(Map<String, Object> queryMap);
	public Integer getTotal(Map<String, Object> queryMap);
	public int delete(Long id);
}
