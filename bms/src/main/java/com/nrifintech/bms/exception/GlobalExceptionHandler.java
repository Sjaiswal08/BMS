package com.nrifintech.bms.exception;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
class GlobalDefaultExceptionHandler {
	public static final String DEFAULT_ERROR_VIEW = "error";

	@ExceptionHandler(Exception.class)
	public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
		Logger logger = LoggerFactory.getLogger(GlobalDefaultExceptionHandler.class);
		logger.warn(e.getMessage());
		ModelAndView mv = new ModelAndView();
		mv.addObject("exception", e);
		mv.addObject("url", req.getRequestURL());
		mv.setViewName(DEFAULT_ERROR_VIEW);
		return mv;
	}

}
