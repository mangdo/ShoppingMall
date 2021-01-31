package com.phonemall.domain;

import lombok.Data;

@Data
public class WishListVO {
	private int cart_id;
	private long product_id;
	private String user_email;
}
