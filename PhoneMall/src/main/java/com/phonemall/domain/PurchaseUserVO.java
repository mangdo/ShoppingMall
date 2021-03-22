package com.phonemall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PurchaseUserVO {
	
	private long order_id;
	private String user_email;
	private long product_id;
	private int product_qty;
	private int product_price;
	private String product_color;
	
	private long purchase_id;
	private Date purchase_date;
	
	private String product_title;
	private ProductImageVO product_image;

}
