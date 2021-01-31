package com.phonemall.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.phonemall.domain.AuthVO;
import com.phonemall.domain.UserVO;
import com.phonemall.domain.WishListVO;
import com.phonemall.service.UserService;
import com.phonemall.service.WishListService;

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
	
	@Setter(onMethod_=@Autowired)
	private WishListService wishlistservice;
	
	@GetMapping("/wishList")
	public String list(Model model,Principal principal) {
		log.info("goto wishlist");
		String email = principal.getName();
		List<WishListVO> list=wishlistservice.ListWishList(email);
		model.addAttribute("list",list);
		log.info(list);
		return "/mypage/wishList";
	}
	
	@PostMapping("/deleteWishList")
	@ResponseBody
	public ModelAndView deleteWishList(WishListVO wishlistVO,Principal principal) {
		String email = principal.getName();

		wishlistVO.setUser_email(email);
		wishlistservice.deleteWishList(wishlistVO);		
		
		ModelAndView mav = new ModelAndView();
		mav.setView(new RedirectView("/mypage/wishList"));
		return mav;	
	}
	
	@GetMapping("/GetWishList")
	@ResponseBody
	public ModelAndView CountList(WishListVO wishlistVO,Principal principal,Model model) {
		
		String email = principal.getName();
		List<WishListVO> list=wishlistservice.ListWishList(email);
		log.info(list.size());
		model.addAttribute("list_num",list.size());
		
		ModelAndView mav = new ModelAndView();
		mav.setView(new RedirectView("/mypage/wishList"));
		return mav;
	
	}
	
	
	

	
}
