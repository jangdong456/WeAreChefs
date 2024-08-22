package com.chef.app.manager.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chef.app.food.StoreOrderDTO;
import com.chef.app.manager.OriMemberDTO;
import com.chef.app.manager.TotalPurchaseDTO;
import com.chef.app.member.MemberDTO;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	
	// index 첫줄 정보 4가지 --------------------------------------------------------------------------
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

	// memberInfo 회원 정보 List --------------------------------------------------------------------------
	@GetMapping("memberInfo")
	public String managerInfo(Model model) throws Exception{
		List<MemberDTO> MemberListDesc = managerService.getMemberListDesc();
		model.addAttribute("memberListDesc", MemberListDesc);
		
		return "manager/info";
	}
	
	// memberDetail 회원 정보 --------------------------------------------------------------------------
	@GetMapping("memberDetail")
	public String memberDetail(MemberDTO memberDTO, Model model) throws Exception{
		model.addAttribute("memberDetail", managerService.getMemberDetail(memberDTO));
		
		return "manager/memberDetail";
	}
	
	@GetMapping("memberDetailSample")
	public String memberDetailSample(MemberDTO memberDTO, Model model) throws Exception{
		model.addAttribute("memberDetail", managerService.getMemberDetail(memberDTO));
		
		return "manager/memberDetailSample";
	}
	
	// memberDetail 회원 정보 수정 --------------------------------------------------------------------------
	@GetMapping("memberDetailUpdate")
	public String memberDetailUpdate(MemberDTO memberDTO, Model model) throws Exception{
		model.addAttribute("memberDetail", managerService.getMemberDetail(memberDTO));
		return "manager/memberDetailUpdate";
	}
	
	@PostMapping("memberDetailUpdate")
	public String postMemberDetailUpdate(OriMemberDTO memberDTO, Model model) throws Exception{
		int result = managerService.postMemberDetailUpdate(memberDTO);
		System.out.println("memberDetail Update Pw : " + memberDTO.getMember_pwd());
		System.out.println("");
		if(result > 0) {
			model.addAttribute("memberDetail", managerService.getMemberDetail(memberDTO));
			return "manager/memberDetailSample";
		}else {
			model.addAttribute("msg", "오류 발생");
			model.addAttribute("url", "manager/memberDetail");
			return "commons/message";
		}
	}
	
	// 회원정보 수정 제약조건 --------------------------------------------------------------------------
	// 아이디 검사
	@PostMapping("memberIdConfirm")
	public String memberUpdateConfirm(MemberDTO memberDTO, OriMemberDTO oriMemberDTO, Model model) throws Exception{
		if(memberDTO.getMember_id().equals(oriMemberDTO.getOriMember_id())) {
			model.addAttribute("msg", 0);
			return "commons/result";
		}else {
			Long memberId = managerService.confirmMemberId(memberDTO);
			model.addAttribute("msg", memberId);	
			return "commons/result";
		}
	}
	//닉네임 검사
	@PostMapping("memberNicknameConfirm")
	public String memberNicknameConfirm(MemberDTO memberDTO, OriMemberDTO oriMemberDTO, Model model) throws Exception{
		if(memberDTO.getMember_nickname().equals(oriMemberDTO.getOriMember_nickname())) {
			model.addAttribute("msg", 0);
			return "commons/result";
		}else {
			Long memberNickname = managerService.confirmMemberNickname(memberDTO);
			model.addAttribute("msg", memberNickname);	
			return "commons/result";
		}
	}
	// 메일
	@PostMapping("memberMailConfirm")
	public String memberMailConfirm(MemberDTO memberDTO, OriMemberDTO oriMemberDTO, Model model) throws Exception{
		if(memberDTO.getMember_mail().equals(oriMemberDTO.getOriMember_mail())) {
			model.addAttribute("msg", 0);
			return "commons/result";
		}else {
			Long memberMail = managerService.confirmMemberMail(memberDTO);
			model.addAttribute("msg", memberMail);	
			return "commons/result";
		}
	}
	// 연락처
	@PostMapping("memberPhoneConfirm")
	public String memberPhoneConfirm(MemberDTO memberDTO, OriMemberDTO oriMemberDTO, Model model) throws Exception{
		if(memberDTO.getMember_phone().equals(oriMemberDTO.getOriMember_phone())) {
			model.addAttribute("msg", 0);
			return "commons/result";
		}else {
			Long memberPhone = managerService.confirmMemberPhone(memberDTO);
			model.addAttribute("msg", memberPhone);	
			return "commons/result";
		}
	}
	
	// 주문 & 배송
	// 주문
	// orderList
	@GetMapping("orderList")
	public String orderList(Model model) throws Exception{
		model.addAttribute("orderList", managerService.getOrderList());
		model.addAttribute("cancelOrderList", managerService.getCancelOrderList());
		return "manager/orderList";
	}
	// orderList cancelOk
	@PostMapping("cancelOk")
	public String cancelOk(StoreOrderDTO storeOrderDTO, Model model) throws Exception{
		int result = managerService.cancelOk(storeOrderDTO);
		if(result>0){
			model.addAttribute("cancelOrderList", managerService.getCancelOrderList());
			return "manager/cancelOrderListSample";
		}else {
			model.addAttribute("result", 1);
			return "commons/result";
		}
	}
	// orderList cancelNo
	@PostMapping("cancelNo")
	public String cancelNo(StoreOrderDTO storeOrderDTO, Model model) throws Exception{
		int result = managerService.cancelNo(storeOrderDTO);
		if(result>0){
			model.addAttribute("cancelOrderList", managerService.getCancelOrderList());
			return "manager/cancelOrderListSample";
		}else {
			model.addAttribute("result", 1);
			return "commons/result";
		}
	}
	// orderDetail
	@GetMapping("orderDetail")
	public String orderDetail(StoreOrderDTO storeOrderDTO, Model model) throws Exception{
		model.addAttribute("orderDetail", managerService.orderDetail(storeOrderDTO));
		
		if(managerService.orderFoodDetail(storeOrderDTO).size() == 0){
			model.addAttribute("foodSize", 0);
		}else {
			model.addAttribute("orderFoodDetail", managerService.orderFoodDetail(storeOrderDTO));			
		}
		return "manager/orderDetail";
	}
	// orderDetail Update Page loading
	@PostMapping("orderDetailUpdate")
	public String orderDetailUpdate(StoreOrderDTO storeOrderDTO, Model model) throws Exception{
		model.addAttribute("orderDetail", managerService.orderDetail(storeOrderDTO));
		if(managerService.orderFoodDetail(storeOrderDTO).size() == 0){
			model.addAttribute("foodSize", 0);
		}else {
			model.addAttribute("orderFoodDetail", managerService.orderFoodDetail(storeOrderDTO));			
		}
		return "manager/orderDetailUpdate";
	}
	// 수정 완료 버튼 클릭 시
	@PostMapping("completeOrderDetailUpdate")
	public String completeOrderDetailUpdate(StoreOrderDTO storeOrderDTO, Model model) throws Exception{
		int result = managerService.completeOrderDetailUpdate(storeOrderDTO);
		if(result > 0) {
			model.addAttribute("orderDetail", managerService.orderDetail(storeOrderDTO));
			if(managerService.orderFoodDetail(storeOrderDTO).size() == 0){
				model.addAttribute("foodSize", 0);
			}else {
				model.addAttribute("orderFoodDetail", managerService.orderFoodDetail(storeOrderDTO));			
			}
			return "manager/orderDetailSample";
		}else {
			model.addAttribute("msg", 0);
			return "commons/result";
		}

	}
	// 수정 취소 버튼 클릭 시 발생
	@GetMapping("cancelOrderDetailUpdate")
	public String cancelOrderDetailUpdate(StoreOrderDTO storeOrderDTO, Model model) throws Exception{
		model.addAttribute("orderDetail", managerService.orderDetail(storeOrderDTO));
		
		if(managerService.orderFoodDetail(storeOrderDTO).size() == 0){
			model.addAttribute("foodSize", 0);
		}else {
			model.addAttribute("orderFoodDetail", managerService.orderFoodDetail(storeOrderDTO));			
		}
		return "manager/orderDetailSample";
	}
	
	// stockList-------------------------------------------------------------------------------------
	@GetMapping("stockList")
	public String stockList(Model model) throws Exception{
		model.addAttribute("stockList", managerService.stockList());
		return "manager/stockList";
	}
//끝
}
