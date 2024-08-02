package com.chef.app.manager;

import com.chef.app.comment.CommentDTO;

public class NoticeDTO extends CommentDTO{
	
	private Long notice_num;
	private String notice_title;
	
	public Long getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(Long notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
}
