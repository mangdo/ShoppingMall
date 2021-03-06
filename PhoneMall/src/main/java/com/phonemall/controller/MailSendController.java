package com.phonemall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phonemall.domain.mailVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MailSendController {
	@Autowired
	MailSender sender;
	
	@RequestMapping("/mail/send")
	@ResponseBody
	public String sendMail(@RequestBody mailVO mail) {
		log.info("send mail");
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo("springphonemall2021@gmail.com");
		message.setSubject(mail.getTitle());
		message.setText("name : "+mail.getName()+"email : "+mail.getEmail()+
						"phone : "+mail.getPhone()+"content : "+mail.getMessage());
		// 발신자는 JavamailSender에서 설정한 구글 계정으로 설정해야 함
		message.setFrom("springphonemall2021@gmail.com");
		sender.send(message);
		return "success";
		
	}
}
