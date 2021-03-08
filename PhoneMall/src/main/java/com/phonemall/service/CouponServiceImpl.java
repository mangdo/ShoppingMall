package com.phonemall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.phonemall.domain.CouponListVO;
import com.phonemall.domain.CouponUserVO;
import com.phonemall.domain.CouponVO;
import com.phonemall.mapper.CouponMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service

public class CouponServiceImpl implements CouponService{
	
	private CouponMapper mapper;
	
	@Override
	public void insertCoupon(CouponUserVO CouponUservo) {
		mapper.insert(CouponUservo);
	}
	
	public CouponVO searchCoupon(String coupon_code) {
		return mapper.search(coupon_code);
	}
	
	public List<CouponUserVO> getCouponList(String user_email) {
		return mapper.getList(user_email);
	}
	
	public List<CouponUserVO> getValidList(String user_email){
		return mapper.getValidList(user_email);
	}
	
	public void deleteCoupon(String user_email, int coupon_id) {
		mapper.delete(user_email, coupon_id);
	}
}
