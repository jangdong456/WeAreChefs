package com.chef.app.interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.chef.app.member.MemberDTO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
	        System.out.println("실행전");

	        // 관리자가 아닌 일반유저 일때 실행되는 조건문 
	        // member_lev가 1 이상이어야 접근 가능
	        if (memberDTO == null || memberDTO.getMember_lev() < 1) {
	        	System.out.println("실행됨");
	            request.setAttribute("msg", "권한이 없습니다.");
	            request.setAttribute("url", "/");
	            RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/message.jsp");
	            view.forward(request, response);
	            return false;
	        }
	        // 권한이 있는 경우 요청을 계속 진행
	        return true;
	        
	    }
	}