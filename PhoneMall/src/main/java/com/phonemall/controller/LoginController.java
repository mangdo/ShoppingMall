package com.phonemall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/mypage/*")
public class LoginController {
	
	@GetMapping("/customlogin")
	public String loginPage(String error, String logout, Model model) {
		log.info("로그인 페이지로 이동");
		log.info("err :" + error );
		log.info("logout : " + logout );
		if(error != null) { 
			model.addAttribute("error","login fail! Check your account"); 
		} 
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
		
		return "/mypage/accessError";
	}

}