package com.phonemall.controller;



import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.PageDTO;
import com.phonemall.domain.PurchaseUserVO;
import com.phonemall.service.PurchaseService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class PurchaseInfoController {

	
	@Setter(onMethod_=@Autowired)
	private PurchaseService purchaseservice;

	@RequestMapping(value="/myPurchase" , method = {RequestMethod.GET, RequestMethod.POST})
	public String toPurchaseInfo(Criteria cri,Principal principal,Model model) {
		String email = principal.getName();
		model.addAttribute("list",purchaseservice.getList(cri,email));
		int ListNum = purchaseservice.getListNum(email, cri.getKeyword());
		log.info("criteria : "+cri);
		model.addAttribute("pageMaker", new PageDTO(cri, ListNum));
		return "/mypage/myPurchase";
	}
	
	@RequestMapping("/myInquiry/{purchase_id}")
	public String MyInquiry(@PathVariable("purchase_id") Long purchase_id,Principal principal,Model model) {
		
		
		model.addAttribute("orderList",purchaseservice.ListOrder(purchase_id));
		model.addAttribute("purchaseInfo",purchaseservice.getListById(purchase_id));

		return "/mypage/myInquiry";
	}
}
