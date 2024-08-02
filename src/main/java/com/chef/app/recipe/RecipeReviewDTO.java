package com.chef.app.recipe;

import com.chef.app.comment.CommentDTO;

public class RecipeReviewDTO extends CommentDTO{
	
	private Long reclpe_num;
	private Long reclpe_rating;
	
	public Long getReclpe_num() {
		return reclpe_num;
	}
	public void setReclpe_num(Long reclpe_num) {
		this.reclpe_num = reclpe_num;
	}
	public Long getReclpe_rating() {
		return reclpe_rating;
	}
	public void setReclpe_rating(Long reclpe_rating) {
		this.reclpe_rating = reclpe_rating;
	}	
}
