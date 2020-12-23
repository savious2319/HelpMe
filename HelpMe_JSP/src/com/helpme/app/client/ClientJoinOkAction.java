package com.helpme.app.client;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;
import com.helpme.app.client.vo.ClientVO;

public class ClientJoinOkAction implements Action {
	public ClientJoinOkAction() {;}
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		System.out.println("clientjoinokaction 들어옴");
		request.setCharacterEncoding("UTF-8");
		
		//리턴타입(전송방식, 응답경로)
		ActionForward forward = new ActionForward();
		
		ClientDAO c_dao = new ClientDAO();
		ClientVO c_vo = new ClientVO();
		
		//모델 객체에 사용자가 입력한 정보 모두를 담아준다.
		
		//VO대로 하자!
		//signup에서 입력한 정보들을 request를 통해 가져온다.
		c_vo.setClient_id(request.getParameter("client_id"));
		c_vo.setPassword(request.getParameter("client_password"));
		c_vo.setName(request.getParameter("client_name"));
		c_vo.setEmail(request.getParameter("client_email"));
		c_vo.setCountry(request.getParameter("client_country"));
		c_vo.setAddress(request.getParameter("roadFullAddr"));
		c_vo.setPhone_number(request.getParameter("client_phone_number"));
		System.out.println("request.getParameter 제대로 작동");
		
		System.out.println(request.getParameter("client_id"));
		System.out.println(request.getParameter("client_password"));
		System.out.println(request.getParameter("client_name"));
		System.out.println(request.getParameter("client_email"));
		System.out.println(request.getParameter("client_country"));
		System.out.println(request.getParameter("roadFullAddr"));
		System.out.println(request.getParameter("client_phone_number"));
		
		//이미 계정이 전재할 경우 -> 이름, 이메일이 이미 있을 경우
		if(c_dao.memberCheck(c_vo.getName(), c_vo.getEmail()) != 0) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('Your account already exists. Please login first')");
			//login.jsp로 이동
			out.println("location.href = '"+request.getContextPath() + "/login.jsp'");
			out.println("</script>");
			out.close();
			return null;
		}
		
		
		//사용자가 입력한 정보를 join메소드에 전달한다.
		else if(!c_dao.signup(c_vo)) {
			//실패
			//경고메세지
			System.out.println("실패!");
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('Sign up has failed. Please try again later.');");
			out.println("location.href = '"+request.getContextPath() + "/sign.jsp'");
			out.println("</script>");
			out.close();
			return null;
		}
		
		
		//※forward 방식으로 전송하면, request객체가 그대로 응답페이지에 유지되므로 응답 경로는 상대경로로 작성한다.
		//※redirect 방식으로 전송하면, request객체가 초기화되기 전 context path를 직접 작성해주어야 한다.
				
		//성공
		/*redirect 방식*/
//		forward.setRedirect(true);
//		forward.setPath(request.getContextPath() + "/member/MemberLogin.me");
		else {
			/*forward 방식*/
			//회원가입에 성공했을 때
			System.out.println("성공");
			forward.setRedirect(false);
			forward.setPath("/client/ClientLogin.cl");
			return forward;
			
		}		
	}

}