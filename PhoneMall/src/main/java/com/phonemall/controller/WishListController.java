package com.phonemall.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.PageDTO;
import com.phonemall.domain.WishListVO;
import com.phonemall.service.ProductService;
import com.phonemall.service.UserService;
import com.phonemall.service.WishListService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
public class WishListController {
	
	@Setter(onMethod_=@Autowired)
	private WishListService wishlistservice;
	
	@PostMapping("/insertWishList")
	public String insertWishList(WishListVO wishlistVO,Principal principal,RedirectAttributes rttr) {
		String email = principal.getName();

		int count = wishlistservice.readWishList(email, wishlistVO.getProduct_id());
		if(count == 0) {
			wishlistVO.setUser_email(email);
			wishlistservice.insertWishList(wishlistVO);
			rttr.addFlashAttribute("msg","SUCCESS");	
		}else {
			rttr.addFlashAttribute("msg","FAIL");
		}
		
		return "redirect:/product/list";	
	}
	
	@PostMapping("/insertWishListJson")
	@ResponseBody
	public String insertWishListJson(@RequestBody WishListVO wishlistVO,Principal principal) {
		String email = principal.getName();

		int count = wishlistservice.readWishList(email, wishlistVO.getProduct_id());
		if(count == 0) {
			wishlistVO.setUser_email(email);
			wishlistservice.insertWishList(wishlistVO);
			return "insert in wishList";
		}
		
		return "aleady in wishList";
	}
}




	
	

