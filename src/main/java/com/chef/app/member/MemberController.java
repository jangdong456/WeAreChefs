package com.chef.app.member;

import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import com.chef.app.recipe.RecipeDTO;
import com.chef.app.recipe.RecipeReplyDTO;
import com.chef.app.recipe.RecipeReviewDTO;
import com.chef.app.util.Email;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private Email email;
	
	@PostMapping("profileChange")
	public String profileChange(MemberDTO memberDTO, MultipartFile multipartFile, HttpSession session, Model model) throws Exception {
		MemberDTO memberdto = (MemberDTO)session.getAttribute("member");
		memberDTO.setMember_id(memberdto.getMember_id());
		
		System.out.println("파일확인:" + multipartFile);
		System.out.println("id:" + memberDTO.getMember_id());
		
		int result = 0;
		String url = "";
		
		result = memberService.profileChange(memberDTO, multipartFile, session);			
		
		if(result > 0) {
			url = "redirect:/member/mypage";
			
		}
		return url;

	}								
	
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
			url = "member/profileAboutMe";
		}
		return url;
	}
	
	
	@GetMapping("mypage")
	public void mypage(HttpSession session, Model model) throws Exception {
		System.out.println("== My Page ==");

		MemberDTO memberdto = (MemberDTO)session.getAttribute("member");
		memberdto = memberService.mypage(memberdto);
		
		System.out.println("로그인 한 id:" + memberdto.getMember_id());
		
//		test.setRecipe_writer(memberdto.getMember_id());
		
//		MemberDTO list = memberService.recipeList(memberdto);
		
		// 작성한 레시피 리스트
		List<RecipeDTO> recipedto = memberService.recipeList(memberdto);
		model.addAttribute("recipeList", recipedto);

		// 상대방 레시피에 작성한 리뷰
		List<RecipeReviewDTO> recipeReview = memberService.recipeReviewList(memberdto);
		model.addAttribute("reviewList", recipeReview);
		
		// 상대방 레시피에 작성한 댓글
		List<RecipeReplyDTO> recipeReply = memberService.recipeReplyList(memberdto); 
		model.addAttribute("recipeReply", recipeReply);
		
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
			
			url = "member/profileAboutMe";
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
	
	
}
