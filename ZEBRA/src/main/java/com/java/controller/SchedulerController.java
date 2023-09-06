package com.java.controller;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class SchedulerController {

	 @Scheduled(cron = "0 0 9 * * *")
	 public static void sendMail() {
		    Properties props = new Properties();
		    props.put("mail.smtp.host", "smtp.gmail.com");
		    props.put("mail.smtp.port", "587");
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.starttls.enable", "true");
		    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		    Session session = Session.getInstance(props, new Authenticator() {
		        @Override
		        protected PasswordAuthentication getPasswordAuthentication() {
		            return new PasswordAuthentication("ellist0202@gmail.com", "nvjtaqeherhoovah");
		        }
		    });

		    String receiver = "ellist@naver.com";
		    String title = "직원 목록 메일입니다.";
		    String content = "첨부 파일 확인하시길 바랍니다.";

		    try {
		        Message message = new MimeMessage(session);
		        message.setFrom(new InternetAddress("ellist0202@gmail.com", "관리자", "utf-8"));
		        message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
		        message.setSubject(title);

		        // 이메일 본문 설정
		        MimeBodyPart textPart = new MimeBodyPart();
		        textPart.setText(content, "utf-8", "html");

		        // 첨부 파일 설정
		        MimeBodyPart attachmentPart = new MimeBodyPart();
		        FileDataSource fileDataSource = new FileDataSource("C:\\upload\\data.xlsx"); // 첨부할 파일 경로
		        attachmentPart.setDataHandler(new DataHandler(fileDataSource));
		        attachmentPart.setFileName(fileDataSource.getName());

		        // 메시지 본문과 첨부 파일을 조합
		        Multipart multipart = new MimeMultipart();
		        multipart.addBodyPart(textPart);
		        multipart.addBodyPart(attachmentPart);

		        // 메시지에 본문과 첨부 파일 설정
		        message.setContent(multipart);

		        // 이메일 발송
		        Transport.send(message);

		        System.out.println("이메일 발송 완료.");
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
	
	 }
}
