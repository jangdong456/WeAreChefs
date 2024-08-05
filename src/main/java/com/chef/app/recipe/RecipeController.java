package com.chef.app.recipe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recipe/*")
public class RecipeController {
	@Autowired
	RecipeService recipeService;

	@GetMapping("add")
	public void add() {

	}

}
