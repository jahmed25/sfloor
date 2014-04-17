package com.sfloor.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.sfloor.services.EmailService;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender mailSender;
	
	/*@Value("#{email.host")
	String host;
	
	@Value("#{email.username")
	String user;
	
	@Value("#{email.port")
	Integer port;
	
	@Value("#{email.password")
	String pwd;
	
	@Value("#{email.mail.smtp.auth")
	String auth;
	
	@Value("#{email.mail.smtp.starttls.enable")
	boolean enable;*/
	
	

	@Override
	public void sendEmail(String msg) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo("jahmed@sapient.com");
		message.setFrom("info@megafactoryoutlet.com");
		message.setSubject("Testing Email is working or not");
		message.setText("Bhai check kryo ye work kr bhi rha hi ki nhi");
		mailSender.send(message);
		
	}
	
	

}
