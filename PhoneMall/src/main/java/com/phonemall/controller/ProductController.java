package com.phonemall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phonemall.domain.ProductVO;
import com.phonemall.domain.Criteria;
import com.phonemall.domain.PageDTO;
import com.phonemall.domain.ProductColorListVO;

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
	public String list(Criteria cri, Model model) {
		
		log.info("/list");
		model.addAttribute("list",service.getList(cri));
		int total = service.getTotal(cri);
		log.info(total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		return "/product/list";
	}
	
	@PostMapping("/register")
	public String register(ProductVO product, RedirectAttributes rttr) {
		
		log.info("regiter : "+ product);
		service.register(product);
		rttr.addFlashAttribute("result", product.getProduct_id());
		//새롭게 등록된 게시물의 번호를 같이 전달하기위해 RedirectAttributes사용
		
		if(product.getProduct_colorList() != null) {
			product.getProduct_colorList().forEach(colorList->log.info(colorList));
		}
		
		return "redirect:/product/list";
		//등록작업이 끝난후 다시 목록화면으로 이동
	}
	
	@GetMapping({"/get"})
	public String get(@RequestParam("product_id") Long product_id, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get");
		model.addAttribute("product",service.get(product_id));
		return "/product/get";
		
	}
	
	@GetMapping({"/modify"})
	public String modify(@RequestParam("product_id") Long product_id, @ModelAttribute("cri") Criteria cri,Model model) {
		
		log.info("/modify");
		model.addAttribute("product",service.get(product_id));
		return "/product/modify";
		
	}
	
	@PostMapping("/modify")
	public String modify(ProductVO product, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : "+product);
		
		if(service.modify(product)) {
			rttr.addFlashAttribute("result","succes");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/product/list";

	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("product_id") Long product_id,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove product "+product_id);
		if(service.remove(product_id)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/product/list";
	}
	
	@GetMapping("/register")
	public String register() {
		return "/product/register";
	}
	
	@GetMapping(value="/getColorList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductColorListVO>> getAttachList(Long product_id){
		
		log.info("getColorList " + product_id);
		return new ResponseEntity<>(service.getColorList(product_id),HttpStatus.OK);
		}
	
}
