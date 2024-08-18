package com.chef.app.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.chef.app.member.MemberDAO.";
	
	
	public int duplication(MemberDTO memberDTO)throws Exception {
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
	
	
}
