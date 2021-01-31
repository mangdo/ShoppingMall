package com.phonemall.service;


import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductReviewVO;
import com.phonemall.domain.ProductReviewPageDTO;

public interface ProductReviewService {

	public int register(ProductReviewVO vo);
	
	public ProductReviewVO get(Long review_id);
	
	public int modify(ProductReviewVO vo);
	
	public int remove(Long review_id);
	
	public ProductReviewPageDTO getListPage(Criteria cri, Long product_id);
	
	// reply of reviews
	public int registerReply(ProductReviewVO vo);
	
	public ProductReviewVO getReply(Long reply_id);
	
	public int modifyReply(ProductReviewVO vo);
	
	public int removeReply(Long review_id);
	
	public ProductReviewPageDTO getMyReviewListPage(Criteria cri, String review_reviewer);
}
