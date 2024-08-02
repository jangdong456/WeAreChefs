package com.chef.app.food;

public class StoreMidOrderDTO {

	private Long mid_num;
	private Long order_num;
	private Long food_num;
	private Long food_count;
	
	public Long getMid_num() {
		return mid_num;
	}
	public void setMid_num(Long mid_num) {
		this.mid_num = mid_num;
	}
	public Long getOrder_num() {
		return order_num;
	}
	public void setOrder_num(Long order_num) {
		this.order_num = order_num;
	}
	public Long getFood_num() {
		return food_num;
	}
	public void setFood_num(Long food_num) {
		this.food_num = food_num;
	}
	public Long getFood_count() {
		return food_count;
	}
	public void setFood_count(Long food_count) {
		this.food_count = food_count;
	}
}
