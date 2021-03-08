package com.phonemall.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CouponUserVO {
	
	private String user_email;
	private int coupon_id;
	private Date startDate;
	private Date endDate;
	private String used;
	
	private List<CouponVO> coupon_List;
}
