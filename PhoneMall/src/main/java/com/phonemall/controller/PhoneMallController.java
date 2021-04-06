package com.phonemall.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import com.phonemall.service.NoticeService;
import com.phonemall.service.ProductService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class PhoneMallController {
	
	private final ProductService productService;
	private final NoticeService noticeService;
	
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
	
	
}
