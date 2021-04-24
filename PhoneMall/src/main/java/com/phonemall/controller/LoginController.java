package com.phonemall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/mypage/*")
public class LoginController {
		
	//Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	//UserVO userVO = (UserVO)principal;	
	
	@RequestMapping("/customlogin")
	public String loginPage(String logout, Model model) {
		log.info("login page");
		log.info("logout : " + logout );

		if(logout != null) { 
			model.addAttribute("logout","logout"); 
		}
		return "/mypage/customlogin";
	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("logout...");
		session.invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping("/accessError")	
	public String accessDenied(Authentication auth, Model model) {
		log.info("access Denied: " + auth);
		
		model.addAttribute("msg","Access Denied");
		
		return "/error/accessError";
	}
	
	

}