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
		// & Todo : 페이징 처리 해야함.
		List<NoticeDTO> list = noticeService.noticeList(pager);
		model.addAttribute("noticeList", list);
		
		return "board/notice/list";
	}
	
	@GetMapping("detail")
	public String noticeDetail(CommentDTO commentDTO, Model model) throws Exception{
		NoticeDTO noticeDTO = noticeService.noticeDetail(commentDTO);
		model.addAttribute("noticeDetail", noticeDTO);
		return "board/notice/detail";
	}
	
	@GetMapping("update")
	public String noticeUpdate(CommentDTO commentDTO, Model model) throws Exception{
		// & Todo : session에서 member_lev 가져오고 관리자인지 아닌지를 판별해야함.
		NoticeDTO noticeDTO = noticeService.noticeDetail(commentDTO);
		model.addAttribute("noticeDetail", noticeDTO);
		return "board/notice/update";
	}
	
	@PostMapping("update")
	public String noticeUpdate(NoticeDTO noticeDTO, Model model) throws Exception{
		int result = noticeService.noticeUpdate(noticeDTO);
		
		String msg = "수정을 실패 하였습니다.";
		String url = "/board/notice/detail";
		if (result >= 1) {
			msg = "수정을 성공 하였습니다.";
			url = url + "?board_num=" + noticeDTO.getBoard_num();
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "commons/message";
	}
	
	@GetMapping("delete")
	public String noticeDelete(CommentDTO commentDTO, Model model) throws Exception{
		// & Todo : session에서 member_lev 가져오고 관리자인지 아닌지를 판별해야함.
		int result = noticeService.noticeDelete(commentDTO);
		
		String msg = "삭제를 실패 하였습니다.";
		String url = "/board/notice/detail";
		if (result >= 1) {
			msg = "삭제를 성공 하였습니다.";
			url = "/board/notice/list";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "commons/message";
	}
	
	@GetMapping("add")
	public String noticeAdd() throws Exception{
		// & Todo : session에서 member_lev 가져오고 관리자인지 아닌지를 판별해야함.
		return "board/notice/add";
	}
	
	@PostMapping("add")
	public String noticeAdd(NoticeDTO noticeDTO, Model model) throws Exception{
		// & Todo - admin1 - Start
		// 세션 member의 id 값을 집어 넣을 수 있는 기능을 만들고 교체할것 
		noticeDTO.setMember_id("admin1"); 
		// & Todo - admin1 - Finish
		int result = noticeService.noticeAdd(noticeDTO);
		
		String msg = "작성을 실패 하였습니다.";
		String url = "/board/notice/detail";
		if (result >= 1) {
			msg = "작성을 성공 하였습니다.";
			url = "/board/notice/list";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "commons/message";
		
	}
}
