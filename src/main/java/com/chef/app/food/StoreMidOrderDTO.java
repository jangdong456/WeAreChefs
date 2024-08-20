package com.chef.app.food;

import java.util.List;

public class StoreMidOrderDTO {

	private Long mid_num;
	private String order_num;
	private Long food_num;
	private Long cart_count;
	private List<FoodDTO> foodDTOs;
	
	public List<FoodDTO> getFoodDTOs() {
		return foodDTOs;
	}
	public void setFoodDTOs(List<FoodDTO> foodDTOs) {
		this.foodDTOs = foodDTOs;
	}
	public Long getMid_num() {
		return mid_num;
	}
	public void setMid_num(Long mid_num) {
		this.mid_num = mid_num;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public Long getFood_num() {
		return food_num;
	}
	public void setFood_num(Long food_num) {
		this.food_num = food_num;
	}
	public Long getCart_count() {
		return cart_count;
	}
	public void setCart_count(Long cart_count) {
		this.cart_count = cart_count;
	}

}
