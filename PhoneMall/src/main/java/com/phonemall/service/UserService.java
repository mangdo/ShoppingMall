package com.phonemall.service;

import com.phonemall.domain.AuthVO;
import com.phonemall.domain.UserVO;

public interface UserService {

	public void register(UserVO userVO);
	public void registerAuth(AuthVO authVO);
	public void updateMember(UserVO userVO);
}
