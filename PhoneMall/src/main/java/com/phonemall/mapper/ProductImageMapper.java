package com.phonemall.mapper;

import java.util.List;

import com.phonemall.domain.ProductImageVO;

public interface ProductImageMapper {

	public void insert(ProductImageVO vo);
	public void delete(String uuid);
	public List<ProductImageVO> findById(Long product_id);
	public void deleteAll(Long product_id);
}
