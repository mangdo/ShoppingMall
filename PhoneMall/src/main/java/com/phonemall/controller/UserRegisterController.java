package com.phonemall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phonemall.domain.AuthVO;
import com.phonemall.domain.UserVO;
import com.phonemall.service.UserService;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/mypage/*")
public class UserRegisterController {
	
	@Setter(onMethod_=@Autowired)
	private UserService userService;
	
	//member register page
	@GetMapping("/newCustomers")
	public String newCustomerPage() {		
		return "/mypage/newCustomers";
	}
	
	
	@PostMapping
	public String register(UserVO userVO, AuthVO authVO, RedirectAttributes redirectAttributes){
		
		String hashedPW = BCrypt.hashpw(userVO.getUserpw(), BCrypt.gensalt());
		userVO.setUserpw(hashedPW);
		log.info("member register..."+userVO);
		userService.register(userVO);
		userService.registerAuth(authVO);
		redirectAttributes.addFlashAttribute("msg","REGISTERED");
		
		return "redirect:/";
		
	}
	
	//member update page
	@RequestMapping("/infoModify")
	public String toInfoModify() {
		return "/mypage/infoModify";
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute UserVO vo, HttpSession session) {
		userService.updateMember(vo);
		log.info(vo);
		session.invalidate();
		return "redirect:/";
		
	}
	
	//member info page
	@GetMapping("/myInfo")
	public String toMyInfo() {
		return "/mypage/myInfo";
	}

	
}
