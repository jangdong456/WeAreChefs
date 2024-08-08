package com.chef.app.board.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chef.app.comment.CommentDTO;
import com.chef.app.manager.NoticeDTO;
import com.chef.app.member.MemberDTO;
import com.chef.app.util.Pager;

@Controller
@RequestMapping("/board/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@PostMapping("uploadContentImage")
	//JSON으로 받기 때문에 필요
	@ResponseBody
	public Map<String, String> ckEditor(MultipartFile upload, HttpSession session) throws Exception{
		String fileName = noticeService.ckEditor(upload, session);
		
		String path = "/resources/upload/boardContents/" + fileName;
		// 경로 완성
		Map<String, String> map = new HashMap<String, String>();
		map.put("url", path);
		return map;
	}
	
	@GetMapping("list")
	public void noticeList(Pager pager, Model model) throws Exception{
		// & Todo : 페이징 처리 해야함.
		List<NoticeDTO> list = noticeService.noticeList(pager);
		System.out.println("@@ NUM");
		System.out.println(pager.getStartNum());
		System.out.println(pager.getLastNum());
		
		model.addAttribute("pager", pager);
		model.addAttribute("noticeList", list);
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
		String msg = "작성을 실패 하였습니다.";
		String url = "/board/notice/list";
		// & Todo - admin1 - Start
		// 세션 member의 id 값을 집어 넣을 수 있는 기능을 만들고 교체할것 
		noticeDTO.setMember_id("aaa"); 
		// & Todo - admin1 - Finish
		String title = noticeDTO.getBoard_title().trim();
		System.out.println("length");
		System.out.println(title.length());
		if(title.length() == 0) {
			System.out.println("title.length()가 실행됨");
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "commons/message";
		}else {
			int result = noticeService.noticeAdd(noticeDTO);
			if (result >= 1) {
				msg = "작성을 성공 하였습니다.";
			}
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "commons/message";
		}
	}
	

}
