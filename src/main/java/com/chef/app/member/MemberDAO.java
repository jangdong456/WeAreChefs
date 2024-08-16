package com.chef.app.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.chef.app.member.MemberDAO.";
	
	public void kakao() throws Exception {
		System.out.println("== Kakao DAO ==");
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
