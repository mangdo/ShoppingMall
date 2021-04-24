package com.phonemall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.phonemall.domain.KakaoPayPurchaseVO;
import com.phonemall.service.KakaoPayService;
import com.phonemall.service.PurchaseService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/kakaoPay")
@RequiredArgsConstructor
@Controller
public class KakaoPayController {

    private final KakaoPayService kaKaoPayService;    
	private final PurchaseService purchaseservice;

    @PostMapping("/ready")
    public String kakaoPay(KakaoPayPurchaseVO kakaoPayPurchaseVO) {
        log.info("kakaoPay post..");

        return "redirect:" + kaKaoPayService.kakaoPayReady(kakaoPayPurchaseVO);
    }

    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get...");
        log.info("kakaoPaySuccess pg_token : " + pg_token);

    }
    
    @GetMapping("/kakaoPayCancel")
	public String kakaoPayCancel(Long purchaseId) {
		log.info("kakaopay is cancel");
		purchaseservice.deleteById(purchaseId);
		return "/error/payCancel";
	}

	@GetMapping("/kakaoPayFail")
	public String kakaoPayFail(Long purchaseId) {
		log.info("kakaopay is fail");
		purchaseservice.deleteById(purchaseId);
		return "/error/payFail";
	}
}