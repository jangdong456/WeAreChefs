package com.chef.app.manager;

import java.sql.Date;

public class BuyingHistoryDTO {
	
	private Long buying_num;
	private Long food_num;
	private Long buying_count;
	private Date buying_date;
	
	
	
	public Date getBuying_date() {
		return buying_date;
	}
	public void setBuying_date(Date buying_date) {
		this.buying_date = buying_date;
	}
	public Long getBuying_num() {
		return buying_num;
	}
	public void setBuying_num(Long buying_num) {
		this.buying_num = buying_num;
	}
	public Long getFood_num() {
		return food_num;
	}
	public void setFood_num(Long food_num) {
		this.food_num = food_num;
	}
	public Long getBuying_count() {
		return buying_count;
	}
	public void setBuying_count(Long buying_count) {
		this.buying_count = buying_count;
	}
	
}
