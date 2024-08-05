package com.chef.app.food;

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

@Controller
@RequestMapping("/food/*")
public class FoodController {
	
	@Autowired
	private FoodService foodService;
	
	@GetMapping("add")
	public void add() throws Exception {
		
	}
	
	@PostMapping("add")
	public void add(FoodDTO foodDTO,MultipartFile attach,HttpSession session) throws Exception {
		
		
		
	}
	
	@GetMapping("searchFood")
	public String searchFood(FoodDTO foodDTO, Model model) throws Exception {	
		
		List<FoodDTO> ar = foodService.searchFood(foodDTO);
		model.addAttribute("list", ar);
		return "food/foodSearchList";
		
	}
	
}
