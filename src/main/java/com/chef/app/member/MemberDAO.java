package com.chef.app.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chef.app.recipe.RecipeDTO;
import com.chef.app.recipe.RecipeReplyDTO;
import com.chef.app.recipe.RecipeReviewDTO;
import com.chef.app.util.Pager;
import com.chef.app.food.StoreOrderDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.chef.app.member.MemberDAO.";
	
	
	public Long recipeHit(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "recipeHit", memberDTO);
	}
	
	public Long getTotalCount(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", map);
	}
	
	public List<RecipeDTO> recipeRecentList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "recipeRecentList");
	}
	
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
		return sqlSession.update(NAMESPACE + "profileChange", memberDTO);
	}
	
	public List<RecipeDTO> wishList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE + "wishList", map);
	}
	
	public List<RecipeReplyDTO> recipeReplyList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE + "recipeReplyList" ,map);
	}
	
	public List<RecipeReviewDTO> recipeReviewList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE + "recipeReviewList" , map);
	}
	
	public List<RecipeDTO> recipeList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE + "recipeList", map);
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
	
	public Long getTotalCount2 (Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount2", map);
	}

	public Long getTotalCount3 (Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount3", map);
	}
	

	public Long getTotalCount4 (Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount4", map);
	}
	

	public Long cartCount (MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"cartCount",memberDTO);
	}
	

}
