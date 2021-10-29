package com.sist.configuration;

import java.util.Properties;

import javax.crypto.spec.SecretKeySpec;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.sist.utils.Encryption;

@PropertySource("classpath:/application-email.properties")
@Configuration
public class EmailConfig {

	@Value("${mail.smtp.port}")
	private int port;
	@Value("${mail.smtp.socketFactory.port}")
	private int socketPort;
	@Value("${mail.smtp.auth}")
	private boolean auth;
	@Value("${mail.smtp.starttls.enable}")
	private boolean starttls;
	@Value("${mail.smtp.starttls.required}")
	private boolean startlls_required;
	@Value("${mail.smtp.socketFactory.fallback}")
	private boolean fallback;
	@Value("${mail.smtp.key1}")
	private String key1;
	@Value("${mail.smtp.key2}")
	private String key2;

	@Bean
	public JavaMailSender javaMailService() throws Exception {
		SecretKeySpec key = Encryption.createSecretKey("email".toCharArray());
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		javaMailSender.setHost("smtp.gmail.com");
		javaMailSender.setUsername(Encryption.decrypt(key1, key));
		javaMailSender.setPassword(Encryption.decrypt(key2, key));
		javaMailSender.setPort(port);
		javaMailSender.setJavaMailProperties(getMailProperties());
		javaMailSender.setDefaultEncoding("UTF-8");
		return javaMailSender;
	}

	private Properties getMailProperties() {
		Properties pt = new Properties();
		pt.put("mail.smtp.socketFactory.port", socketPort);
		pt.put("mail.smtp.auth", auth);
		pt.put("mail.smtp.starttls.enable", starttls);
		pt.put("mail.smtp.starttls.required", startlls_required);
		pt.put("mail.smtp.socketFactory.fallback", fallback);
		pt.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		return pt;
	}
}