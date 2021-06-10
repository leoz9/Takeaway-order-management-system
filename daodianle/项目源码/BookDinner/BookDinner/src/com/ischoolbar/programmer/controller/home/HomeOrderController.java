package com.ischoolbar.programmer.controller.home;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ischoolbar.programmer.entity.Account;
import com.ischoolbar.programmer.entity.Food;
import com.ischoolbar.programmer.entity.Order;
import com.ischoolbar.programmer.entity.OrderItem;
import com.ischoolbar.programmer.service.FoodService;
import com.ischoolbar.programmer.service.OrderService;

/**
 * ǰ̨����������
 * @author llq
 *
 */
@RequestMapping("/home/order")
@Controller
public class HomeOrderController {
	
	@Autowired
	private FoodService foodService;
	
	@Autowired
	private OrderService orderService;
	
	/**
	 * �ύ����
	 * @param ids
	 * @param request
	 * @param order
	 * @return
	 */
	@RequestMapping(value="/submit_order",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> submitOrder(
			@RequestParam(name="ids") String ids,
			HttpServletRequest request,
			Order order){
		Map<String, String> ret = new HashMap<String, String>();
		if(order == null){
			ret.put("type", "error");
			ret.put("msg", "����д����������Ϣ!");
			return ret;
		}
		if(StringUtils.isEmpty(order.getAddress())){
			ret.put("type", "error");
			ret.put("msg", "����д�����ջ���ַ!");
			return ret;
		}
		if(StringUtils.isEmpty(order.getRecieveName())){
			ret.put("type", "error");
			ret.put("msg", "����д�����ջ���!");
			return ret;
		}
		if(StringUtils.isEmpty(order.getPhone())){
			ret.put("type", "error");
			ret.put("msg", "����д������ϵ��ʽ!");
			return ret;
		}
		Object attribute = request.getSession().getAttribute("account");
		if(attribute == null){
			ret.put("type", "error");
			ret.put("msg", "���ȵ�¼!");
			return ret;
		}
		Account account = (Account)attribute;
		if(StringUtils.isEmpty(ids)){
			ret.put("type", "error");
			ret.put("msg", "��ѡ���Ʒ!");
			return ret;
		}
		if(ids.endsWith(";")){
			ids = ids.substring(0,ids.length()-1);
		}
		String[] idArr = ids.split(";");
		float money = 0;
		int productNum = 0;
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		for(String idStr:idArr){
			String[] splitId = idStr.split(",");
			Food food = foodService.find(Long.valueOf(splitId[0]));
			productNum += Integer.valueOf(splitId[1]);
			money += food.getPrice()*Float.valueOf(splitId[1]);
			OrderItem orderItem = new OrderItem();
			orderItem.setFoodId(food.getId());
			orderItem.setFoodImage(food.getImageUrl());
			orderItem.setFoodName(food.getName());
			orderItem.setFoodNum(Integer.valueOf(splitId[1]));
			orderItem.setMoney(food.getPrice()*Float.valueOf(splitId[1]));
			orderItem.setPrice(food.getPrice());
			orderItems.add(orderItem);
		}
		order.setAccountId(account.getId());
		order.setMoney(money);
		order.setProductNum(productNum);
		order.setCreateTime(new Date());
		if(orderService.add(order) <= 0){
			ret.put("type", "error");
			ret.put("msg", "�����ύʧ�ܣ�����ϵ����Ա!");
			return ret;
		}
		for(OrderItem oi:orderItems){
			oi.setOrderId(order.getId());
			orderService.addItem(oi);
			foodService.updateSels(oi.getFoodId(),Long.valueOf(oi.getFoodNum()));
		}
		ret.put("type", "success");
		ret.put("msg", "�µ��ɹ�!");
		return ret;
	}
}
