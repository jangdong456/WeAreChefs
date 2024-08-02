package com.chef.app.manager;

import com.chef.app.file.FileDTO;

public class NoticeFileDTO extends FileDTO {
	private Long notice_num;

	public Long getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(Long notice_num) {
		this.notice_num = notice_num;
	}

}
