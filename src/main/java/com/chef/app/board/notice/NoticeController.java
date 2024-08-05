package com.chef.app.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chef.app.manager.NoticeDTO;
import com.chef.app.util.Pager;

@Controller
@RequestMapping("/board/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService notice_service;
	
	@GetMapping("list")
	public String notice_list(Pager pager, Model model) throws Exception{
		List<NoticeDTO> list = notice_service.notice_list();
		model.addAttribute("list", list);
		
		return "board/notice/list";
	}
}
