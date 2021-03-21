package com.phonemall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.CartVO;

public interface CartMapper {
	public void insert(CartVO cartVO);
	public void delete(CartVO cartVO);
	public int read(@Param("user_email") String user_email,@Param("product_id") Long product_id,@Param("product_color") String product_color);
	public List<CartVO> ListCart(@Param("user_email") String user_email);
	public void update(@Param("user_email") String user_email,@Param("product_id") Long product_id, @Param("product_qty") int product_qty);
	public int sumMoney(@Param("user_email") String user_email);
	public void deleteAll(String user_email);
}
