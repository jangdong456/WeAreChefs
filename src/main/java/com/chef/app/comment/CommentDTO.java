package com.chef.app.comment;

import oracle.sql.DATE;

//공통 댓글 dto
public class CommentDTO {
	
	private	Long board_num;
	private	String member_id;
	private	DATE create_date;
	private	DATE update_date;
	private	String board_content;

	public Long getBoard_num() {
		return board_num;
	}
	public void setBoard_num(Long board_num) {
		this.board_num = board_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public DATE getCreate_date() {
		return create_date;
	}
	public void setCreate_date(DATE create_date) {
		this.create_date = create_date;
	}
	public DATE getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(DATE update_date) {
		this.update_date = update_date;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

}
