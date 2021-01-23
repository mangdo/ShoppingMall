package com.phonemall.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductReviewVO;
import com.phonemall.domain.ReviewPageDTO;
import com.phonemall.service.ProductReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reviews/")
@RestController
@Log4j
@AllArgsConstructor
public class ProductReviewController {

	private ProductReviewService service;
	
	@PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ProductReviewVO vo){
		log.info("ReviewVO : " + vo);

		return service.register(vo)==1?
				new ResponseEntity<>("success",HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@GetMapping(value="/pages/{product_id}/{page}",
			produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReviewPageDTO> getList(
			@PathVariable("page")int page, @PathVariable("product_id") Long product_id){
		
		log.info("get Review List");
		Criteria cri = new Criteria(page,5);
		
		return new ResponseEntity<>(service.getListPage(cri, product_id), HttpStatus.OK);
	}
	
	@GetMapping(value="/{review_id}",
			produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ProductReviewVO> get(@PathVariable("review_id") Long review_id){
		log.info("get : " + review_id);
		
		return new ResponseEntity<>(service.get(review_id), HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{review_id}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("review_id")Long review_id){
		log.info("delete : "+review_id);
		
		return service.remove(review_id)==1?
				new ResponseEntity<>("success", HttpStatus.OK):
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value="/replies/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> createReply(@RequestBody ProductReviewVO vo){
		log.info("ReplyVO : " + vo);

		return service.registerReply(vo)==1?
				new ResponseEntity<>("success",HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="/replies/{reply_id}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> removeReply(@PathVariable("reply_id")Long reply_id){
		log.info("delete : "+reply_id);
		
		return service.removeReply(reply_id)==1?
				new ResponseEntity<>("success", HttpStatus.OK):
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
