package com.chef.app.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public void kakao() throws Exception {
		System.out.println("== Kakao Service ==");
		memberDAO.kakao();
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		System.out.println("== login Service ==");
		
//		MemberDTO result = memberDAO.login(memberDTO);
		
		MemberDTO orignalPwd = memberDAO.login(memberDTO);
				
		if(BCrypt.checkpw(memberDTO.getMember_pwd(), orignalPwd.getMember_pwd())) {
			System.out.println("비밀번호 일치");
			return orignalPwd;
		} else {
			System.out.println("비밀번호 불일치");
			return null;
		}
	}
	
	public int join(MemberDTO memberDTO)throws Exception {
		System.out.println("== Join Service");
		System.out.println(memberDTO.getMember_pwd());

		String hashpw = BCrypt.hashpw(memberDTO.getMember_pwd(), BCrypt.gensalt());
		memberDTO.setMember_pwd(hashpw);
		
		return memberDAO.join(memberDTO);
	}
	
	
}
