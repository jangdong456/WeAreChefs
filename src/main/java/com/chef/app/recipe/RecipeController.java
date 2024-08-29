package com.chef.app.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chef.app.member.MemberDTO;

@Controller
@RequestMapping("/recipe/*")
public class RecipeController {
	@Autowired
	RecipeService recipeService;

	@PostMapping("uploadContentImage")
	@ResponseBody
	public Map<String, String> uploadContentImage(MultipartFile upload, Model model, HttpSession session)
			throws Exception {

		String imgName = recipeService.uploadContentImage(upload, session);
		String path = "/resources/upload/recipecontents/" + imgName;

		Map<String, String> map = new HashMap<String, String>();
		map.put("url", path);

		return map;

	}

	@GetMapping("list")
	public void recipeList(RecipeDTO recipeDTO, Model model, RecipePager recipePager, HttpSession session)
			throws Exception {
		// pager.setPage(1L);
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		List<RecipeDTO> ar = recipeService.recipeList(recipePager);

		model.addAttribute("ar", ar);
		model.addAttribute("recipePager", recipePager);

		List<Map<String, Object>> categoryCount = recipeService.categoryCount();
		model.addAttribute("count", categoryCount);

	}

	@GetMapping("detail")
	public String recipeDetail(Model model, //RecipeDTO recipeDTO,  RecipeReviewDTO recipeReviewDTO,
			RecipeReplyDTO recipeReplyDTO, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		// recipeDTO.setMember_id(memberDTO.getMember_id());
		RecipeDTO recipeDTO = new RecipeDTO();
		recipeDTO.setRecipe_num(recipeReplyDTO.getRecipe_num());
		
		recipeDTO = recipeService.recipeDetail(recipeDTO);

		if (memberDTO != null) {
			RecipeDTO bookRecipe = new RecipeDTO();
			bookRecipe.setMember_id(memberDTO.getMember_id());
			bookRecipe.setRecipe_num(recipeDTO.getRecipe_num());
			Long result = recipeService.bookMark(bookRecipe);
			String msg = "";
			if (result >= 1) {
				msg = "ok";
			}
			model.addAttribute("bookMark", msg);
			model.addAttribute("loginMember", memberDTO);

		}

		
		RecipeReviewDTO recipeReviewDTO = new RecipeReviewDTO();
		recipeReviewDTO.setRecipe_num(recipeReplyDTO.getRecipe_num());
		
		List<RecipeReviewDTO> ar = recipeService.reviewList(recipeReviewDTO);
		
		List<RecipeReplyDTO> ar2 = recipeService.replyList(recipeReplyDTO);
		Double result = recipeService.ratingTotal(recipeReviewDTO);

		model.addAttribute("ar", ar);
		model.addAttribute("ar2", ar2);
		model.addAttribute("tot", result);

		String url = "";
		if (recipeDTO != null) {
			model.addAttribute("dto", recipeDTO);

			url = "/recipe/detail";
		} else {
			model.addAttribute("result", "등록되지 않은 레시피입니다.");
			model.addAttribute("url", "/recipe/list");
			url = "recipe/message";
		}

		return url;

	}

