package com.phonemall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.phonemall.domain.CartVO;
import com.phonemall.mapper.CartMapper;



import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service

public class CartServiceImpl implements CartService {

	private CartMapper mapper;
	
	@Override
	public void insertCart(CartVO cartVO) {
		mapper.insert(cartVO);
	}
	
	public void deleteCart(CartVO cartVO) {
		mapper.delete(cartVO);
	}
	
	public int readCart(String user_email, Long product_id,String product_color) {
		return mapper.read(user_email,product_id,product_color);
	}
	
	public List<CartVO> ListCart(String user_email){
		return mapper.ListCart(user_email);
	}
	
	public void updateQty(String user_email, Long product_id, int product_qty) {
		mapper.update(user_email, product_id, product_qty);
	}
	
	public int sumTotalMoney(String user_email) {
		return mapper.sumMoney(user_email);
	}
	
	public void deleteAllCart(String user_email) {
		mapper.deleteAll(user_email);
	}
}