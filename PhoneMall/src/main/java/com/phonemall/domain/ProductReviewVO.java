package com.phonemall.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductReviewVO {

	private Long review_id;
	private Long product_id;

	private String review_content;
	private String review_reviewer;
	private Date review_regDate;
	private Date review_updateDate;
	private int review_rating;
	
	private Long order_id;
	
	private List<ProductReplyVO> replyList;
	private List<ProductImageVO> product_imageList;
	
	private String product_title;
	private String product_brand;
	private String product_carrier;
	private String product_type;
}
