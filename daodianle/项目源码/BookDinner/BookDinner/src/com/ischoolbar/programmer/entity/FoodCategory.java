package com.ischoolbar.programmer.entity;

import java.util.List;

import org.springframework.stereotype.Component;

/**
 * ��Ʒ������Ϣʵ��
 * @author llq
 *
 */
@Component
public class FoodCategory {
	private Long id;
	private String name;//��Ʒ��������
	private List<Food> foodList;//�÷����µ����в�Ʒ��Ϣ
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Food> getFoodList() {
		return foodList;
	}
	public void setFoodList(List<Food> foodList) {
		this.foodList = foodList;
	}
	
}
