package com.chef.app.interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.chef.app.member.MemberDTO;

public class SampleInterceptor extends HandlerInterceptorAdapter  {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");

        // 세션에 로그인 정보가 없는 경우 로그인 페이지로 리다이렉트
        if (memberDTO == null) {
            response.sendRedirect("/member/login");
            return false;
        }

        // member_lev가 1 이상이어야 접근 가능
        if (memberDTO.getMember_lev() < 1) {
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

