package com.chef.app.food;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/food/*")
public class FoodController {

	@GetMapping("add")
	public void add() throws Exception {
		System.out.println("add페이지");
	}
	
}
