package com.phonemall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.CartVO;

public interface CartService {
	public void insertCart(CartVO cartVO);
	public void deleteCart(CartVO cartVO);
	//readCart = check if product is already in Cart or Not
	public int readCart(String user_email, Long product_id, String product_color);
	public List<CartVO> ListCart(@Param("user_email") String user_email);
	public void updateQty(String user_email, Long product_id, int product_qty);
	public int sumTotalMoney(@Param("user_email") String user_email);
	public void deleteAllCart(String user_email);
}
