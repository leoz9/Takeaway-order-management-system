package com.ischoolbar.programmer.entity;

import org.springframework.stereotype.Component;

/**
 * ��Ʒ��Ϣʵ��
 * @author llq
 *
 */
@Component
public class Food {
	private Long id;
	private Long categoryId;//��Ʒ����id
	private String name;//��Ʒ����
	private float price;
	private Integer sels = 0;//����
	private String imageUrl;//ͼƬ��ַ
	private String des;//��Ʒ������Ϣ
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
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public Integer getSels() {
		return sels;
	}
	public void setSels(Integer sels) {
		this.sels = sels;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String desc) {
		this.des = desc;
	}
	
}
