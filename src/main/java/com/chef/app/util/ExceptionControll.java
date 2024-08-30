package com.chef.app.util;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionControll {
	
	@ExceptionHandler(Exception.class)
	public ModelAndView getException() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("commons/error");
		return mv;
	}
	
	@ExceptionHandler(RuntimeException.class)
	public String frontError(){
		return "commons/error";
	}
	
}