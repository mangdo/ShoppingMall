package com.phonemall.domain;

import lombok.Data;

@Data
public class KakaoPayPurchaseVO {

	private Long purchase_id;
	private String user_email;
	private String purchase_name;
	private int purchase_qty;
	private int purchase_price;
}