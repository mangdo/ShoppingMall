package com.phonemall.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.PageDTO;
import com.phonemall.domain.ProductReviewPageDTO;
import com.phonemall.service.ProductReviewService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class PhoneMallController {
	
	@Setter(onMethod_=@Autowired)
	private ProductReviewService service;
	
	@RequestMapping("/")
	public String toMainPage(){
		return "/mallView/mainPage";
	}

	@RequestMapping("/about")
	public String toAboutPage() {
		return "/mallView/about";
	}
	
	@RequestMapping("/contact")
	public String toContackPage() {
		return "/mallView/contact";
	}
	
	@RequestMapping("/myPurchase")
	public String toMyAccount() {
		return "/mypage/myPurchase";
	}
	

	
	@RequestMapping("/viewCart")
	public String toViewCart() {
		return "/mypage/viewCart";
	}
	
	@RequestMapping("/checkOut")
	public String toCheckOut() {
		return "/mypage/checkOut";
	}
	
	@RequestMapping("/myInfo")
	public String toMyInfo() {
		return "/mypage/myInfo";
	}
	
	
	
	@RequestMapping("/myInquiry")
	public String toMyInquiry() {
		return "/mypage/myInquiry";
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/myReviews")
	public String toMyReviews(@RequestParam(required = false) Integer page, Model model, Principal principal) {
		log.info("myreview");
		if(page==null) {
			page=1;
		}
		log.info("get user reviews"+principal.getName());
		Criteria cri = new Criteria(page,3);
		ProductReviewPageDTO result = service.getMyReviewListPage(cri,principal.getName());
		model.addAttribute("reviewList",result.getReviewList());
		model.addAttribute("productList", result.getProductList());
		model.addAttribute("pageMaker", new PageDTO(cri, result.getReviewCount()));
		
		return "/mypage/myReviews";
	}
}
