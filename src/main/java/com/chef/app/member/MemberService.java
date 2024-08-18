package com.chef.app.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public int duplication(MemberDTO memberDTO)throws Exception {
		int check = memberDAO.duplication(memberDTO);
		System.out.println("서비스 테스트");
		System.out.println("반환 값 :"+ check);
		
		return check;

	}
	
	public int introducesDelete(MemberDTO memberDTO) throws Exception {
		return memberDAO.introducesDelete(memberDTO);
	}
	
	public int mypageUpdate(MemberDTO memberDTO) throws Exception {
		return memberDAO.mypageUpdate(memberDTO);
	}
	
	public MemberDTO mypage(MemberDTO memberDTO) throws Exception {
		return memberDAO.mypage(memberDTO);
	}
	
	public MemberDTO kakaologin2(MemberDTO memberDTO) throws Exception {
		System.out.println("== Kakao Service ==");
		return memberDAO.kakaologin2(memberDTO);
	}
	
	public int kakaologin(MemberDTO memberDTO) throws Exception {
		System.out.println("== Kakao Service ==");
		int result = 0;
		if(memberDTO.getMember_id() != null) {
			result = memberDAO.kakaoCheck(memberDTO);
			
			// result이 1이면 회원가입된 상태 | 0이면 가입안된 상태
			if(result < 0) {
				// 가입된 회원이 없어서 kakaologin(생성하는 메서드 실행)
				result = memberDAO.kakaologin(memberDTO);
			} else {
				System.out.println("가입된 상태(1이여야함) :" +result);
			}
		}
		return result;
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
