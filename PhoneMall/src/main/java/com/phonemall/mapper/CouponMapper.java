package com.phonemall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.phonemall.domain.CouponListVO;
import com.phonemall.domain.CouponUserVO;
import com.phonemall.domain.CouponVO;
import com.phonemall.domain.ProductVO;

public interface CouponMapper {
	public void insert(CouponUserVO CouponUservo);
	public CouponVO search(String coupon_code);
	
	//getList = show all coupon
	public List<CouponUserVO> getList(String user_email);
	
	//getValidList = show only valid coupons(date not expired, not used)
	public List<CouponUserVO> getValidList(String user_email);
	
	public void delete(@Param("user_email") String user_email,@Param("coupon_id") int coupon_id);
	
	//if coupon is used update coupon used part 
	public void update(@Param("user_email") String user_email,@Param("coupon_id") int coupon_id);
}
