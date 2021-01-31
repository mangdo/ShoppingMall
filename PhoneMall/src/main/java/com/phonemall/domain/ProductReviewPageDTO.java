package com.phonemall.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ProductReviewPageDTO {

	private int reviewCount;
	private List<ProductReviewVO> reviewList;
	private List<ProductVO> productList;
	
	public ProductReviewPageDTO(int reviewCount, List<ProductReviewVO> reviewList){
		this.reviewCount = reviewCount;
		this.reviewList = reviewList;
	}
}
