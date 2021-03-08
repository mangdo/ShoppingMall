package com.phonemall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CouponListVO {

	private String user_email;
	private int coupon_id;
	private String coupon_name;
	private String coupon_description;
	private int discount;
	private int price_limit;
	private Date startDate;
	private Date endDate;
	private int used;
	
}
