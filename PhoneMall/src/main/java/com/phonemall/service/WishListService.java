package com.phonemall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.WishListVO;

public interface WishListService {
	
	public void insertWishList(WishListVO wishlistVO);
	public void deleteWishList(WishListVO wishlistVO);
	//readWishList = check if product is already in WishList or Not
	public int readWishList(String user_email, Long product_id);
	public List<WishListVO> ListWishList(@Param("user_email") String user_email);
}
