package com.phonemall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductReviewVO;

public interface ProductReviewMapper {

	public int insert(ProductReviewVO vo);
	
	public ProductReviewVO read(Long review_id);
	
	public int delete(Long review_id);
	
	public List<ProductReviewVO> getListWithPaging(
			@Param("cri") Criteria cri, @Param("product_id") Long product_id);
	
	public int getCountByProductId(Long product_id);
}
