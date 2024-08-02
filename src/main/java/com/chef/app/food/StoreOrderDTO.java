package com.chef.app.food;

import java.sql.Date;
import java.util.List;

public class StoreOrderDTO {
	private Long order_num;
	private	String member_id;
	private	String order_method;
	private	Long order_price;
	private	String order_status;
	private	String delivery_address;
	private	String delivery_stauts;
	private	Date order_date;
	private List<StoreMidOrderDTO> store_ar;
	
	public Long getOrder_num() {
		return order_num;
	}
	public void setOrder_num(Long order_num) {
		this.order_num = order_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOrder_method() {
		return order_method;
	}
	public void setOrder_method(String order_method) {
		this.order_method = order_method;
	}
	public Long getOrder_price() {
		return order_price;
	}
	public void setOrder_price(Long order_price) {
		this.order_price = order_price;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getDelivery_address() {
		return delivery_address;
	}
	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}
	public String getDelivery_stauts() {
		return delivery_stauts;
	}
	public void setDelivery_stauts(String delivery_stauts) {
		this.delivery_stauts = delivery_stauts;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public List<StoreMidOrderDTO> getStore_ar() {
		return store_ar;
	}
	public void setStore_ar(List<StoreMidOrderDTO> store_ar) {
		this.store_ar = store_ar;
	}
}

