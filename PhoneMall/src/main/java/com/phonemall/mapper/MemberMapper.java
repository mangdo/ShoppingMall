package com.phonemall.mapper;

import com.phonemall.domain.UserVO;

public interface MemberMapper {
	
	public UserVO read(String email);
}
