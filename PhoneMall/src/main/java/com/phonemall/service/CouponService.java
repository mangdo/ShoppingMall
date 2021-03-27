package com.phonemall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.CouponListVO;
import com.phonemall.domain.CouponUserVO;
import com.phonemall.domain.CouponVO;

public interface CouponService {
	
	public void insertCoupon(CouponUserVO CouponUservo);
	public CouponVO searchCoupon(String coupon_code);
	public List<CouponUserVO> getCouponList(String user_email);
	public List<CouponUserVO> getValidList(String user_email);
	public void deleteCoupon(@Param("user_email") String user_email,@Param("coupon_id") int coupon_id);
	public void updateUsedCoupon(@Param("user_email") String user_email,@Param("coupon_id") int coupon_id);
}
