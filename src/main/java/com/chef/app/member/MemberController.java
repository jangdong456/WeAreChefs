package com.chef.app.member;

import java.util.HashMap;

import javax.crypto.Cipher;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("kakaologin")
	public void kakao() throws Exception {
		System.out.println("== Kakao Controller ==");
		memberService.kakao();
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		
		return "redirect:/";
				
	}
	
	@GetMapping("login")
	public void login() throws Exception {

	}
	
	@PostMapping("login")
	public String login(MemberDTO memberDTO, Model model, HttpSession session) throws Exception {
		System.out.println("== login Controller ==");
		//session에 memberDTO 정보를 집어 넣어야함
		
		MemberDTO result = memberService.login(memberDTO);
		int num = 1;
		
		if(result != null ) {
			session.setAttribute("member", result);
			System.out.println(session);
			model.addAttribute("msg", num);
			return "commons/result";
		} else {
			session.invalidate();
			model.addAttribute("msg", 0);
			return "commons/result";
		}	
	}
	
	@GetMapping("join")
	public void join() throws Exception {
		System.out.println("== Get Join Controller ==");

	}
	
	@PostMapping("join")
	public String join(MemberDTO memberDTO) throws Exception {
		System.out.println("== Post Join Controller ==");
		
		int result = memberService.join(memberDTO);
		System.out.println("DAO 반환값 :" + result);
		String url = "";
		if(result >0) {
			url = "redirect:/member/join";
		}
		return url;
	}
	
	
}
