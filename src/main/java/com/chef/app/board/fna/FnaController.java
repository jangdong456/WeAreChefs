package com.chef.app.board.fna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chef.app.comment.CommentDTO;
import com.chef.app.manager.InquiryDTO;
import com.chef.app.manager.NoticeDTO;
import com.chef.app.member.MemberDTO;
import com.chef.app.util.Pager;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/board/fna/*")
public class FnaController {
	
	@Autowired
	private FnaService fnaService;
	
	@ModelAttribute("page")
	public String getInquiry() {
		return "fna";
	}
	
	@GetMapping("list")
	public String fnaList(Pager pager, Model model, HttpSession session) throws Exception {
		Long lev = 0L;
		if(((MemberDTO) session.getAttribute("member")) != null) {
			lev = ((MemberDTO) session.getAttribute("member")).getMember_lev();
		}
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_lev(lev);
		model.addAttribute("member", memberDTO);

		
		List<InquiryDTO> InquiryList = fnaService.fnaList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("inquiryList", InquiryList);
		return "board/inquiry/list";
	}
	
	@GetMapping("hitUpdate")
	public String hitUpdate(Pager pager,InquiryDTO inquiryDTO, Model model) throws Exception{
		int result = fnaService.hitUpdate(inquiryDTO);
		
		List<InquiryDTO> InquiryList = fnaService.fnaList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("inquiryList", InquiryList);
		return "board/inquiry/inquiryUpdate";
	}
	
	@GetMapping("detail")
	public String fnaDetail(CommentDTO commentDTO, Model model, HttpSession session) throws Exception{
		Long lev = 0L;
		if(((MemberDTO) session.getAttribute("member")) != null) {
			lev = ((MemberDTO) session.getAttribute("member")).getMember_lev();
		}
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_lev(lev);
		model.addAttribute("member", memberDTO);

		
		InquiryDTO inquiryDTO = fnaService.fnaDetail(commentDTO);
		model.addAttribute("inquiryDetail", inquiryDTO);
		
		return "board/inquiry/detail";
	}
	
	@GetMapping("update")
	public String fnaUpdate(CommentDTO commentDTO, Model model) throws Exception{
		InquiryDTO inquiryDTO = fnaService.fnaDetail(commentDTO);
		model.addAttribute("inquiryDetail", inquiryDTO);

		return "board/inquiry/update";
	}
	
	@PostMapping("update")
	public String fnaUpdate(InquiryDTO inquiryDTO, Model model) throws Exception{
		int result = fnaService.fnaUpdate(inquiryDTO);
		
		String msg = "수정을 성공 하였습니다.";
		String url = "./detail?board_num=" + inquiryDTO.getBoard_num();
		if(result < 1) {
			msg = "수정을 실패 하였습니다.";
		};
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "commons/message";
	}
	
	@GetMapping("delete")
	public String fnaDelete(CommentDTO commentDTO, Model model) throws Exception{
		
		int result = fnaService.fnaDelete(commentDTO);
		
		String msg = "삭제를 성공 하였습니다.";
		String url = "./list";
		if(result < 1) {
			msg = "삭제를 실패 하였습니다.";
			url = "./detail";
		};
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "commons/message";
	}
	
	@GetMapping("add")
	public String fnaAdd() throws Exception{
		return "board/inquiry/add";		
	}
	
	@PostMapping("add")
	public String fnaAdd(InquiryDTO inquiryDTO, Model model, HttpSession session) throws Exception{
		// & Todo : Session에서 memberID 받는 것으로 바꿔줘야함
		inquiryDTO.setMember_id(((MemberDTO) session.getAttribute("member")).getMember_id());
		inquiryDTO.setMember_nickname(((MemberDTO) session.getAttribute("member")).getMember_nickname());
	
		int result = fnaService.fnaAdd(inquiryDTO);
		
		String msg = "작성을 성공 하였습니다.";
		String url = "./list";
		if(result < 1) {
			msg = "작성을 실패 하였습니다.";
			url = "./detail";
		};
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "commons/message";
	}
	

}
