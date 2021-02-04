package com.phonemall.service;

import java.util.List;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductColorListVO;
import com.phonemall.domain.ProductImageVO;
import com.phonemall.domain.ProductVO;

public interface ProductService {
	public void register(ProductVO product);
	
	public ProductVO get(Long product_id);
	
	public boolean modify(ProductVO product);
	
	public boolean remove(Long product_id);
	
	public List<ProductVO> getList(Criteria cri);
	
	public List<ProductColorListVO> getColorList(Long product_id);
	
	public int getTotal(Criteria cri);
	
	public List<ProductImageVO> getImageList(Long product_id);
	
	public List<ProductVO> getRecentList(int amount);
	
	public List<ProductVO> getSaleList();
	
	public List<ProductVO> getPopularList();

	public List<ProductVO> getBestList();

	public ProductVO getQuickView(Long product_id);
	
	public List<ProductVO> getRelatedList(Long product_id, String product_brand);
}
