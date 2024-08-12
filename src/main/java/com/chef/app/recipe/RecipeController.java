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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chef.app.comment.CommentDTO;

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
	public void recipeDetail(RecipeDTO recipeDTO, Model model) {
		recipeDTO = recipeService.recipeDetail(recipeDTO);
		model.addAttribute("dto", recipeDTO);

		String url = "";
		if (recipeDTO != null) {
			model.addAttribute("dto", recipeDTO);
			url = "/recipe/list";
		} else {
			model.addAttribute("result", "등록되지않은 레시피입니다.");
			model.addAttribute("url", "./list");
			url = "recipe/message";
		}

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
			model.addAttribute("url", "/recipe/list2");
		} else {
			model.addAttribute("result", "레시피 등록에 실패했습니다.");
			model.addAttribute("url", "/recipe/add");
		}
		return "/recipe/message";
	}

	@PostMapping("reply")
	public void recipeReply(CommentDTO commentDTO) {
		commentDTO.setMember_id("ydb");
		recipeService.recipeReply(commentDTO);

	}

	@GetMapping("reply")
	public void recipeReply(RecipeDTO recipeDTO) {

	}

}
