package com.chef.app.manager;

import java.sql.Date;

public class StockCartDTO {
	private Long stock_cart_num;
	private String food_category;
	private Long food_num;
	private String food_name;
	private Long food_count;
	private Long food_one_price;
	private Long food_price;
	private Date cart_date;
	public Long getStock_cart_num() {
		return stock_cart_num;
	}
	public void setStock_cart_num(Long stock_cart_num) {
		this.stock_cart_num = stock_cart_num;
	}
	public String getFood_category() {
		return food_category;
	}
	public void setFood_category(String food_category) {
		this.food_category = food_category;
	}
	public Long getFood_num() {
		return food_num;
	}
	public void setFood_num(Long food_num) {
		this.food_num = food_num;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public Long getFood_count() {
		return food_count;
	}
	public void setFood_count(Long food_count) {
		this.food_count = food_count;
	}
	public Long getFood_one_price() {
		return food_one_price;
	}
	public void setFood_one_price(Long food_one_price) {
		this.food_one_price = food_one_price;
	}
	public Long getFood_price() {
		return food_price;
	}
	public void setFood_price(Long food_price) {
		this.food_price = food_price;
	}
	public Date getCart_date() {
		return cart_date;
	}
	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}
	
	
}
