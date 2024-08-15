package com.chef.app.manager;

import com.chef.app.comment.CommentDTO;

public class NoticeDTO extends CommentDTO{
	
	private Long board_title;

	public Long getBoard_title() {
		return board_title;
	}

	public void setBoard_title(Long board_title) {
		this.board_title = board_title;
	}
	

}
