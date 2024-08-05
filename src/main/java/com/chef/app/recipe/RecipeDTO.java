package com.chef.app.recipe;

import java.sql.Date;

public class RecipeDTO {
	private Long recipe_num;
	private String recipe_writer;
	private String recipe_name;
	private String menu_recipe;
	private Date create_date;
	private Date update_date;
	private String recipe_category;
	private Long recipe_hit;

	// db
	public Long getRecipe_num() {
		return recipe_num;
	}

	public void setRecipe_num(Long recipe_num) {
		this.recipe_num = recipe_num;
	}

	public String getRecipe_writer() {
		return recipe_writer;
	}

	public void setRecipe_writer(String recipe_writer) {
		this.recipe_writer = recipe_writer;
	}

	public String getRecipe_name() {
		return recipe_name;
	}

	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}

	public String getMenu_recipe() {
		return menu_recipe;
	}

	public void setMenu_recipe(String menu_recipe) {
		this.menu_recipe = menu_recipe;
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

	public String getRecipe_category() {
		return recipe_category;
	}

	public void setRecipe_category(String recipe_category) {
		this.recipe_category = recipe_category;
	}

	public Long getRecipe_hit() {
		return recipe_hit;
	}

	public void setRecipe_hit(Long recipe_hit) {
		this.recipe_hit = recipe_hit;
	}

}
