package com.phonemall.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.phonemall.domain.UserVO;
import com.phonemall.mapper.MemberMapper;
import com.phonemall.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Setter(onMethod_=@Autowired)
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws
	UsernameNotFoundException {
		
		log.warn("Load user By UserName : " + userName);
		
		UserVO vo = memberMapper.read(userName);
		
		log.warn("queried by member mapper:" + vo);
		return vo == null ? null: new CustomUser(vo);
	}
	

}
