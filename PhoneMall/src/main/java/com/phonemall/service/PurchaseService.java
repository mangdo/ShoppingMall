package com.phonemall.service;

import com.phonemall.domain.PurchaseVO;

public interface PurchaseService {
	
	public void insertBuyData(PurchaseVO purchaseVO);
	public PurchaseVO getList(String email);
	public void insertCompleteOrder(Long purchase_id);
}
