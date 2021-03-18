package com.phonemall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.CartListVO;
import com.phonemall.domain.CartVO;
import com.phonemall.domain.Criteria;
import com.phonemall.domain.PurchaseVO;

public interface PurchaseService {
	public List<PurchaseVO> getListNum(String email);
	public void insertBuyData(PurchaseVO purchaseVO);
	public void insertCompleteOrder(Long purchase_id);
	public List<CartListVO> ListOrder(Long purchase_id);
	public List<PurchaseVO> getListById(Long purchase_id);
	public List<PurchaseVO> getList(Criteria cri, String email);
}
