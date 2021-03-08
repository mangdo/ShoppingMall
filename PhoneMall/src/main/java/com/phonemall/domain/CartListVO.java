package com.phonemall.domain;

import java.util.List;

import lombok.Data;

@Data
public class CartListVO {
	private String user_email;
	private long product_id;
	private int product_qty;
	private String product_color;
	
	private String product_title;
	private int product_price;
	private int total_price;
	
	private String product_brand;
	private String product_type;
	private String product_carrier;
	
	private List<ProductImageVO> product_imageList;
}
