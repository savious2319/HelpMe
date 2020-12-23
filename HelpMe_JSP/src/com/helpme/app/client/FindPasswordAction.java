package com.helpme.app.client;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;

public class FindPasswordAction implements Action{
	//굳이 2개로 나누기 보다는 하나로 합치는 쪽이 나을 것 같다.
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		//처음에는 비밀번호를 보내려고 했는데 나중에 생각해보니 인증번호를 보내는 쪽이 더 좋은 것 같다.
		ClientDAO c_dao = new ClientDAO();
		//findPW.jsp로부터 아이디와 이메일을 가져온다.
		String id = request.getParameter("fPwId");
		String email = request.getParameter("fPwEmail");
		//세션 생성
		HttpSession http_session = request.getSession();
		response.setContentType("text/html;charset=utf-8");
		//랜덤 문자열
		Random rnd = new Random();
		String randomStr = "";
		//인증 코드를 만들기 위해 Random을 통해 난수를 생성한다.
		for (int i = 0; i < 10; i++) {
			randomStr = randomStr + String.valueOf((char) ((int) (rnd.nextInt(10))+97)) + String.valueOf(rnd.nextInt(10));
		}

		String pw;
		//pw가 존재하는지 안 하는지 확인
		try {
			pw = (String)c_dao.findPw(id, email);
		} catch (Exception e1) {
			System.out.println(e1);
			pw = null;
		}
//		System.out.println("pw : "+pw);
		
		request.setAttribute("id", id);
		request.setAttribute("email", email);
//		request.setAttribute("pw", pw);
//		request.setAttribute("randomStr", randomStr);
		http_session.setAttribute("randomStr", randomStr);
		
		//보안을 위해 직접적으로 pw를 보내주지는 않는다.
		if(pw!=null) {

			//메일 보내기 부분
			Properties prop = System.getProperties();
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.port", "587");

			Authenticator auth = new MailAuth();

			Session session = Session.getDefaultInstance(prop, auth);

			MimeMessage msg = new MimeMessage(session);

			try {
				
				MimeBodyPart mbp = new MimeBodyPart();
				
				//아래는 메일 내용. 링크를 통해 findPwChange.jsp로 가도록 한다.
//				mbp.setContent("<a href='"+ "http://localhost:8082/HelpMePractice/findPwChange.jsp?userRandomStr=" + randomStr + "'> Please type this verification code : "+randomStr + "</a>", "text/html;charset=UTF-8");
//				mbp.setContent("<a href='"+ "http://localhost:8087/HelpMe_final/findPwChange.jsp?userRandomStr=" + randomStr + "'> Please click this link</a>", "text/html;charset=UTF-8");
//				mbp.setContent("<a href='"+ "http://27.96.131.139/findPwChange.jsp?userRandomStr=" + randomStr + "'> Please click this link</a>", "text/html;charset=UTF-8");				
				mbp.setContent("<a href='"+ "http://helpme-korea.tk/findPwChange.jsp?userRandomStr=" + randomStr + "'> Please click this link</a>", "text/html;charset=UTF-8");

				//링크 만들기 파트
				Multipart mp = new MimeMultipart();
				mp.addBodyPart(mbp);
				
				//날짜 -> 지금 날짜로
				msg.setSentDate(new Date());

				//보낸 쪽
				msg.setFrom(new InternetAddress("cmk072890@gmail.com", "Help Me"));
				//받는 쪽
				InternetAddress to = new InternetAddress(email);
				//수신자 설정
				msg.setRecipient(Message.RecipientType.TO, to);
				//제목
				msg.setSubject("Help Me : Finding password", "UTF-8");
				
				//링크를 메일 내용으로 입력한다
				msg.setContent(mp);
//				msg.setText("<a href='https://www.naver.com'> Please type this verification code : "+randomStr + "</a>", "UTF-8");
				Transport.send(msg);
			
			//예외처리 파트
			} catch(AddressException ae) {
				System.out.println("AddressException : " + ae.getMessage());
			} catch(MessagingException me) {
				System.out.println("MessagingException : " + me.getMessage());
			} catch(UnsupportedEncodingException e) {
				System.out.println("UnsupportedEncodingException : " + e.getMessage());
			}
//			System.out.println("메일 보내기 완료");
			
			//성공했을 경우 이메일을 확인해달라는 메세지를 보도록 한다.
			String mailMsg = "Please check your email.";
			request.setAttribute("mailMsg", mailMsg);
			
			//mailCheck.jsp로 이동
			forward.setRedirect(false);
			forward.setPath("/mailCheck.jsp");
			return forward;
		}else {
			//메일 모내기가 실패했을 경우
//			System.out.println("메일 안 보내짐");
			String alertMsg = "Please check your id or email";
			request.setAttribute("alertMsg", alertMsg);
			//다시 findPW.jsp로 이동
			forward.setRedirect(false);
			forward.setPath("/findPW.jsp");
			return forward;
		}
		
	}

}
