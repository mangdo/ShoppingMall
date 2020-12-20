package com.phonemall.mapper;

import java.util.List;

import com.phonemall.domain.ProductVO;

public interface ProductMapper {
	
	//@Select("select * from product where product_id>0")
	public List<ProductVO> getList();
	
	public void insert(ProductVO product);
	public void insertSelectKey(ProductVO product);
	public ProductVO read(Long product_id);
	public int delete(Long product_id);
	public int update(ProductVO product);
}
