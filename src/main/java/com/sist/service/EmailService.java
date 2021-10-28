package com.sist.service;

import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmailService {

	@Getter
	private static String code;
	private final JavaMailSender emailSender;

	private MimeMessage createMessage(String to) throws Exception {
		MimeMessage message = emailSender.createMimeMessage();
		code = createKey();
		message.setSubject("Test 확인 코드: " + code);
		String msg = "<h1 style='font-size:30px; padding-right:30px; padding-left:30px'>이메일주소 확인</h1>"
				+ "<p style='font-size:17px; padding-right:30px; padding-left:30px'>아래 코드를 입력해주세요.</p>"
				+ "<div style='padding-right:30px; padding-left:30px; margin:32px 0 40px'>"
				+ "<h3 style='text-decoration:none; color:blue'>" + code + "</h3>" + "</div>";
		message.addRecipients(RecipientType.TO, to); // 보내는 대상
		message.setText(msg, "utf-8", "html");
		message.setFrom(new InternetAddress("khyun0267@gmail.com", "Test"));

		return message;
	}

	private String createKey() {
		StringBuffer key = new StringBuffer();
		Random random = new Random();
		for (int i = 0; i < 6; i++) { // 인증코드 6자리
			key.append((random.nextInt(10)));
		}

		return key.toString();
	}

	public boolean sendSimpleMessage(String to) {
		try {
			MimeMessage message = createMessage(to);
			emailSender.send(message);

			return true;
		} catch (Exception e) {
			e.printStackTrace();

			return false;
		}
	}
}