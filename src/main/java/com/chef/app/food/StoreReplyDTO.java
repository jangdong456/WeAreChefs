package com.chef.app.food;

import com.chef.app.comment.CommentDTO;

public class StoreReplyDTO extends CommentDTO{
	private Long food_num;
	private Long food_rating;
	private Long ref;
	private Long step;
	private Long depth;
	private String del;
	
	public Long getFood_rating() {
		return food_rating;
	}
	public void setFood_rating(Long food_rating) {
		this.food_rating = food_rating;
	}
	public Long getFood_num() {
		return food_num;
	}
	public void setFood_num(Long food_num) {
		this.food_num = food_num;
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

}
