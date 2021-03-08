package com.phonemall.domain;

import lombok.Data;

@Data
public class CouponVO {
	private int coupon_id;
	private String coupon_name;
	private String coupon_description;
	private int discount;
	private int price_limit;
	private int duration;
	private String coupon_code;
	
}
