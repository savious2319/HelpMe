package com.helpme.app.client;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator{

	PasswordAuthentication pa;
    
    public MailAuth() {
    	//gmail의 아이디와 비밀번호 입력 -> 제작자의 계정으로 보냈음.
    	//개인정보 보호를 위해 아이디와 비밀번호 부분 삭제
        String mail_id = "";
        String mail_pw = "";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }



	
}
