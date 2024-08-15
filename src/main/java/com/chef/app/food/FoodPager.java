package com.chef.app.food;

import com.chef.app.util.Pager;

public class FoodPager extends Pager{
	
	private String order;

	public String getOrder() {
		
		if (this.order == null) {
			this.order = "";
		}
		
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	
}
