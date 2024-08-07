package com.chef.app.util;

import java.util.Random;

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
	private int atuhNum; 
	
	// 6자리 랜덤 생성함수
	public void randomNum() throws Exception {
		Random ran = new Random();
		int num = ran.nextInt(888888)+111111;
		System.out.println(num);	
		atuhNum = num;
	}
	
	// 이메일 보내기 메서드
	public void sendMail() throws Exception {
		// 보낼 메세지 내용 작성 
		// MimeMessage 는 java에서 제공해주는 메세지 라이브러리 이다.
		MimeMessage message = mailSenderImpl.createMimeMessage();
		
		// true 매개값을 전달하면 multipart(다중 부분 메시지가 필요하면) 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true , "UTF-8");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	// 이메일 보낼 양식
	public void mailTemplete(String member_mail) throws Exception {
		randomNum();
		// email-config에 설정한 자신의 이메일 주소를 입력
		String myEail = "jangdong456@gmail.com";
		
		// 상대방 email
		String toEail = "jangdong456@gmail.com";
		// 이메일 제목
		String title = "이메일 테스트";
		// 구글 계정 메일 왔을때 안에 컨텍트 형식을 말하는 듯 html 형식으로 작성 !
		
		//이메일 내용 삽입
		String context = "인증번호 테스트 6자리 : " + atuhNum;
		//12123
	}
	
}
