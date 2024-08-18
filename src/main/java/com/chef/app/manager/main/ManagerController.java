package com.chef.app.manager.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chef.app.food.StoreOrderDTO;
import com.chef.app.manager.TotalPurchaseDTO;
import com.chef.app.member.MemberDTO;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	
	// index 첫줄 정보 4가지
	@GetMapping("index")
	public String managerIndex(Model model) throws Exception{
		List<Long> indexFirstRowInfo = managerService.getIndexFirstRowInfo();
		model.addAttribute("indexFirstRowInfo", indexFirstRowInfo);

		List<TotalPurchaseDTO> monthSales = managerService.getMonthSales();
		model.addAttribute("monthSales", monthSales);
		
		List<MemberDTO> memberListDesc = managerService.getMemberListDesc();
		model.addAttribute("memberListDesc", memberListDesc);
		
		List<StoreOrderDTO> orderListDesc = managerService.getOrderListDesc();
		model.addAttribute("orderListDesc", orderListDesc);
		
		return "manager/index";
	}

	// index 신규 회원 정보
	@GetMapping("memberInfo")
	public String managerInfo(Model model) throws Exception{
		List<MemberDTO> MemberListDesc = managerService.getMemberListDesc();
		model.addAttribute("memberListDesc", MemberListDesc);
		
		return "manager/info";
	}
	
	// memberDetail 회원 정보
	@GetMapping("memberDetail")
	public String memberDetail(MemberDTO memberDTO, Model model) throws Exception{
		model.addAttribute("memberDetail", managerService.getMemberDetail(memberDTO));
		
		return "manager/memberDetail";
	}
	
	// memberDetail 회원 정보 수정
	@GetMapping("memberDetailUpdate")
	public String memberDetailUpdate(MemberDTO memberDTO, Model model) throws Exception{
		model.addAttribute("memberDetail", managerService.getMemberDetail(memberDTO));
		return "manager/memberDetailUpdate";
	}

}