	@GetMapping("add")
	public String recipeAdd(HttpSession session, Model model) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		if (memberDTO == null) {
			model.addAttribute("msg", "로그인이 필요합니다.");
			model.addAttribute("url", "/member/login");
			return "commons/message";
		} else {
			return "recipe/add";
		}

	}

	@PostMapping("add")
	public String recipeAdd(RecipeDTO recipeDTO, Model model, MultipartFile attach, HttpSession session)
			throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		recipeDTO.setMember_id(memberDTO.getMember_id());
		int result = recipeService.recipeAdd(recipeDTO, attach, session);

		if (result > 0) {
			model.addAttribute("result", "레시피 등록이 완료됐습니다!");
			model.addAttribute("url", "/recipe/list");
		} else {
			model.addAttribute("result", "레시피 등록에 실패했습니다.");
			model.addAttribute("url", "/recipe/add");
		}
		return "/recipe/message";
	}

	@GetMapping("update")
	public String recipeUpdate(RecipeDTO recipeDTO, Model model, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		recipeDTO = recipeService.recipeDetail(recipeDTO);

		if (memberDTO == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeDTO.getRecipe_num());
			return "commons/message";
		} else if (!memberDTO.getMember_id().equals(recipeDTO.getMember_id())) {
			model.addAttribute("msg", "본인만 수정이 가능합니다.");
			model.addAttribute("url", "/recipe/list");
			return "commons/message";
		} else {

			String url = "";
			if (recipeDTO != null) {
				// model.addAttribute("result", "게시글 수정이 완료 됐습니다");
				model.addAttribute("dto", recipeDTO);
				url = "recipe/update";
				// model.addAttribute("result", "레시피 수정이 완료 됐습니다");
//			model.addAttribute("url", "/recipe/list");
//			return "recipe/message";

			} 
			return url;

		}
	}

	@PostMapping("update")
	public String recipeUpdate(RecipeDTO recipeDTO, MultipartFile attach, HttpSession session, Model model)
			throws Exception {
		int result = recipeService.recipeUpdate(recipeDTO, attach, session);

		if (result > 0) {
			model.addAttribute("result", "레시피 수정이 완료 됐습니다!");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeDTO.getRecipe_num());
			return "food/message";

		}
		model.addAttribute("result", "레시피 수정에 실패 했습니다");
		model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeDTO.getRecipe_num());
		return "food/message";

		// return "redirect:./list";

	}

	@GetMapping("delete")
	public String recipeDelete(HttpSession session, RecipeDTO recipeDTO, Model model) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		recipeDTO = recipeService.recipeDetail(recipeDTO);

		if (memberDTO == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeDTO.getRecipe_num());
			return "commons/message";
		} else if (!memberDTO.getMember_id().equals(recipeDTO.getMember_id())) {
			model.addAttribute("msg", "본인만 삭제가 가능합니다.");
			model.addAttribute("url", "/recipe/list");
			return "commons/message";
		} else {

			int result = recipeService.recipeDelete(recipeDTO);

			if (result > 0) {
				model.addAttribute("result", "게시글 삭제가 완료 됐습니다");
				model.addAttribute("url", "/recipe/list");
				return "food/message";

			}
			model.addAttribute("result", "게시글 삭제에 실패 했습니다");
			model.addAttribute("url", "/recipe/list");
			return "food/message";
		}
	}

	@PostMapping("review")
	public String recipeReview(RecipeReviewDTO recipeReviewDTO, Model model, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		// recipeReviewDTO.setMember_id("");
		int result = recipeService.recipeReview(recipeReviewDTO);

		if (result > 0) {
			model.addAttribute("result", "소중한 리뷰가 등록됐습니다!");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReviewDTO.getRecipe_num());
			return "/recipe/message";
			// model.addAttribute("review",recipeReviewDTO);
		} else {
			model.addAttribute("result", "리뷰등록에 실패했습니다.");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReviewDTO.getRecipe_num());
			return "/recipe/message";
		}

	}

	// qna
	@PostMapping("reply")
	public String recipeReply(RecipeReplyDTO recipeReplyDTO, Model model, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		int result = recipeService.recipeReply(recipeReplyDTO);
		if (result > 0) {
			model.addAttribute("result", "문의가 등록됐습니다!");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReplyDTO.getRecipe_num());
			return "/recipe/message";
			// model.addAttribute("review",recipeReviewDTO);
		} else {
			model.addAttribute("result", "문의등록에 실패했습니다.");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReplyDTO.getRecipe_num());
			return "/recipe/message";
		}

	}

	@PostMapping("replyUpdate")
	public String replyUpdate(RecipeReplyDTO recipeReplyDTO, Model model, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		model.addAttribute("dto", recipeReplyDTO);
		return "recipe/replyUpdate";
	}

	@PostMapping("replyUpdateInsert")
	public String replyUpdateInsert(RecipeReplyDTO recipeReplyDTO, Model model, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		if (memberDTO == null) {
			// -100 : 잘못된 접근입니다.
			model.addAttribute("msg", -100);
		} else if (!memberDTO.getMember_id().equals(recipeReplyDTO.getMember_id())) {
			// -200 : 본인만 수정 가능합니다.
			model.addAttribute("msg", -200);
		} else {
			int result = recipeService.replyUpdateInsert(recipeReplyDTO);
	
			model.addAttribute("msg", result);
		}
		return "commons/result";

	}

	@PostMapping("replyDelete")
	public String replyDelete(RecipeReplyDTO recipeReplyDTO, Model model, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		if (memberDTO == null) {
			// -100 : 잘못된 접근입니다.
			model.addAttribute("msg", -100);
		} else if (!memberDTO.getMember_id().equals(recipeReplyDTO.getMember_id())) {
			// -200 : 본인만 수정 가능합니다.
			model.addAttribute("msg", -200);
		} else {
			int result = recipeService.replyDelete(recipeReplyDTO);
			model.addAttribute("msg", result);
		}
		return "commons/result";
	}

	@PostMapping("reviewUpdateInsert")
	public String reviewUpdateInsert(RecipeReviewDTO recipeReviewDTO, Model model) throws Exception {

		int result = recipeService.reviewUpdateInsert(recipeReviewDTO);

		model.addAttribute("msg", result);
		return "commons/result";

	}

	@PostMapping("reviewUpdate")
	public String reviewUpdate(RecipeReviewDTO recipeReviewDTO, Model model, HttpSession session) throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		if (memberDTO == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReviewDTO.getRecipe_num());
			return "commons/message";
		} else if (!memberDTO.getMember_id().equals(recipeReviewDTO.getMember_id())) {

			model.addAttribute("msg", "본인만 수정 가능합니다.");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReviewDTO.getRecipe_num());
			return "commons/message";

		} else {
			model.addAttribute("dto", recipeReviewDTO);
			return "recipe/reviewUpdate";
		}

	}

	@PostMapping("reviewDelete")
	public String reviewDelete(RecipeReviewDTO recipeReviewDTO, HttpSession session, Model model) throws Exception {

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
//		if (memberDTO == null) {
//			model.addAttribute("msg", "잘못된 접근입니다.");
//			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReviewDTO.getRecipe_num());
//			return "commons/message";
//		} else if (!memberDTO.getMember_id().equals(recipeReviewDTO.getMember_id())) {
//
//			model.addAttribute("msg", "본인만 삭제 가능합니다.");
//			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReviewDTO.getRecipe_num());
//			return "commons/message";
//
//		} else {
		int result = recipeService.reviewDelete(recipeReviewDTO);

		model.addAttribute("msg", result);
		return "commons/result";
	}
