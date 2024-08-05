package com.chef.app.recipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recipe/*")
public class RecipeController {
	@Autowired
	RecipeService recipeService;

	@GetMapping("list")
	public void recipeList(Model model) throws Exception {
		List<RecipeDTO> ar = recipeService.recipeList();
		model.addAttribute("ar", ar);

	}

	@GetMapping("add")
	public void recipeAdd() {

	}

}
