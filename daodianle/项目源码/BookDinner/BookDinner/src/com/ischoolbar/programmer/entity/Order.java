package com.ischoolbar.programmer.entity;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;


/**
 * ������Ϣʵ��
 * @author llq
 *
 */
@Component
public class Order {
	private Long id;
	private Long accountId;//�ͻ�id
	private float money;//�������
	private int productNum;//��Ʒ����
	private int status = 0;//����״̬,0����������1���ѷ�����2�������
	private String recieveName;//�ռ���
	private String phone;//�ֻ�����
	private String address;//��ַ
	private Date createTime;//�µ�ʱ��
	private List<OrderItem> orderItems;//���������
	private Account account;//���������ͻ�
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getRecieveName() {
		return recieveName;
	}
	public void setRecieveName(String recieveName) {
		this.recieveName = recieveName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public List<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	public Long getAccountId() {
		return accountId;
	}
	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	
	
}
