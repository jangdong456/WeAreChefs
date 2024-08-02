package com.chef.app.member;

import com.chef.app.file.FileDTO;

public class MemberFileDTO extends FileDTO {
	private String member_id;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
