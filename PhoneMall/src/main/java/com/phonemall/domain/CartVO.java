package com.phonemall.domain;


import lombok.Data;

@Data
public class CartVO {
	private int cart_id;
	private String user_email;
	private long product_id;
	private int product_qty;
	private int product_price;
	private int total_price;
	private String product_color;	
}
