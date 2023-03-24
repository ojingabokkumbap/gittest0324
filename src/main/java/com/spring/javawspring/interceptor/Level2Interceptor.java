package com.spring.javawspring.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Level2Interceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null? 99 : (int) session.getAttribute("sLevel");
		
		if(level > 2) {
			RequestDispatcher dispatcher;
			if(level == 99) {	// 비회원인 경우
				dispatcher = request.getRequestDispatcher("/msg/memberNo");
			}
			else {	// '준/정'회원(level : 3과 4)인경우
				dispatcher = request.getRequestDispatcher("/msg/levelCheckNo");
			}
			dispatcher.forward(request, response);
			return false;
		}
		
		return true;
	}
}
