package com.chef.app.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public void kakao() {
		System.out.println("== Kakao Service ==");
		memberDAO.kakao();
	}
	
	public void join() {
		System.out.println("== Join Service");
		memberDAO.join();
	}
	
}
