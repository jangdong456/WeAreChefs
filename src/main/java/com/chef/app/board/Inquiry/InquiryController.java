//package com.chef.app.board.Inquiry;
//
//import java.util.List;
//
//import org.springframework.ui.Model;
//
//import com.chef.app.comment.CommentDTO;
//import com.chef.app.manager.InquiryDTO;
//import com.chef.app.util.Pager;
//
//public class InquiryController {
//	inquiry
//	
//	public String InquiryList(Pager pager, Model model) throws Exception{
//		List<InquiryDTO> InquiryList = inquiryService.inquiryList(pager);
//		model.addAttribute("inquiryList", InquiryList);
//		return "board/inquiry/list";
//	}
//	
//	public String inquiryDetail(CommentDTO commentDTO, Model model) throws Exception{
//		InquiryDTO inquiryDTO = inquiryService.inquiryDetail(commentDTO);
//		model.addAttribute("inquiryDetail", inquiryDTO);
//		
//		return "board/inquiry/detail";
//	}
//	
//	public String inquiryUpdate(CommentDTO commentDTO, Model model) throws Exception{
//		InquiryDTO inquiryDTO = inquiryService.inquiryDetail(commentDTO);
//		model.addAttribute("inquiryDetail", inquiryDTO);
//
//		return "board/inquiry/update";
//	}
//	
//	public String inquiryUpdate(InquiryDTO inquiryDTO, Model model) throws Exception{
//		int result = inquiryService.inquiryUpdate(inquiryDTO);
//		
//		String msg = "수정을 성공 하였습니다.";
//		String url = "./detail?board_num=" + inquiryDTO.getBoard_num();
//		if(result < 1) {
//			msg = "수정을 실패 하였습니다.";
//		};
//		model.addAttribute("msg", msg);
//		model.addAttribute("url", url);
//		
//		return "commons/message";
//	}
//	
//	public String inquiryDelete(CommentDTO commentDTO, Model model) throws Exception{
//		
//		int result = inquiryService.inquiryDelete(commentDTO);
//		
//		String msg = "삭제를 성공 하였습니다.";
//		String url = "./list";
//		if(result < 1) {
//			msg = "삭제를 실패 하였습니다.";
//			url = "./detail";
//		};
//		model.addAttribute("msg", msg);
//		model.addAttribute("url", url);
//		
//		return "commons/message";
//	}
//	
//	public String inquiryAdd() throws Exception{
//		return "board/inquiry/add";		
//	}
//	
//	public String inquiryAdd(InquiryDTO inquiryDTO, Model model) throws Exception{
//		// & Todo : Session에서 memberID 받는 것으로 바꿔줘야함
//		inquiryDTO.setMember_id("admin1");
//		int result = inquiryService.inquiryAdd(inquiryDTO);
//		
//		String msg = "작성을 성공 하였습니다.";
//		String url = "./list";
//		if(result < 1) {
//			msg = "작성을 실패 하였습니다.";
//			url = "./detail";
//		};
//		model.addAttribute("msg", msg);
//		model.addAttribute("url", url);
//		
//		return "commons/message";
//	}
//	
//	
//}
