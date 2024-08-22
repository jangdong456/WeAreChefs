package com.chef.app.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.chef.app.file.FileManager;
import com.chef.app.recipe.RecipeDTO;
import com.chef.app.recipe.RecipeReplyDTO;
import com.chef.app.recipe.RecipeReviewDTO;

import com.chef.app.food.StoreOrderDTO;
import com.chef.app.util.Pager;

@Service
public class MemberService {
	
	private static final int Pager = 0;
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private FileManager fileManager;
	
	public int prfileSnsDelete(MemberDTO memberDTO) throws Exception {
		return memberDAO.prfileSnsDelete(memberDTO);
	}
	
	public int prfileSnsAdd(MemberDTO memberDTO) throws Exception {
		return memberDAO.prfileSnsAdd(memberDTO);
	}
	
	public int profileDelete(MemberDTO memberDTO) throws Exception {
		return memberDAO.profileDelete(memberDTO);
	}
	
	public int profileChange(MemberDTO memberDTO, MultipartFile multipartFile, HttpSession session) throws Exception {
		
		ServletContext servletContext = session.getServletContext();
		String path = servletContext.getRealPath("resources/upload/member");
		
		String fileName = fileManager.fileSave(path, multipartFile);
		
		MemberDTO memberdto = new MemberDTO();
		memberdto.setFile_name(fileName);
		memberdto.setMember_id(memberDTO.getMember_id());
		
		int result = memberDAO.profileChange(memberdto);
		return result;
	}
	
	public int duplication(MemberDTO memberDTO)throws Exception {
		int check = memberDAO.duplication(memberDTO);
		System.out.println("서비스 테스트");
		System.out.println("반환 값 :"+ check);
		
		return check;
	}
				
	public List<RecipeReplyDTO> recipeReplyList(MemberDTO test) throws Exception {
		return memberDAO.recipeReplyList(test);
	}
	
	public List<RecipeReviewDTO> recipeReviewList(MemberDTO test) throws Exception {
		return memberDAO.recipeReviewList(test);
	}
	
	public List<RecipeDTO> recipeList(MemberDTO test) throws Exception {
		return memberDAO.recipeList(test);
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
			if(result <= 0) {
				// 가입된 회원이 없어서 kakaologin(생성하는 메서드 실행)
				result = memberDAO.kakaologin(memberDTO);
			} else {
				System.out.println("가입된 상태면(1이여야함) :" +result);
			}
		}
		return result;
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		System.out.println("== login Service ==");
		
		MemberDTO result = memberDAO.login(memberDTO);

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
	
	public Map<String, Object> buyList(Map<String, Object> comeMap) throws Exception {
		
		List<StoreOrderDTO> ar = memberDAO.buyList(comeMap);
		
		Pager pagination =(Pager)comeMap.get("pager");
	  
		Long pageNumber = pagination.getPage();
		int page_size = 5;
		
        int totalOrders = ar.size();
        int startIndex = (int)(pageNumber - 1) * page_size;
        int endIndex = Math.min(startIndex + page_size, totalOrders);

        List<StoreOrderDTO> paginatedOrders = ar.subList(startIndex, endIndex);

        Pager pager = new Pager();
        pager.setPage((long) pageNumber);
        pager.makeNum((long) totalOrders, (long) page_size, 1L);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("list", paginatedOrders);
        map.put("pager", pager);
		
		return map;
	}
	
	public int cancleRequest(StoreOrderDTO storeOrderDTO) throws Exception {
		return memberDAO.cancleRequest(storeOrderDTO);
	}
	
}
