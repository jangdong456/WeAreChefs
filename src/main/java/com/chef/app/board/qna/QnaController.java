package com.chef.app.board.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	@PostMapping("uploadContentImage")
	//JSON으로 받기 때문에 필요
	@ResponseBody
	public Map<String, String> ckEditor(MultipartFile upload, HttpSession session) throws Exception{
		String fileName = qnaService.ckEditor(upload, session);
		
		String path = "/resources/upload/boardContents/" + fileName;
		// 경로 완성
		Map<String, String> map = new HashMap<String, String>();
		map.put("url", path);
		return map;
	}
	
	@ModelAttribute("page")
	public String getInquiry() {
		return "qna";
	}
	
	@GetMapping("list")
	public String qnaList(Pager pager, Model model) throws Exception{
		List<InquiryDTO> inquiryList = qnaService.qnaList(pager);
		System.out.println("@@ NUM");
		System.out.println(pager.getStartNum());
		System.out.println(pager.getLastNum());
		
		model.addAttribute("pager", pager);
		model.addAttribute("inquiryList", inquiryList);
		
		return "board/inquiry/list";
	}	
	
	
	@GetMapping("detail")
	public String qnaDetail(CommentDTO commentDTO, Model model) throws Exception{
		// 디테일 호출
		InquiryDTO inquiryDTO = qnaService.qnaDetail(commentDTO);
		model.addAttribute("inquiryDetail", inquiryDTO);
		// 댓글 리스트 호출
		List<InquiryDTO> result = qnaService.getQnaReply(inquiryDTO);
		model.addAttribute("inquiryDTOList", result);
		// &Todo Session에서 member_id를 받아오고 그 값을 model("member", memberDTO)를 통해 detail.jsp로 보낸다.
		// &Todo detail.jsp에서 member 아이디가 글 작성자와 같으면 수정 삭제가 보이도록 한다.
		return "board/inquiry/detail";
	}
	
	@GetMapping("update")
	public String qnaUpdate(CommentDTO commentDTO, Model model) throws Exception{
		InquiryDTO inquiryDTO = qnaService.qnaDetail(commentDTO);
		model.addAttribute("inquiryDetail", inquiryDTO);

		return "board/inquiry/update";
	}
	
	@PostMapping("update")
	public String qnaUpdate(InquiryDTO inquiryDTO, Model model) throws Exception{
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
	public String qnaDelete(CommentDTO commentDTO, Model model) throws Exception{
		
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
	public String qnaAdd() throws Exception{
		return "board/inquiry/add";		
	}
	
	@PostMapping("add")
	public String qnaAdd(InquiryDTO inquiryDTO, Model model) throws Exception{
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
	
	@PostMapping("reply")
	public String qnaReply(InquiryDTO inquiryDTO, Model model) throws Exception{
		// &Todo member session에서 값 받아오기.
		inquiryDTO.setMember_id("aaa");
		// 댓글 추가
		int addResult = qnaService.addQnaReply(inquiryDTO);
		// 댓글 리스트 비동기식으로 불러오기
		List<InquiryDTO> replyResult = qnaService.getQnaReply(inquiryDTO);
		model.addAttribute("inquiryDTOList", replyResult);
		return "board/inquiry/commentList";
	}
	
	@GetMapping("commentList")
	public void getQnaReply(InquiryDTO inquiryDTO, Model model) throws Exception{
		List<InquiryDTO> result = qnaService.getQnaReply(inquiryDTO);
		model.addAttribute("inquiryDTOList", result);
		
	}
	
	@GetMapping("replyUpdate")
	public String getReplyUpdate(InquiryDTO inquiryDTO, Model model) throws Exception{
		
		InquiryDTO getReplyUpdate = qnaService.getReplyUpdate(inquiryDTO);
		getReplyUpdate.setMember_id("aaa");
		System.out.println("get replyUpdate : " + getReplyUpdate.getBoard_content());
		model.addAttribute("getReplyUpdate", getReplyUpdate);
		return "board/inquiry/commentUpdate";
	}
	
	@PostMapping("replyUpdate")
	public String replyUpdate(InquiryDTO inquiryDTO, ReplyUpdateDTO replyUpdateDTO, Model model) throws Exception{
		int result = qnaService.replyUpdate(inquiryDTO);
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setBoard_num(replyUpdateDTO.getDetail_board_num());
		System.out.println(" @@ inquiryDTO.boardNum : " + inquiryDTO.getBoard_num());
		System.out.println(" @@ commentDTO.boardNum : " + commentDTO.getBoard_num());
		
		List<InquiryDTO> inquiryDTOList = qnaService.getQnaReply(commentDTO);
		model.addAttribute("inquiryDTOList", inquiryDTOList);
		return "board/inquiry/commentList";
	}
	
	@GetMapping("replyUpdateCancel")
	public String replyUpdateCancel(CommentDTO commentDTO, Model model) throws Exception{
		List<InquiryDTO> inquiryDTOList = qnaService.getQnaReply(commentDTO);
		model.addAttribute("inquiryDTOList", inquiryDTOList);
		return "board/inquiry/commentList";
	}
	
	@GetMapping("replyDelete")
	public String replyDelete(CommentDTO commentDTO) throws Exception{
		
	}
	

}
