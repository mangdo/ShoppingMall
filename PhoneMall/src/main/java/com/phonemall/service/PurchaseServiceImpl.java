package com.phonemall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.phonemall.domain.CartListVO;
import com.phonemall.domain.CartVO;
import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductVO;
import com.phonemall.domain.PurchaseVO;
import com.phonemall.mapper.PurchaseMapper;
import com.phonemall.mapper.UserMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	private PurchaseMapper mapper;
	@Override
	public void insertBuyData(PurchaseVO purchaseVO) {
		mapper.insert(purchaseVO);
	}
	
	public List<PurchaseVO> getListNum(String email){
		return mapper.read(email);
	}
	
	public List<PurchaseVO> getList(Criteria cri,String email) {
		return mapper.getListWithPaging(cri,email);
	}
	
	@Override
	public void insertCompleteOrder(Long purchase_id, String email) {
		mapper.orderInfo_Details(purchase_id, email);
	}
	@Override
	public List<CartListVO> ListOrder(Long purchase_id){
		return mapper.selectbyId(purchase_id);
	}
	@Override
	public List<PurchaseVO> getListById(Long purchase_id){
		return mapper.selectbyPurchaseId(purchase_id);
	}
	
	@Override
	public void deleteById(Long purchase_id) {
		mapper.deletePurchaseById(purchase_id);
		mapper.deleteOrderById(purchase_id);
	}
}
