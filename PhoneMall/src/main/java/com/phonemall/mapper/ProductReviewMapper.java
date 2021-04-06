package com.phonemall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductReplyVO;
import com.phonemall.domain.ProductReviewVO;

public interface ProductReviewMapper {

	public int insert(ProductReviewVO vo);
	
	public ProductReviewVO read(Long review_id);
	
	public int delete(Long review_id);
	
	public int update(ProductReviewVO vo);
	
	public List<ProductReviewVO> getListWithPaging(
			@Param("cri") Criteria cri, @Param("product_id") Long product_id);
	
	public int getCountByProductId(Long product_id);
	
	// Reply of review
	public int insertReply(ProductReplyVO vo);
	
	public ProductReplyVO readReply(Long reply_id);
	
	public int deleteReply(Long reply_id);
	
	public int updateReply(ProductReplyVO vo);
	
	
	// my review list
	public List<ProductReviewVO> getMyReviewListWithPaging(
			@Param("cri") Criteria cri, @Param("review_reviewer") String review_reviewer);
	
	public int getCountByReviewer(String review_reviewer);
	
	
}
