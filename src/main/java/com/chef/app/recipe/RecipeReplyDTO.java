package com.chef.app.recipe;

import com.chef.app.comment.CommentDTO;

public class RecipeReplyDTO extends CommentDTO {
	private Long recipe_num;
	private Long recipe_reply_num;
	private Long ref;
	private Long step;
	private Long depth;
	private String del;

	public Long getRecipe_reply_num() {
		return recipe_reply_num;
	}

	public void setRecipe_reply_num(Long recipe_reply_num) {
		this.recipe_reply_num = recipe_reply_num;
	}

	public Long getRef() {
		return ref;
	}

	public void setRef(Long ref) {
		this.ref = ref;
	}

	public Long getStep() {
		return step;
	}

	public void setStep(Long step) {
		this.step = step;
	}

	public Long getDepth() {
		return depth;
	}

	public void setDepth(Long depth) {
		this.depth = depth;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public Long getRecipe_num() {
		return recipe_num;
	}

	public void setRecipe_num(Long recipe_num) {
		this.recipe_num = recipe_num;
	}

}
