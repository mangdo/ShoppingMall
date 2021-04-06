package com.phonemall.controller;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.phonemall.domain.mailVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@RestController
public class MailSendController {
	
	private final MailSender sender;
	
	@RequestMapping("/mail/send")
	public String sendMail(@RequestBody mailVO mail) {
		log.info("send mail"+mail);
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo("springphonemall2021@gmail.com");
		message.setSubject(mail.getTitle());
		message.setText(" name : "+mail.getName()+" email : "+mail.getEmail()+
						" phone : "+mail.getPhone()+" content : "+mail.getMessage());
		// JavamailSender
		message.setFrom("springphonemall2021@gmail.com");
		sender.send(message);
		return "success";
		
	}
}
