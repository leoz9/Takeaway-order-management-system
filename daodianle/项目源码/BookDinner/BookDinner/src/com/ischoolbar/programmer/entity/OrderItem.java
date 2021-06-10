package com.ischoolbar.programmer.entity;

import org.springframework.stereotype.Component;

/**
 * ����������Ϣʵ��
 * @author llq
 *
 */
@Component
public class OrderItem {
	private Long id;
	private Long orderId;//��������id
	private Long foodId;//��Ʒid
	private String foodName;//��Ʒ����
	private String foodImage;//��ƷͼƬ
	private float price;//��Ʒ�۸�
	private int foodNum;//��Ʒ����
	private float money;//�۸�
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public Long getFoodId() {
		return foodId;
	}
	public void setFoodId(Long foodId) {
		this.foodId = foodId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getFoodNum() {
		return foodNum;
	}
	public void setFoodNum(int foodNum) {
		this.foodNum = foodNum;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public String getFoodImage() {
		return foodImage;
	}
	public void setFoodImage(String foodImage) {
		this.foodImage = foodImage;
	}
	
	
}
