package com.phonemall.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.PageDTO;
import com.phonemall.domain.ProductReviewPageDTO;
import com.phonemall.service.NoticeService;
import com.phonemall.service.ProductReviewService;
import com.phonemall.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class PhoneMallController {
	
	@Setter(onMethod_=@Autowired)
	private ProductReviewService service;
	
	@Setter(onMethod_=@Autowired)
	private ProductService productService;
	
	@Setter(onMethod_=@Autowired)
	private NoticeService noticeService;
	
	@RequestMapping("/")
	public String toMainPage(Model model){
		
		model.addAttribute("recentList", productService.getRecentList(5));
		model.addAttribute("saleList", productService.getSaleList());
		model.addAttribute("popularList", productService.getPopularList());
		model.addAttribute("bestList", productService.getBestList());
		model.addAttribute("recentNotice", noticeService.getRecentList());

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
