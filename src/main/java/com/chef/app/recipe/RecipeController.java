package com.chef.app.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public void recipeList(Model model, RecipePager recipePager) throws Exception {
		// pager.setPage(1L);
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
			RecipeReplyDTO recipeReplyDTO) {
		recipeDTO = recipeService.recipeDetail(recipeDTO);
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

	@PostMapping("comment")
	@ResponseBody
	public String recipeComment(@RequestBody RecipeReplyDTO recipeReplyDTO, Model model, RecipeDTO recipeDTO) {
		System.out.println(recipeReplyDTO.getRecipe_num());
		System.out.println(recipeReplyDTO.getBoard_content());
		System.out.println(recipeReplyDTO.getRecipe_reply_num());
		recipeReplyDTO.setMember_id("ydb");

		// System.out.println("원본글 " + recipeReplyDTO.getRef());

		int result = recipeService.recipeComment(recipeReplyDTO);

		if (result > 0) {
			model.addAttribute("result", "답변이 등록됐습니다!");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReplyDTO.getRecipe_num());
			return "/recipe/message";
			// model.addAttribute("review",recipeReviewDTO);
		} else {
			model.addAttribute("result", "답변등록에 실패했습니다.");
			model.addAttribute("url", "/recipe/detail?recipe_num=" + recipeReplyDTO.getRecipe_num());
			return "/recipe/message";
		}

	}

}
