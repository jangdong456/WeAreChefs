package com.chef.app.member;

import javax.crypto.Cipher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		System.out.println("== Get Join Controller ==");

	}
	
	@PostMapping("join")
	public void join(MemberDTO memberDTO) {
		System.out.println("== Post Join Controller ==");
		System.out.println(memberDTO.getMember_name());
		System.out.println(memberDTO.getMember_id());
		
		memberService.join();
	}
	
	
}