//	}

	@PostMapping("comment")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> recipeComment(@RequestBody RecipeReplyDTO recipeReplyDTO, Model model,
			RecipeDTO recipeDTO, HttpSession session) {
		Map<String, Object> response = new HashMap<String, Object>();

		try {
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
			recipeReplyDTO.setMember_id(memberDTO.getMember_id());

			int result = recipeService.recipeComment(recipeReplyDTO);

			if (result > 0) {
				response.put("success", true);
				response.put("message", "답글 등록이 완료됐습니다.");
			} else {
				response.put("success", false);
				response.put("message", "답글 등록에 실패했습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "서버 오류가 발생했습니다.");
		}

		return ResponseEntity.ok(response);
	}

	@GetMapping("getReplies")
	public ResponseEntity<List<RecipeReplyDTO>> getReplies(@RequestParam Long recipe_reply_num) {
		List<RecipeReplyDTO> replies = recipeService.getReplies(recipe_reply_num);
		return ResponseEntity.ok(replies);
	}

	@GetMapping("addWish")
	public String addWish(RecipeDTO recipeDTO, HttpSession session, Model model) throws Exception {

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		if (memberDTO == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeDTO.getRecipe_num());
			return "commons/message";
		} else {
			recipeDTO.setMember_id(memberDTO.getMember_id());
			int result = recipeService.addWish(recipeDTO);
			// model.addAttribute(memberDTO)ck
			model.addAttribute("msg", result);

			return "commons/result";
		}
	}

	@GetMapping("cancel")
	public String cancelWish(RecipeDTO recipeDTO, Model model, HttpSession session) throws Exception {

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		if (memberDTO == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeDTO.getRecipe_num());
			return "commons/message";
		} else if (!memberDTO.getMember_id().equals(recipeDTO.getMember_id())) {
			model.addAttribute("msg", "본인만 삭제 가능합니다.");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeDTO.getRecipe_num());
			return "commons/message";
		} else {
			int result = recipeService.wishUpdate(recipeDTO);
			String url = "/recipe/detail?recipe_num=" + recipeDTO.getRecipe_num();

			model.addAttribute("msg", "레시피 취소");
			model.addAttribute("url", url);

			return "commons/message";

		}

	}

}
