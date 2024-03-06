package com.cooltrade.common;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
  public static void send(String to, String subject, String body) throws AddressException, MessagingException {

    String from = "h4709870@gmail.com"; // 발신자 이메일 주소
    String host = "smtp.gmail.com"; // SMTP 서버 주소

    // 메일 서버 설정
    Properties properties = System.getProperties();
    properties.setProperty("mail.smtp.host", host);
    properties.setProperty("mail.smtp.auth", "true");
    properties.setProperty("mail.smtp.port", "587"); // SMTP 포트 번호
    properties.setProperty("mail.smtp.starttls.enable", "true"); // TLS 사용 설정

    // 세션 생성
    // 인증을 위한 세션 생성
    Session session = Session.getInstance(properties, new Authenticator() {
      protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(from, "avoetdrzyfhieaxa");
      }
    });

      // MimeMessage 객체 생성
      MimeMessage message = new MimeMessage(session);

      // 발신자 설정
      message.setFrom(new InternetAddress(from));

      // 수신자 설정
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

      // 제목 설정
      message.setSubject(subject);

      // 본문 설정// HTML 본문 설정
      message.setContent(body, "text/html; charset=utf-8");

      // 메일 전송
      Transport.send(message);
  }
}
