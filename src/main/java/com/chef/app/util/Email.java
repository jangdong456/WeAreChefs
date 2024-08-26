package com.chef.app.util;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class Email {
	
	@Autowired
	private JavaMailSenderImpl mailSenderImpl;
	private int authNum; 
	
	// 6자리 랜덤 생성함수
	public void randomNum() throws Exception {
		Random ran = new Random();
		int num = ran.nextInt(888888)+111111;
		System.out.println(num);	
		authNum = num;
	}
	
	
	// 이메일 보낼 양식 및 메일 보내기
	public String mailTemplete(String member_mail) throws Exception {
		randomNum();
		// email-config에 설정한 자신의 이메일 주소를 입력
		String myEail = "jangdong456@gmail.com";
		
		// 상대방 email
		String toEail = member_mail;
		// 이메일 제목
		String title = "이메일 인증번호";
		// 구글 계정 메일 왔을때 안에 컨텍트 형식을 말하는 듯 html 형식으로 작성 !
		
		//이메일 내용 삽입
		String context = "인증번호 6자리 : " + authNum;
		
		sendMail(myEail, toEail, title, context);
		return Integer.toString(authNum);
	}
	
	// 이메일에 어떠한 데이터를 보낼지 저장하는 메서드
	public void sendMail(String myEmail, String toEmail, String title, String context) throws Exception {
		// 보낼 메세지 내용 작성 
		// MimeMessage 는 java에서 제공해주는 메세지 라이브러리 이다.
		MimeMessage message = mailSenderImpl.createMimeMessage();
		
		
		// true 매개값을 전달하면 multipart(다중 부분 메시지가 필요하면) 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true , "UTF-8");
			helper.setFrom(myEmail);
			helper.setTo(toEmail);
			helper.setSubject(title);
			helper.setText(context);
			mailSenderImpl.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
}
