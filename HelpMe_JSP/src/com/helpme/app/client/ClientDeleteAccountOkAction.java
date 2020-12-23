package com.helpme.app.client;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;
import com.helpme.app.client.vo.ClientVO;

public class ClientDeleteAccountOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//세션에 저장된 고객 아이디를 client_id에 저장한다
		String client_id = (String) request.getSession().getAttribute("session_id");
		
		//고객 번호 저장할 변수 초기화
		int client_no = 0;
		
		//고객DAO 인스턴스 생성 및 생성자 호출
		ClientDAO c_dao = new ClientDAO();
		
		//해당 고객 아이디의 고객 번호를 가져와 client_no에 저장한다
		for (ClientVO c_vo : c_dao.getDetailById(client_id)) {
			client_no = c_vo.getClient_no();
		}
		
		//고객 번호로 해당 고객의 계정을 삭제한다
		c_dao.deleteAccount(client_no);
		
		//세션을 가져온다
		HttpSession session = request.getSession();
		
		//전체 세션 값 삭제하기
		session.invalidate();
		
		return null;
	}

}
