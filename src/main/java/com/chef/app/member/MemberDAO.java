package com.chef.app.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chef.app.recipe.RecipeDTO;
import com.chef.app.recipe.RecipeReplyDTO;
import com.chef.app.recipe.RecipeReviewDTO;
import com.chef.app.food.StoreOrderDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.chef.app.member.MemberDAO.";
	
	public int prfileSnsDelete(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "prfileSnsDelete", memberDTO);
	}
	
	public int prfileSnsAdd(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "prfileSnsAdd", memberDTO);
	}
	
	public int profileDelete(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "profileDelete", memberDTO);
	}
	
	public int profileChange(MemberDTO memberDTO) throws Exception {
		System.out.println("dao 넘어옴?@@@@@@@@");
		
		return sqlSession.update(NAMESPACE + "profileChange", memberDTO);
	}
	
	public List<RecipeReplyDTO> recipeReplyList(MemberDTO test) throws Exception {
		return sqlSession.selectList(NAMESPACE + "recipeReplyList" ,test);
	}
	
	public List<RecipeReviewDTO> recipeReviewList(MemberDTO test) throws Exception {
		return sqlSession.selectList(NAMESPACE + "recipeReviewList" ,test);
	}
	
	public List<RecipeDTO> recipeList(MemberDTO test) throws Exception {
		return sqlSession.selectList(NAMESPACE + "recipeList", test);
	}
	
	public int duplication(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+ "duplication" , memberDTO);
	}
	
	public int introducesDelete(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "introducesDelete", memberDTO);
	}
	
	public int mypageUpdate(MemberDTO memberDTO)throws Exception {
		return sqlSession.update(NAMESPACE + "mypageUpdate", memberDTO);
	}
	
	public MemberDTO mypage(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "mypage", memberDTO);
	}
	
	public int kakaoCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "kakaoCheck", memberDTO);
	}
	
	public MemberDTO kakaologin2(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "kakaologin2", memberDTO);
	}
	
	public int kakaologin(MemberDTO memberDTO) throws Exception {
		System.out.println("== Kakao DAO ==");
		return sqlSession.insert(NAMESPACE + "kakaologin", memberDTO);
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		System.out.println("== login DAO ==");	
		return sqlSession.selectOne(NAMESPACE + "login", memberDTO);
	}
	
	public int join(MemberDTO memberDTO) throws Exception {
		System.out.println("== Join DAO ==");
		return sqlSession.insert(NAMESPACE + "join", memberDTO);
	}
	
	public List<StoreOrderDTO> buyList(Map<String, Object> comeMap) throws Exception {
		return sqlSession.selectList(NAMESPACE+"buyList", comeMap);
	}
	
	public int cancleRequest (StoreOrderDTO storeOrderDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"cancleRequest", storeOrderDTO);
	}
}
