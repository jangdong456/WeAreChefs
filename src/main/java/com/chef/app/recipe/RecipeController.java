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
	public Map<String, String> uploadContentImage(MultipartFile attach, Model model, HttpSession session)
			throws Exception {

		String imgName = recipeService.uploadContentImage(attach, session);
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

		System.out.println("getMember_id" + recipeDTO.getMember_id());
		List<RecipeDTO> ar = recipeService.recipeList(recipePager);

		model.addAttribute("ar", ar);
		model.addAttribute("recipePager", recipePager);
		System.out.println("recipePager.getPage() cont " + recipePager.getPage());
		System.out.println("lastNum" + recipePager.getLastNum());

		List<Map<String, Object>> categoryCount = recipeService.categoryCount();
		System.out.println("categoryCount " + categoryCount.toString());
		model.addAttribute("count", categoryCount);

	}

	@GetMapping("detail")
	public String recipeDetail(RecipeDTO recipeDTO, Model model, RecipeReviewDTO recipeReviewDTO,
			RecipeReplyDTO recipeReplyDTO, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		// recipeDTO.setMember_id(memberDTO.getMember_id());

		recipeDTO = recipeService.recipeDetail(recipeDTO);
		// System.out.println("getMember_id " + recipeDTO.getMember_id());
		// System.out.println(recipeDTO.getRecipe_name());
		List<RecipeReviewDTO> ar = recipeService.reviewList(recipeReviewDTO);
		List<RecipeReviewDTO> ar2 = recipeService.replyList(recipeReplyDTO, recipeDTO);

		model.addAttribute("ar", ar);
		model.addAttribute("ar2", ar2);

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
	public void recipeAdd() throws Exception {

	}

	@PostMapping("add")
	public String recipeAdd(RecipeDTO recipeDTO, Model model, MultipartFile attach, HttpSession session)
			throws Exception {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		recipeDTO.setMember_id(memberDTO.getMember_id());
		int result = recipeService.recipeAdd(recipeDTO, attach, session);

		System.out.println("controller num" + recipeDTO.getRecipe_num());
		System.out.println("controller name" + recipeDTO.getRecipe_name());

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

		recipeDTO = recipeService.recipeDetail(recipeDTO);
		String url = "";
		if (recipeDTO != null) {
			// model.addAttribute("result", "게시글 수정이 완료 됐습니다");
			model.addAttribute("dto", recipeDTO);
			url = "recipe/update";
			// model.addAttribute("result", "레시피 수정이 완료 됐습니다");
			System.out.println("update");
			System.out.println(url);
			System.out.println(recipeDTO.getRecipe_num());
//			model.addAttribute("url", "/recipe/list");
//			return "recipe/message";

		} else {
			model.addAttribute("result", "없는 상품입니다.");
			model.addAttribute("url", "./list");
			url = "commons/message";
		}
		return url;

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
	public String recipeDelete(RecipeDTO recipeDTO, Model model) throws Exception {

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

	@PostMapping("review")
	public String recipeReview(RecipeReviewDTO recipeReviewDTO, Model model) {
		recipeReviewDTO.setMember_id("ydb");
		int result = recipeService.recipeReview(recipeReviewDTO);
		System.out.println("getRecipe_rating" + recipeReviewDTO.getRecipe_rating());

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
	public String recipeReply(RecipeReplyDTO recipeReplyDTO, Model model) {
		recipeReplyDTO.setMember_id("ydb");
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
	public String replyUpdate(RecipeReplyDTO recipeReplyDTO, Model model) throws Exception {

		model.addAttribute("dto", recipeReplyDTO);

		return "recipe/replyUpdate";

	}

	@PostMapping("reviewUpdate")
	public String reviewUpdate(RecipeReviewDTO recipeReviewDTO, Model model) throws Exception {

		System.out.println(recipeReviewDTO.getBoard_content());
		System.out.println(recipeReviewDTO.getReview_num());
		int result = recipeService.reviewUpdate(recipeReviewDTO);

		model.addAttribute("msg", result);
		return "commons/result";

	}

	@PostMapping("comment")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> recipeComment(@RequestBody RecipeReplyDTO recipeReplyDTO, Model model,
			RecipeDTO recipeDTO) {
		Map<String, Object> response = new HashMap<String, Object>();
//		    
//		System.out.println(recipeReplyDTO.getRecipe_num());
//		System.out.println(recipeReplyDTO.getBoard_content());
//		System.out.println(recipeReplyDTO.getRecipe_reply_num());
//		recipeReplyDTO.setMember_id("ydb");
//
//		// System.out.println("원본글 " + recipeReplyDTO.getRef());
//
//		int result = recipeService.recipeComment(recipeReplyDTO);
//		
//	    if (result > 0) {
//	        // If the insertion was successful, return success JSON
//	        response.put("success", true);
//	        response.put("message", "답글 등록이 완료됐습니다.");
//	    } else {
//	        // If the insertion failed, return failure JSON
//	        response.put("success", false);
//	        response.put("message", "답글 등록에 실패했습니다.");
//	    }
//	    return ResponseEntity.ok(response);
//		model.addAttribute("msg", result);
//		return "commons/result";

//		if (result > 0) {
//			model.addAttribute("result", "답변이 등록됐습니다!");
//			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReplyDTO.getRecipe_num());
//			return "/recipe/message";
//			// model.addAttribute("review",recipeReviewDTO);
//		} else {
//			model.addAttribute("result", "답변등록에 실패했습니다.");
//			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReplyDTO.getRecipe_num());
//			return "/recipe/message";
//		}
		try {
			// Print debug information
			System.out.println("recipe_num: " + recipeReplyDTO.getRecipe_num());
			System.out.println("board_content: " + recipeReplyDTO.getBoard_content());
			System.out.println("recipe_reply_num: " + recipeReplyDTO.getRecipe_reply_num());

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

}
