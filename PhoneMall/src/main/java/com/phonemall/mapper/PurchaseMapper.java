package com.phonemall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.CartListVO;
import com.phonemall.domain.Criteria;
import com.phonemall.domain.PurchaseUserVO;
import com.phonemall.domain.PurchaseVO;

public interface PurchaseMapper {
	
	public void insert(PurchaseVO purchaseVO);
	public List<PurchaseVO> read(String email);
	public void orderInfo_Details(@Param("purchase_id") Long purchase_id, @Param("email") String email);
	public List<CartListVO> selectbyId(Long purchase_id);
	public List<PurchaseVO> selectbyPurchaseId(Long purchase_id);
	public List<PurchaseUserVO> getListWithPaging(@Param("cri") Criteria cri,@Param("email") String email);
	public void deletePurchaseById(Long purchase_id);
	public void deleteOrderById(Long purchase_id);
	public int getListNum(@Param("email") String email, @Param("keyword") String keyword);
	public void updateStatus(Long order_id);
}
