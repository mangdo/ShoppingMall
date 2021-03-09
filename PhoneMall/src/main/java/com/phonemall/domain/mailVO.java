package com.phonemall.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor 
@AllArgsConstructor
@Data
public class mailVO {
	private String name;
	private String email;
	private String title;
	private String phone;
	private String message;
}
