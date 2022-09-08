package com.nrifintech.bms.service;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderService {

	@Autowired
	private JavaMailSender javaMailSender;

	private ScheduledExecutorService executorService = Executors.newScheduledThreadPool(20);

	public void sendEmail(String toEmail, String body, String subject) {
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setFrom("beingakscool@gmail.com");
		mailMessage.setTo(toEmail);
		mailMessage.setSubject(subject);
		mailMessage.setText(body);
		executorService.submit(new Runnable() {

			@Override
			public void run() {
				javaMailSender.send(mailMessage);

			}

		});

	}
}
