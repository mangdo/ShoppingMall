package com.phonemall.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class PurchaseVO {
	private Long sequence_id;
	private Long purchase_id;
	private Date purchaseDate;
	private String memo;
	private String email;
	private String lastname;
	private String firstname;
	private String postalcode;
	private String phonenum;
	private String address;
	private String paymentMethod;
	private List<CartListVO> cartList;
	private int used_coupon;
	private int total_money;
	private int discount_result;
}
