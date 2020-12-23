package com.helpme.app.helper;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;
import com.helpme.app.client.vo.ClientVO;
import com.helpme.app.helper.dao.HelperDAO;

public class HelperRateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		// out으로 작성할 문자열 환경을 text, html로 잡아준다.
		response.setContentType("text/html;charset=utf-8");

		//html코드를 작성하기 위해서 getWriter()를 out에 담아준다.
		PrintWriter out = response.getWriter();
		
		HelperDAO h_dao = new HelperDAO();
		ClientDAO c_dao = new ClientDAO();

		//고객이 매긴 점수 전달 받기
		int rating = Integer.parseInt(request.getParameter("rating"));
		
		//해당 헬퍼 이름 전달 받기
		String helper_name = request.getParameter("helper_name");
		
		//세션에 저장된 고객 아이디를 client_id에 저장한다
		String client_id = (String) request.getSession().getAttribute("session_id");
		
		//고객 번호 저장할 변수 초기화
		int client_no = 0;
		
		//헬퍼 점수를 매길 수 있는지 없는지 판단하는 변수 초기화
		String check = "";
		
		//헬퍼 이름으로 헬퍼 아이디 가져오기
		String helper_id = h_dao.getHelperId(helper_name);
		
		//고객 아이디로 고객 번호 가져오기
		for (ClientVO c_vo : c_dao.getDetailById(client_id)) {
			client_no = c_vo.getClient_no();
		}

		//만약 고객이 해당 헬퍼를 이미 한번 평가했다면 1이 리턴된다
		if ((Integer)c_dao.getHelperRateCnt(helper_id, client_no) == 1) {
			check = "not-ok";
			
		//만약 1이 리턴되지않았다면 아직 해당 헬퍼를 평가하지 않았다
		} else {
			
			//고객이 헬퍼 한명씩만 평점을 매길 수 있도록 카운트를 등록한다
			c_dao.updateHelperRateCnt(helper_id, client_no);
			
			//평가 매긴 횟수와 총 점수를 업데이트한다
			h_dao.updateRating1(helper_id, rating);
			
			//평점 구해서 업데이트한다
			h_dao.updateRating2(helper_id);
			
			check = "ok";
			
		}

		//ajax로 점수를 매길 수 있는지 없는지 판별하는 check를 전송한다
		out.println(check);
		
		return null;
	}

}
