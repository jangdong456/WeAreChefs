package com.chef.app.manager.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chef.app.manager.MonthTotalPurchaseDTO;
import com.chef.app.member.MemberDTO;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	
	@GetMapping("index")
	public String managerIndex(Model model) throws Exception{
		List<Long> indexFirstRowInfo = managerService.getIndexFirstRowInfo();
		model.addAttribute("indexFirstRowInfo", indexFirstRowInfo);

		List<MemberDTO> MemberListDesc = managerService.getMemberListDesc();
		model.addAttribute("memberListDesc", MemberListDesc);
		
		List<MonthTotalPurchaseDTO> MonthTotalPurchase = managerService.getMonthTotalPurchase();
		model.addAttribute("monthTotalPurchase", MonthTotalPurchase);
		
		return "manager/index";
	}
	
	@GetMapping("memberInfo")
	public String managerInfo(Model model) throws Exception{
		List<MemberDTO> MemberListDesc = managerService.getMemberListDesc();
		model.addAttribute("memberListDesc", MemberListDesc);
		
		return "manager/info";
	}

}
