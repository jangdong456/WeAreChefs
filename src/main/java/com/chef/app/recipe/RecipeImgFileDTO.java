package com.chef.app.recipe;

import com.chef.app.file.FileDTO;

public class RecipeImgFileDTO extends FileDTO {
	private Long recipe_num;

	public Long getRecipe_num() {
		return recipe_num;
	}

	public void setRecipe_num(Long recipe_num) {
		this.recipe_num = recipe_num;
	}

}
