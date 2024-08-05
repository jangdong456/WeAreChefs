package com.chef.app.food;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/food/*")
public class FoodController {
	
	@Autowired
	private FoodService foodService;
	
	@GetMapping("add")
	public void add() throws Exception {
		
	}
	
	@GetMapping("searchFood")
	public String searchFood(FoodDTO foodDTO, Model model) throws Exception {	
		List<FoodDTO> ar = foodService.searchFood(foodDTO);
		System.out.println(ar.get(0).getFood_contents());
		model.addAttribute("foodList", ar);
		return "/food/foodSearchList";
	}
	
}
