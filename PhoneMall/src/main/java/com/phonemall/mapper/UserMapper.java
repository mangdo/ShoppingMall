package com.phonemall.mapper;


import com.phonemall.domain.AuthVO;
import com.phonemall.domain.UserVO;

public interface UserMapper {

	public void insert(UserVO userVO);
	public void insertAuth(AuthVO authVO);
}
