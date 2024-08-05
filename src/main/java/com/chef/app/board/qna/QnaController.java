package com.chef.app.board.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.jdbc.proxy.annotation.GetCreator;

@Controller
@RequestMapping("/board/qna/*")
public class QnaController {
	
	@ModelAttribute("page")
	public String getInquiry() {
		return "qna";
	}
	
	@GetMapping("list")
	public String qnaList() throws Exception{
		
		return "board/inquiry/list";
	}

	
}
