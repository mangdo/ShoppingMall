package com.phonemall.service;

import org.springframework.stereotype.Service;

import com.phonemall.domain.AuthVO;
import com.phonemall.domain.UserVO;
import com.phonemall.mapper.UserMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class UserServiceImpl implements UserService{
	
	private UserMapper mapper;
	
	@Override
	public void register(UserVO userVO){
		mapper.insert(userVO);
	}
	
	public void registerAuth(AuthVO authVO) {
		mapper.insertAuth(authVO);
	}
}
