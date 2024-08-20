package com.chef.app.manager.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chef.app.food.StoreOrderDTO;
import com.chef.app.manager.OriMemberDTO;
import com.chef.app.manager.TotalPurchaseDTO;
import com.chef.app.member.MemberDTO;

@Repository
public class ManagerDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.chef.app.manager.main.ManagerDAO.";

	// index 상단 첫줄 정보 4개
	public Long getMemberTotalCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getMemberTotalCount");
	}
	
	public Long getOrderCompleteCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getOrderCompleteCount");
	}
	
	public Long getDeliveryCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getDeliveryCount");
	}
	
	public Long getRequiredFoodStockOrderCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getRequiredFoodStockOrderCount");
	}
	
	// index 차트 정보
	public List<TotalPurchaseDTO> getMonthSales() throws Exception{
		return sqlSession.selectList(NAMESPACE + "getMonthSales");
	}
	
	// index 멤버 정보
	public List<MemberDTO> getMemberListAsc() throws Exception{
		return sqlSession.selectList(NAMESPACE + "getMemberListAsc");
	}
	
	public List<MemberDTO> getMemberListDesc() throws Exception{
		return sqlSession.selectList(NAMESPACE + "getMemberListDesc");
	}
	
	// index 주문 정보
	public List<StoreOrderDTO> getOrderListDesc() throws Exception{
		return sqlSession.selectList(NAMESPACE + "getOrderListDesc");
	}
	
	// memeberDetail 회원 정보
	public MemberDTO getMemberDetail(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getMemberDetail", memberDTO);
	}
	
	public int postMemberDetailUpdate(OriMemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "postMemberDetailUpdate", memberDTO);
	}
	
	// 중복 확인
	//아이디
	public Long confirmMemberId(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "confirmMemberId", memberDTO);
	}
	//닉네임
	public Long confirmMemberNickname(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "confirmMemberNickname", memberDTO);
	}
	//이름
	public Long confirmMemberName(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "confirmMemberName", memberDTO);
	}
	//메일
	public Long confirmMemberMail(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "confirmMemberMail", memberDTO);
	}
	//연락처
	public Long confirmMemberPhone(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "confirmMemberPhone", memberDTO);
	}
	
}
