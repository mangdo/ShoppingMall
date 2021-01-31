package com.phonemall.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.phonemall.domain.WishListVO;
import com.phonemall.mapper.UserMapper;
import com.phonemall.mapper.WishListMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service

public class WishListServiceImpl implements WishListService {

	private WishListMapper mapper;
	
	@Override
	public void insertWishList(WishListVO wishlistVO) {
		mapper.insert(wishlistVO);
	}
	
	public void deleteWishList(WishListVO wishlistVO) {
		mapper.delete(wishlistVO);
	}
	
	public int readWishList(String user_email, Long product_id) {
		return mapper.read(user_email,product_id);
	}
	
	public List<WishListVO> ListWishList(String user_email){
		return mapper.ListWishList(user_email);
	};
}
