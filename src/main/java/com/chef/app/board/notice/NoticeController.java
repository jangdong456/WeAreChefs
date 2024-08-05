package com.chef.app.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chef.app.comment.CommentDTO;
import com.chef.app.manager.NoticeDTO;
import com.chef.app.member.MemberDTO;
import com.chef.app.util.Pager;

@Controller
@RequestMapping("/board/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("list")
	public String noticeList(Pager pager, Model model) throws Exception{
		List<NoticeDTO> list = noticeService.noticeList();
		model.addAttribute("noticeList", list);
		
		return "board/notice/list";
	}
	
	@GetMapping("detail")
	public String noticeDetail(CommentDTO commentDTO, Model model) throws Exception{
		NoticeDTO noticeDTO = noticeService.noticeDetail(commentDTO);
		model.addAttribute("noticeDetail", noticeDTO);
		return "board/notice/detail";
	}
	
	@GetMapping("add")
	public String noticeAdd() throws Exception{
		return "board/notice/add";
	}
	
	@PostMapping("add")
	public void noticeAdd(NoticeDTO noticeDTO) throws Exception{
		noticeDTO.setMember_id("admin1");
		int result = noticeService.noticeAdd(noticeDTO);
		
	}
}
