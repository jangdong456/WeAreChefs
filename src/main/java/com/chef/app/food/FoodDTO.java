package com.chef.app.food;

import java.sql.Date;

public class FoodDTO {
	private Long food_num;
	private String food_category;
	private String food_name;
	private Long food_stock;
	private Long food_buying;
	private Long food_price;
	private String food_contents;
	private Date create_date;
	private Date  update_date;
	private Long rating;
	private StoreImgFileDTO storeImgFileDTO;
	
	//8.21 추가 이정민
	private Long food_count;
	private Long total_price;
	

	public Long getFood_count() {
		return food_count;
	}
	public void setFood_count(Long food_count) {
		this.food_count = food_count;
	}
	public Long getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Long total_price) {
		this.total_price = total_price;
	}
	public StoreImgFileDTO getStoreImgFileDTO() {
		return storeImgFileDTO;
	}
	public void setStoreImgFileDTO(StoreImgFileDTO storeImgFileDTO) {
		this.storeImgFileDTO = storeImgFileDTO;
	}
	public Long getFood_num() {
		return food_num;
	}
	public void setFood_num(Long food_num) {
		this.food_num = food_num;
	}
	public String getFood_category() {
		return food_category;
	}
	public void setFood_category(String food_category) {
		this.food_category = food_category;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public Long getFood_stock() {
		return food_stock;
	}
	public void setFood_stock(Long food_stock) {
		this.food_stock = food_stock;
	}
	public Long getFood_buying() {
		return food_buying;
	}
	public void setFood_buying(Long food_buying) {
		this.food_buying = food_buying;
	}
	public Long getFood_price() {
		return food_price;
	}
	public void setFood_price(Long food_price) {
		this.food_price = food_price;
	}
	public String getFood_contents() {
		return food_contents;
	}
	public void setFood_contents(String food_contents) {
		this.food_contents = food_contents;
	}

	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public Long getRating() {
		return rating;
	}
	public void setRating(Long rating) {
		this.rating = rating;
	}
	
	
}
