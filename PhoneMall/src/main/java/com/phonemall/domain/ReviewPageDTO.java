package com.phonemall.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReviewPageDTO {

	private int reviewCount;
	private List<ProductReviewVO> reviewList;
}
