package com.chef.app.interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.chef.app.member.MemberDTO;

public class sample extends HandlerInterceptorAdapter {
	
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");

	       
	        // 
	        if (memberDTO.getMember_lev() < 1) {
	            request.setAttribute("msg", "");
	            request.setAttribute("url", "/");
	            RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/commons/message.jsp");
	            view.forward(request, response);
	            return false;
	        }

	        // 권한이 있는 경우 요청을 계속 진행
	        return true;
	    }
	}