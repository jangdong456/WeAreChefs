package com.chef.app.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chef.app.comment.CommentDTO;
import com.chef.app.manager.InquiryDTO;
import com.chef.app.util.Pager;

import oracle.jdbc.proxy.annotation.GetCreator;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/board/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@ModelAttribute("page")
	public String getInquiry() {
		return "qna";
	}
	
	@GetMapping("list")
	public String qnaList(Pager pager, Model model) throws Exception{
		List<InquiryDTO> inquiryList = qnaService.qnaList(pager);
		
		model.addAttribute("inquiryList", inquiryList);
		
		return "board/inquiry/list";
	}
	
	
	@GetMapping("detail")
	public String qnaDetail(CommentDTO commentDTO, Model model) throws Exception{
		InquiryDTO inquiryDTO = qnaService.qnaDetail(commentDTO);
		model.addAttribute("inquiryDetail", inquiryDTO);
		return "board/inquiry/detail";
	}
	
	@GetMapping("update")
	public String fnaUpdate(CommentDTO commentDTO, Model model) throws Exception{
		InquiryDTO inquiryDTO = qnaService.qnaDetail(commentDTO);
		model.addAttribute("inquiryDetail", inquiryDTO);

		return "board/inquiry/update";
	}
	
	@PostMapping("update")
	public String fnaUpdate(InquiryDTO inquiryDTO, Model model) throws Exception{
		int result = qnaService.qnaUpdate(inquiryDTO);
		
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
		
		int result = qnaService.qnaDelete(commentDTO);
		
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
	public String fnaAdd(InquiryDTO inquiryDTO, Model model) throws Exception{
		// & Todo : Session에서 memberID 받는 것으로 바꿔줘야함
		inquiryDTO.setMember_id("admin1");
		int result = qnaService.qnaAdd(inquiryDTO);
		
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
