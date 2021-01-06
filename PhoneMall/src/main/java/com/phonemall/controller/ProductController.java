package com.phonemall.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phonemall.domain.ProductVO;
import com.phonemall.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;
//import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	
	@Setter(onMethod_=@Autowired)
	private ProductService service;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		log.info("list...");
		model.addAttribute("list",service.getList());
		return "/product/list";
	}
	
	@PostMapping("/register")
	public String register(ProductVO product, RedirectAttributes rttr) {
		
		log.info("regiter : "+ product);
		service.register(product);
		rttr.addFlashAttribute("result", product.getProduct_id());
		//새롭게 등록된 게시물의 번호를 같이 전달하기위해 RedirectAttributes사용
		
		return "redirect:/product/list";
		//등록작업이 끝난후 다시 목록화면으로 이동
	}
	
	@GetMapping({"/get"})
	public String get(@RequestParam("product_id") Long product_id, Model model) {
		
		log.info("/get");
		model.addAttribute("product",service.get(product_id));
		return "/product/get";
		
	}
	
	@GetMapping({"/modify"})
	public String modify(@RequestParam("product_id") Long product_id, Model model) {
		
		log.info("/modify");
		model.addAttribute("product",service.get(product_id));
		return "/product/modify";
		
	}
	
	@PostMapping("/modify")
	public String modify(ProductVO product, RedirectAttributes rttr) {
		log.info("modify : "+product);
		
		if(service.modify(product)) {
			rttr.addFlashAttribute("result","succes");
		}

		return "redirect:/product/list";

	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("product_id") Long product_id, RedirectAttributes rttr) {
		log.info("remove.."+product_id);
		if(service.remove(product_id)) {
			rttr.addFlashAttribute("result","success");
		}

		return "redirect:/product/list";
	}
	
	@GetMapping("/register")
	public String register() {
		return "/product/register";
	}
}
