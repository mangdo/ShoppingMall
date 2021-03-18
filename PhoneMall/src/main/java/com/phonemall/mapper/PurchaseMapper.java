package com.phonemall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.CartListVO;
import com.phonemall.domain.CartVO;
import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductVO;
import com.phonemall.domain.PurchaseVO;

public interface PurchaseMapper {
	
	public void insert(PurchaseVO purchaseVO);
	public List<PurchaseVO> read(String email);
	public void orderInfo_Details(Long purchase_id);
	public List<CartListVO> selectbyId(Long purchase_id);
	public List<PurchaseVO> selectbyPurchaseId(Long purchase_id);
	public List<PurchaseVO> getListWithPaging(@Param("cri") Criteria cri,@Param("email") String email);
}
