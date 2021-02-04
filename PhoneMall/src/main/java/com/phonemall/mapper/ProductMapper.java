package com.phonemall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> getList();
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	public void insert(ProductVO product);
	public void insertSelectKey(ProductVO product);
	public ProductVO read(Long product_id);
	public int delete(Long product_id);
	public int update(ProductVO product);
	
	public void updateReview(@Param("product_id") Long product_id, @Param("amount") int amount);

	public List<ProductVO> myReviewProductList(@Param("cri") Criteria cri, @Param("reviewer") String reviewer);

	public List<ProductVO> getRecentList(int amount);
	
	public List<ProductVO> getSaleList();
	
	public List<ProductVO> getPopularList();
	
	public List<ProductVO> getBestList();
	
	public ProductVO getQuickView(Long product_id);
	
	public List<ProductVO> getRelatedList(@Param("product_id") Long product_id, @Param("product_brand") String product_brand);
}
