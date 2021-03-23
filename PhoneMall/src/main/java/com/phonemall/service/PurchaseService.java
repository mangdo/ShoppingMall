package com.phonemall.service;

import java.util.List;

import com.phonemall.domain.CartListVO;
import com.phonemall.domain.Criteria;
import com.phonemall.domain.PurchaseUserVO;
import com.phonemall.domain.PurchaseVO;

public interface PurchaseService {
	public int getListNum(String email, String keyword);
	public void insertBuyData(PurchaseVO purchaseVO);
	public void insertCompleteOrder(Long purchase_id, String email);
	public List<CartListVO> ListOrder(Long purchase_id);
	public List<PurchaseVO> getListById(Long purchase_id);
	public List<PurchaseUserVO> getList(Criteria cri, String email);
	public void deleteById(Long purchase_id);
}
