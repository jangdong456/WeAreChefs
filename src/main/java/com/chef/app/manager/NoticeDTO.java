package com.chef.app.manager;

import com.chef.app.comment.CommentDTO;

public class NoticeDTO extends CommentDTO {

	private String board_title;

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

}
