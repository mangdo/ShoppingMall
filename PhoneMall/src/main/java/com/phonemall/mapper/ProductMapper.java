package com.phonemall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductVO;

public interface ProductMapper {
	
	//@Select("select * from product where product_id>0")
	public List<ProductVO> getList();
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	public void insert(ProductVO product);
	public void insertSelectKey(ProductVO product);
	public ProductVO read(Long product_id);
	public int delete(Long product_id);
	public int update(ProductVO product);
	
	public void updateReview(@Param("product_id") Long product_id, @Param("amount") int amount);
}
