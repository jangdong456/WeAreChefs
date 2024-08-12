package com.chef.app.manager;

import com.chef.app.comment.CommentDTO;

public class InquiryDTO extends CommentDTO {
	
	private String board_type; 
	private Long ref;
	private Long step;
	private String del;
	
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
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
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	
	
	
	
}
