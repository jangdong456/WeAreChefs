package com.chef.app.manager.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chef.app.food.StoreOrderDTO;
import com.chef.app.manager.OriMemberDTO;
import com.chef.app.manager.TotalPurchaseDTO;
import com.chef.app.member.MemberDTO;

@Service
public class ManagerService {
	@Autowired
	private ManagerDAO managerDAO;
	
	// index 첫줄 정보
	public List<Long> getIndexFirstRowInfo() throws Exception{
		List<Long> indexFirstRowInfo = new ArrayList<Long>();
		indexFirstRowInfo.add(managerDAO.getMemberTotalCount());
		indexFirstRowInfo.add(managerDAO.getOrderCompleteCount());
		indexFirstRowInfo.add(managerDAO.getDeliveryCount());
		indexFirstRowInfo.add(managerDAO.getRequiredFoodStockOrderCount());
		return indexFirstRowInfo;
	}
	
	// index 차트 정보
	public List<TotalPurchaseDTO> getMonthSales() throws Exception{
		
		return managerDAO.getMonthSales();
	}
	
	// index 멤버 정보
	public List<MemberDTO> getMemberListAsc() throws Exception{
		return managerDAO.getMemberListAsc();
	}
	
	public List<MemberDTO> getMemberListDesc() throws Exception{
		return managerDAO.getMemberListDesc();
	}
	
	// index 주문 정보
	public List<StoreOrderDTO> getOrderListDesc() throws Exception{
		return managerDAO.getOrderListDesc();
	}
	
	// MemberDetail 회원 정보
	public MemberDTO getMemberDetail(MemberDTO memberDTO) throws Exception{
		return managerDAO.getMemberDetail(memberDTO);
	}
	
	public int postMemberDetailUpdate(OriMemberDTO memberDTO) throws Exception{
		return managerDAO.postMemberDetailUpdate(memberDTO);
	}
	// 중복 확인
	// Id
	public Long confirmMemberId(MemberDTO memberDTO) throws Exception{
		return managerDAO.confirmMemberId(memberDTO);
	}
	// nickname
	public Long confirmMemberNickname(MemberDTO memberDTO) throws Exception{
		return managerDAO.confirmMemberNickname(memberDTO);
	}
	// name
	public Long confirmMemberName(MemberDTO memberDTO) throws Exception{
		return managerDAO.confirmMemberName(memberDTO);
	}
	// mail
	public Long confirmMemberMail(MemberDTO memberDTO) throws Exception{
		return managerDAO.confirmMemberMail(memberDTO);
	}
	// phone
	public Long confirmMemberPhone(MemberDTO memberDTO) throws Exception{
		return managerDAO.confirmMemberPhone(memberDTO);
	}
}
