package com.chef.app.comment;

import java.sql.Date;

//공통 댓글 dto
public class CommentDTO {
	
	private String board_title;
	private	Long board_num;
	private	String member_id;
	private	Date create_date;
	private	Date update_date;
	private	String board_content;
	
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
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
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
}
