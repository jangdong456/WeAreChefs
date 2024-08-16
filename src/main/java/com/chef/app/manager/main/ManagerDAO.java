package com.chef.app.manager.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chef.app.manager.MonthTotalPurchaseDTO;
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
	
	// index 차트 정보
	public List<MonthTotalPurchaseDTO> getMonthTotalPurchase() throws Exception{
		return sqlSession.selectList(NAMESPACE + "getMonthTotalPurchase");
	}
	
	public List<MemberDTO> getMemberListAsc() throws Exception{
		return sqlSession.selectList(NAMESPACE + "getMemberListAsc");
	}
	
	public List<MemberDTO> getMemberListDesc() throws Exception{
		return sqlSession.selectList(NAMESPACE + "getMemberListDesc");
	}
	
	public Long getRequiredFoodStockOrderCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getRequiredFoodStockOrderCount");
	}
	
}