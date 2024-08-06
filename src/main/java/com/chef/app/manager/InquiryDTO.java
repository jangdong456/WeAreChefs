package com.chef.app.manager;

import com.chef.app.comment.CommentDTO;

public class InquiryDTO extends CommentDTO {
	
	private Long qna_num;
	private String qna_title;
	private Long ref;
	private Long step;
	private String del;
	
	public Long getQna_num() {
		return qna_num;
	}
	public void setQna_num(Long qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
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
