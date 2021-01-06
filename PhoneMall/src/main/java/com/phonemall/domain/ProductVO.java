package com.phonemall.domain;

import java.util.Date;


import lombok.Data;

@Data
public class ProductVO {
	private Long product_id;
	private String product_title;
	private int product_price;
	private Date product_regDate;
	private String product_description;
}
