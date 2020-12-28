package com.phonemall.mapper;

import java.util.List;

import com.phonemall.domain.ProductColorListVO;

public interface ProductColorListMapper {
	public void insert(ProductColorListVO vo);
	
	public void deleteAll(Long product_id);
	
	public List<ProductColorListVO> findById(Long product_id);
	
}
