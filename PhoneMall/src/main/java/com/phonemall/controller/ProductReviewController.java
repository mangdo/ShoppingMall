package com.phonemall.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.PageDTO;
import com.phonemall.service.ProductReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@Controller
public class ProductReviewController {
	
	private final ProductReviewService reviewService;

	@RequestMapping("/mypage/myReviews")
	public String toMyReviews(@RequestParam(required = false, defaultValue="1") Integer page, Model model, Principal principal) {
		log.info("get user reviews"+principal.getName());
		
		Criteria cri = new Criteria(page,3);
		model.addAttribute("reviewList",reviewService.getMyReviewListPage(cri, principal.getName()));
		model.addAttribute("pageMaker", new PageDTO(cri, reviewService.getMyTotal(principal.getName())));
		
		return "/mypage/myReviews";
	}
}
