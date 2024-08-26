package com.chef.app.manager.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.chef.app.food.FoodDTO;
import com.chef.app.food.StoreOrderDTO;
import com.chef.app.manager.OriMemberDTO;
import com.chef.app.manager.StockBuyingDTO;
import com.chef.app.manager.StockCartDTO;
import com.chef.app.manager.StockMidBuyingDTO;
import com.chef.app.manager.TotalPurchaseDTO;
import com.chef.app.member.MemberDAO;
import com.chef.app.member.MemberDTO;

@Service
public class ManagerService {
	@Autowired
	private ManagerDAO managerDAO;
	
	// index 첫줄 정보-----------------------------------------------------------------------------
	public List<Long> getIndexFirstRowInfo() throws Exception{
		List<Long> indexFirstRowInfo = new ArrayList<Long>();
		indexFirstRowInfo.add(managerDAO.getMemberTotalCount());
		indexFirstRowInfo.add(managerDAO.getOrderCompleteCount());
		indexFirstRowInfo.add(managerDAO.getCancelOrderCount());
		indexFirstRowInfo.add(managerDAO.getRequiredFoodStockOrderCount());
		return indexFirstRowInfo;
	}
	
	// index 차트 정보-----------------------------------------------------------------------------
	public List<TotalPurchaseDTO> getMonthSales() throws Exception{
		
		return managerDAO.getMonthSales();
	}
	
	// index 멤버 정보-----------------------------------------------------------------------------
	public List<MemberDTO> getMemberListAsc() throws Exception{
		return managerDAO.getMemberListAsc();
	}
	
	public List<MemberDTO> getMemberListDesc() throws Exception{
		return managerDAO.getMemberListDesc();
	}
	
	// index 주문 정보-----------------------------------------------------------------------------
	public List<StoreOrderDTO> getOrderListDesc() throws Exception{
		return managerDAO.getOrderListDesc();
	}
	
	// MemberDetail 회원 정보-----------------------------------------------------------------------------
	public MemberDTO getMemberDetail(MemberDTO memberDTO) throws Exception{
		return managerDAO.getMemberDetail(memberDTO);
	}
	
	public int postMemberDetailUpdate(OriMemberDTO memberDTO) throws Exception{
		// 이전에 있던 비밀번호 값
		String beforePw = managerDAO.getOneMember(memberDTO).getMember_pwd();
		// 변경한 비밀번호 값
		String afterPw = memberDTO.getMember_pwd();
		System.out.println("비교");
		System.out.println(beforePw);
		System.out.println(afterPw);
		
		if(!beforePw.equals(afterPw)) {
			String hashpw = BCrypt.hashpw(memberDTO.getMember_pwd(), BCrypt.gensalt());
			memberDTO.setMember_pwd(hashpw);
		}

		
		
		return managerDAO.postMemberDetailUpdate(memberDTO);
	}
	// 중복 확인-----------------------------------------------------------------------------
	// Id
	public Long confirmMemberId(MemberDTO memberDTO) throws Exception{
		return managerDAO.confirmMemberId(memberDTO);
	}
	// nickname
	public Long confirmMemberNickname(MemberDTO memberDTO) throws Exception{
		return managerDAO.confirmMemberNickname(memberDTO);
	}
	// mail
	public Long confirmMemberMail(MemberDTO memberDTO) throws Exception{
		return managerDAO.confirmMemberMail(memberDTO);
	}
	// phone
	public Long confirmMemberPhone(MemberDTO memberDTO) throws Exception{
		return managerDAO.confirmMemberPhone(memberDTO);
	}
	// ORDER-----------------------------------------------------------------------------
	// order List
	public List<StoreOrderDTO> getOrderList() throws Exception{
		return managerDAO.getOrderList();
	}	
	// CANCEL ORDER
	public List<StoreOrderDTO> getCancelOrderList() throws Exception{
		return managerDAO.getCancelOrderList();
	}
	//cancelOk
	public int cancelOk(StoreOrderDTO storeOrderDTO) throws Exception{
		return managerDAO.cancelOk(storeOrderDTO);
	}
	//cancelNo
	public int cancelNo(StoreOrderDTO storeOrderDTO) throws Exception{
		return managerDAO.cancelNo(storeOrderDTO);
	}
	// orderDetail
	public StoreOrderDTO orderDetail(StoreOrderDTO storeOrderDTO) throws Exception{
		return managerDAO.orderDetail(storeOrderDTO);
	}
	// orderFoodDetail
	public List<FoodDTO> orderFoodDetail(StoreOrderDTO storeOrderDTO) throws Exception{
		return managerDAO.orderFoodDetail(storeOrderDTO);
	}
	// 주문 배송 정보 수정
	public int completeOrderDetailUpdate(StoreOrderDTO storeOrderDTO) throws Exception{
		return managerDAO.completeOrderDetailUpdate(storeOrderDTO);
	}
	
	// STOCK LIST ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	public List<FoodDTO> stockList() throws Exception{
		return managerDAO.stockList();
	}
	
	public List<FoodDTO> stockLackList() throws Exception{
		return managerDAO.stockLackList();
	}
	
	public List<StockCartDTO> stockCartList() throws Exception{
		return managerDAO.stockCartList();
	}
	
	// 상품 구매
	public int buyingStock(StockMidBuyingDTO [] ar) throws Exception{
		// StockBuying 값 insert
		Long seq = managerDAO.getStockBuyingSeq();
		Long sum = 0L;
		for(StockMidBuyingDTO a : ar) {
			sum = sum + a.getFood_price();
		}
		StockBuyingDTO stockBuyingDTO = new StockBuyingDTO();
		stockBuyingDTO.setBuying_num(seq);
		stockBuyingDTO.setBuying_total_price(sum);
		int resultOne = managerDAO.addStockBuying(stockBuyingDTO);
		
		// StockMidBuying 값 insert
		
		boolean flag1 = true;
		boolean flag2 = true;
		
		for(StockMidBuyingDTO a : ar) {
			a.setBuying_num(seq);
			int resultTwo = managerDAO.addStockMidBuying(a);
			int resultThree = managerDAO.updateFoodStock(a);
			System.out.println("2 : " + resultTwo);
			System.out.println("3 : " + resultThree);
			if(resultTwo == 0) {
				flag1 = false;
			}
			if(resultThree == 0) {
				flag2 = false;
			}
		}
		
		if(resultOne == 1 && flag1 == true && flag2 == true) {
			return 1;
		}else {
			return 0;
		}
	}
	
	// add items to food table. When click addBtn.
	public void addItems(FoodDTO [] ar) throws Exception{
		FoodDTO foodDTO = new FoodDTO();
		int i = 0;
		for(FoodDTO a : ar) {
			System.out.println(" @@ service : " + i);
			System.out.println("종류 : " + a.getFood_category());
			System.out.println("이름 : "+a.getFood_name());
			System.out.println("구매가 : " + a.getFood_buying());
			System.out.println("판매가 : " + a.getFood_price());
			//int result = managerDAO.addItems(a);
			//System.out.println("r : " + result);
			System.out.println(" $$ sr");
			i++;
		}		

//		return managerDAO.addItems(ar);
	}
}
