package com.phonemall.service;


import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductReviewVO;
import com.phonemall.domain.ReviewPageDTO;

public interface ProductReviewService {

	public int register(ProductReviewVO vo);
	
	public ProductReviewVO get(Long review_id);
	
	public int remove(Long review_id);
	
	public ReviewPageDTO getListPage(Criteria cri, Long product_id);
	
	public int registerReply(ProductReviewVO vo);
	
	public int removeReply(Long review_id);
}
