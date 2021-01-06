package com.phonemall.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler{
	
	public void onAuthenticationFailure(HttpServletRequest request,
			HttpServletResponse response, AuthenticationException accessException)
			throws IOException, ServletException{
	
		log.error("Access Denied Handler");
		
		log.error("Redirect....");
		
		if (accessException instanceof AuthenticationServiceException) {
			request.setAttribute("loginFailMsg", "�������� �ʴ� ������Դϴ�.");
		
		} else if(accessException instanceof BadCredentialsException) {
			request.setAttribute("loginFailMsg", "���̵� �Ǵ� ��й�ȣ�� Ʋ���ϴ�.");
			
		} else if(accessException instanceof LockedException) {
			request.setAttribute("loginFailMsg", "��� �����Դϴ�..");
			
		} else if(accessException instanceof DisabledException) {
			request.setAttribute("loginFailMsg", "��Ȱ��ȭ�� �����Դϴ�..");
			
		} else if(accessException instanceof AccountExpiredException) {
			request.setAttribute("loginFailMsg", "����� �����Դϴ�..");
			
		} else if(accessException instanceof CredentialsExpiredException) {
			request.setAttribute("loginFailMsg", "��й�ȣ�� ����Ǿ����ϴ�.");
		}
		
		// �α��� �������� �ٽ� ������
		RequestDispatcher dispatcher = request.getRequestDispatcher("/customlogin");
		dispatcher.forward(request, response);
		
		response.sendRedirect("/accessError");
	}

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}

}
