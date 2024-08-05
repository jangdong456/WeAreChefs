package com.chef.app.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("login")
	public void kakao() {
		System.out.println("== Kakao Controller ==");
		memberService.kakao();
	}
	
	@GetMapping("join")
	public void join() {
		System.out.println("== Join Controller");
		memberService.join();
	}
	
	
}
