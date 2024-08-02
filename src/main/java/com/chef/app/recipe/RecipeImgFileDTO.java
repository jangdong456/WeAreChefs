package com.chef.app.recipe;

import com.chef.app.file.FileDTO;

public class RecipeImgFileDTO extends FileDTO {
	private Long recipe_lmg_num;

	public Long getRecipe_lmg_num() {
		return recipe_lmg_num;
	}

	public void setRecipe_lmg_num(Long recipe_lmg_num) {
		this.recipe_lmg_num = recipe_lmg_num;
	}
}
