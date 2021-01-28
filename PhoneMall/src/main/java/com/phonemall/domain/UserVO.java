package com.phonemall.domain;



import java.util.List;

import lombok.Data;

@Data
public class UserVO{	

	private String email;
	private String userpw;
	private String lastname;
	private String firstname;
	private String postalcode;
	private String phonenum;
	private String address;
	private int enabled;
	private List<AuthVO> authList;
}
