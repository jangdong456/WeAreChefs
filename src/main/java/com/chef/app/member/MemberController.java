package com.chef.app.member;

import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.chef.app.food.StoreMidOrderDTO;
import com.chef.app.food.StoreOrderDTO;
import com.chef.app.util.Email;
import com.chef.app.util.Pager;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private Email email;
	
	
	@GetMapping("duplication")
	public String duplication(MemberDTO memberDTO, Model model) throws Exception {
		System.out.println("== duplication ==");
		System.out.println(memberDTO.getMember_nickname());
		int check = memberService.duplication(memberDTO);
		
		model.addAttribute("msg", check);
		
		return "commons/result";
	}
	
	@GetMapping("introducesDelete")
	public String introducesDelete(MemberDTO memberDTO, HttpSession session) throws Exception {
		System.out.println("멤버 id 값:"+ memberDTO.getMember_id() );
		MemberDTO memberdto = (MemberDTO)session.getAttribute("member");
		memberdto.setMember_id(memberDTO.getMember_id());
		int result = memberService.introducesDelete(memberdto);
		System.out.println("결과 :" + result);
		
		String url = "";
		if(result > 0) {
			url = "member/test";
		}
		return url;
	}
	
	
	@GetMapping("mypage")
	public void mypage(HttpSession session, Model model) throws Exception {
		System.out.println("== My Page ==");
		MemberDTO memberdto = (MemberDTO)session.getAttribute("member");
		memberdto = memberService.mypage(memberdto);
		System.out.println("반환 객체 :" + memberdto);
		model.addAttribute("member", memberdto);
	}
	
	@PostMapping("mypage")
	public String mypageUpdate(MemberDTO memberDTO, HttpSession session, Model model) throws Exception {
		
//		MemberDTO memberdto = (MemberDTO)session.getAttribute("member");
//		memberdto.setProfile_about_me(profile_about_me);
//		memberdto.setMember_id(member_id);

		MemberDTO memberdto = (MemberDTO)session.getAttribute("member");
		memberdto.setMember_id(memberDTO.getMember_id());
		memberdto.setProfile_about_me(memberDTO.getProfile_about_me());;
		
		int result = memberService.mypageUpdate(memberdto);
		
		String url = "";
		if(result > 0) {
			
			url = "member/test";
		}
		return url;
	}
	
	
	
	
	@GetMapping("sendEmail")
	public void email(MemberDTO memberDTO, Model model, String member_mail) throws Exception {
		System.out.println("== Email ==");
		System.out.println(member_mail);
//		int result = 1;
//		model.addAttribute("msg", result);
		email.mailTemplete(member_mail);
//		return "member/email";
	}
	
	@GetMapping("email")
	public void email() throws Exception {
		
	}
	
	@GetMapping("getcode")
	public void getcode() throws Exception {
		System.out.println("== get code ==");
	}
	
	@PostMapping("kakaologin")
	public String kakaologin(String token, MemberDTO memberDTO, Model model, HttpSession session) throws Exception {
		System.out.println("== Kakao Controller ==");
		int num = 0;
		String result = "";
		
		if(token != null) {
			System.out.println("1번 값:" + token);
			System.out.println("2번 값:" + memberDTO.getMember_id());
			System.out.println("3번 값:" + memberDTO.getMember_nickname());
			System.out.println("4번 값:" + memberDTO.getKakao_profile_img());
			System.out.println("5번 값:" + memberDTO.getMember_type());
			num = memberService.kakaologin(memberDTO);
		}
		
		if(num > 0) {
			MemberDTO memberdto = memberService.kakaologin2(memberDTO);
			System.out.println(memberdto);
			session.setAttribute("member", memberdto);
			model.addAttribute("msg", num);
			result = "commons/result";
		}
		return result;
	}
	
	@GetMapping("kakaologin")
	public void kakao() throws Exception {
		System.out.println("== Kakao Controller ==");

//		memberService.kakao();
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
	public String join(MemberDTO memberDTO, Model model) throws Exception {
		System.out.println("== Post Join Controller ==");

		int result = memberService.join(memberDTO);
		System.out.println("Join 반환값 :" + result);
		
		if(result > 0) {
			model.addAttribute("msg", result);
		}
		return "commons/result";
	}
	
	@GetMapping("buyList")
	public void buyList(HttpSession session,Model model,Pager pager,String startDate,String endDate) throws Exception {
			
		if(startDate==null) {
			startDate="1900-01-01";
		}
		if(endDate==null) {
			endDate="2100-12-31";
		}
		
		Map<String, Object> goService = new HashMap<String, Object>();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		goService.put("memberDTO", memberDTO);
		goService.put("pager", pager);
		goService.put("startDate",startDate);
		goService.put("endDate", endDate);
		
		Map<String, Object> map = memberService.buyList(goService);
				
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pager", map.get("pager"));
		
	}
	
	@GetMapping("cancleRequest")
	public String cancleRequest(StoreOrderDTO storeOrderDTO,Model model) throws Exception {
		
		int result = memberService.cancleRequest(storeOrderDTO);
		
		if(result>0) {
			model.addAttribute("msg", "결제취소 요청이 완료됐습니다");
			model.addAttribute("url", "/member/buyList");
		}else {
			model.addAttribute("msg", "결제취소 요청에 실패했습니다");
			model.addAttribute("url", "/member/buyList");	
		}
		
		return "commons/message";
	}
	
}
