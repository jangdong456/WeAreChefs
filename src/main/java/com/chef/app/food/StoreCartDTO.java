package com.chef.app.food;

import java.util.List;

public class StoreCartDTO {
	
	private String member_id;
	private Long food_num;
	private Long cart_count;
	private List<FoodDTO> foodDTO;
	
	public Long getCart_count() {
		return cart_count;
	}
	public void setCart_count(Long cart_count) {
		this.cart_count = cart_count;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Long getFood_num() {
		return food_num;
	}
	public void setFood_num(Long food_num) {
		this.food_num = food_num;
	}
	public List<FoodDTO> getFoodDTO() {
		return foodDTO;
	}
	public void setFoodDTO(List<FoodDTO> foodDTO) {
		this.foodDTO = foodDTO;
	}
	
}
