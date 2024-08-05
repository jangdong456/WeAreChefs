package com.chef.app.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.chef.app.member.MemberDAO.";
	
	public void kakao() {
		System.out.println("== Kakao DAO ==");
	}
	
	public void join() {
		System.out.println("== Join DAO");
	}
	
}
