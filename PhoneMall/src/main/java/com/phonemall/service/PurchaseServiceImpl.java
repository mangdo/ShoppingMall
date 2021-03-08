package com.phonemall.service;

import org.springframework.stereotype.Service;

import com.phonemall.domain.PurchaseVO;
import com.phonemall.mapper.PurchaseMapper;
import com.phonemall.mapper.UserMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	private PurchaseMapper mapper;
	
	public void insertBuyData(PurchaseVO purchaseVO) {
		mapper.insert(purchaseVO);
	}
	
	public PurchaseVO getList(String email) {
		return mapper.read(email);
	}
	
	public void insertCompleteOrder(Long purchase_id) {
		mapper.orderInfo_Details(purchase_id);
	}
}
