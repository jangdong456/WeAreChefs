package com.chef.app.manager;

public class TotalPurchaseDTO {
	
	private String pur_period;
	private Long pur_price;
	private Long pur_count;
	
	public Long getPur_count() {
		return pur_count;
	}
	public void setPur_count(Long pur_count) {
		this.pur_count = pur_count;
	}
	public String getPur_period() {
		return pur_period;
	}
	public void setPur_period(String pur_period) {
		this.pur_period = pur_period;
	}
	public Long getPur_price() {
		return pur_price;
	}
	public void setPur_price(Long pur_price) {
		this.pur_price = pur_price;
	}
	
	

}
