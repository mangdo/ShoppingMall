package com.phonemall.mapper;

import com.phonemall.domain.PurchaseVO;

public interface PurchaseMapper {
	
	public void insert(PurchaseVO purchaseVO);
	public PurchaseVO read(String email);
	public void orderInfo_Details(Long purchase_id);
	public void selectbyId(Long purchase_id);
}
