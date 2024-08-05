package com.chef.app.board.fna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/fna/*")
public class FnaController {	
	
	@ModelAttribute("inquiry")
	public String get_inquiry() {
		return "fna";
	}
	
	@GetMapping("list")
	public String fna_list() throws Exception {
		
		return "board/inquiry/list";
	}

}
