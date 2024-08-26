package com.chef.app.manager;

import java.sql.Date;

public class StockBuyingDTO {
	
	private Long buying_num;
	private Long buying_total_price;
	private Date buying_date;
	public Long getBuying_num() {
		return buying_num;
	}
	public void setBuying_num(Long buying_num) {
		this.buying_num = buying_num;
	}
	public Long getBuying_total_price() {
		return buying_total_price;
	}
	public void setBuying_total_price(Long buying_total_price) {
		this.buying_total_price = buying_total_price;
	}
	public Date getBuying_date() {
		return buying_date;
	}
	public void setBuying_date(Date buying_date) {
		this.buying_date = buying_date;
	}
	
	
}
