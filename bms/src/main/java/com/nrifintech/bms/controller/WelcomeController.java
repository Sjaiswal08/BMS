package com.nrifintech.bms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {

	@GetMapping("/")
	public ModelAndView welcomePage() {
		ModelAndView mv = new ModelAndView("redirect:/user/welcome");
		return mv;
	}
}
