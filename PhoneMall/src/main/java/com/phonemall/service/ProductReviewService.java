package com.phonemall.service;


import java.util.List;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductReplyVO;
import com.phonemall.domain.ProductReviewVO;

public interface ProductReviewService {

	public int register(ProductReviewVO vo);
	
	public ProductReviewVO get(Long review_id);
	
	public int modify(ProductReviewVO vo);
	
	public int remove(Long review_id);
	
	public List<ProductReviewVO> getListPage(Criteria cri, Long product_id);
	
	public int getTotal(Long product_id);
	
	// reply of reviews
	public int registerReply(ProductReplyVO vo);
	
	public ProductReplyVO getReply(Long reply_id);
	
	public int modifyReply(ProductReplyVO vo);
	
	public int removeReply(Long review_id);
	
	public List<ProductReviewVO> getMyReviewListPage(Criteria cri, String review_reviewer);

	public int getMyTotal(String review_reviewer);
}
