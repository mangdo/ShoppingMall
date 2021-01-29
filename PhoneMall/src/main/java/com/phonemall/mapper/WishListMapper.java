package com.phonemall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductVO;
import com.phonemall.domain.WishListVO;

public interface WishListMapper {
	
	public void insert(WishListVO wishlistVO);
	public void delete(WishListVO wishlistVO);
	public int read(@Param("user_email") String user_email,@Param("product_id") Long product_id);
	public List<WishListVO> ListWishList(@Param("user_email") String user_email);
	
}
