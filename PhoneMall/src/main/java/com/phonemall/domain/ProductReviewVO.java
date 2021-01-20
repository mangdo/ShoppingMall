package com.phonemall.domain;

import java.util.Date;

import lombok.Data;
@Data
public class ProductReviewVO {

	private Long review_id;
	private Long product_id;

	private String review_content;
	private String review_reviewer;
	private Date review_regDate;
	private int review_rating;
}
