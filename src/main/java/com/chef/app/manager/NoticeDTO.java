package com.chef.app.manager;

import com.chef.app.comment.CommentDTO;

public class NoticeDTO extends CommentDTO{
	
	private String member_nickname;

	public String getMember_nickname() {
		return member_nickname;
	}

	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	

}
