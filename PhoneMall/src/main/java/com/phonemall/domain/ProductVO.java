package com.phonemall.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
	private Long product_id;
	private String product_title;
	private int product_price;
	private Date product_regDate;
	private String product_description;
	private String product_information;
	
	private List<ProductColorListVO> product_colorList;
	
	private String product_brand;
	private String product_type;
	private String product_carrier;
}
