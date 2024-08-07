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

import com.chef.app.util.Pager;

@Controller
@RequestMapping("/food/*")
public class FoodController {
	
	@Autowired
	private FoodService foodService;
	
	@GetMapping("add")
	public void add() throws Exception {
		
	}
	
	@PostMapping("add")
	public String add(FoodDTO foodDTO,MultipartFile attach,HttpSession session,Model model) throws Exception {
		
		int result = foodService.add(foodDTO, attach, session);
		
		if(result>0) {
			model.addAttribute("result", "상품 등록이 완료됐습니다");
			model.addAttribute("url", "/food/list");
			return "food/message";
		}
		
		model.addAttribute("result", "상품 등록에 실패했습니다");
		model.addAttribute("url", "/food/list");
		return "food/message";
		
	}
	
	@GetMapping("searchFood")
	public String searchFood(FoodDTO foodDTO, Model model) throws Exception {	
		
		List<FoodDTO> ar = foodService.searchFood(foodDTO);
		model.addAttribute("list", ar);
		return "food/foodSearchList";
		
	}
	

	@PostMapping("uploadContentImage")
	@ResponseBody
	public Map<String, String> uploadContentImage(MultipartFile upload,Model model,HttpSession session) throws Exception{

		String imgName = foodService.uploadContentImage(upload, session);
		String path ="/resources/upload/foodcontents/"+imgName;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("url", path);

		return map;

	}
	
	@GetMapping("list")
	public void getList(FoodPager pager,Model model) throws Exception{
		List<FoodDTO> ar =foodService.getList(pager);
		List<Map<String, Object>> categoryCount =foodService.categoryCount();
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
		model.addAttribute("count", categoryCount);
	}
	
	@PostMapping("list")
	public String getListSearch(FoodPager pager,Model model) throws Exception{

		List<FoodDTO> ar =foodService.getList(pager);
		List<Map<String, Object>> categoryCount =foodService.categoryCount();
		model.addAttribute("pager", pager);
		model.addAttribute("list", ar);
		model.addAttribute("count", categoryCount);

		return "food/nameSearchList";
		
	}
	
	@GetMapping("detail")
	public void getDetail(FoodDTO foodDTO,Model model) throws Exception {
		
		foodDTO = foodService.getDetail(foodDTO);
		model.addAttribute("dto", foodDTO);

	}
	
}
