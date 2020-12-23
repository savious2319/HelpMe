package com.helpme.app.schedule;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.schedule.dao.ScheduleDAO;

public class HelperScheduleDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//html코드를 작성하기 위해서 getWriter()를 out에 담아준다.
		PrintWriter out = response.getWriter();
		
		// out으로 작성할 문자열 환경을 text, html로 잡아준다.
		response.setContentType("text/html;charset=utf-8");

		ScheduleDAO s_dao = new ScheduleDAO();
		
		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		//헬퍼가 삭제한 요일을 전달받는다
		int removeDay = Integer.parseInt(request.getParameter("removeDay"));
		
		//DB에서 헬퍼가 선택한 요일을 삭제한다
		s_dao.deleteSchedule(helper_id, removeDay);
		
		//ajax로 응답페이지에서 바로 변경된 요일의 시작, 끝 시간을 보여주기 위해 하는 작업
		
		//정수로 받은 요일을 문자열 요일로 바꾸는 작업
		String day = "";

		switch (removeDay) {
		case 1:
			day = "Sunday";
			break;
		case 2:
			day = "Monday";
			break;
		case 3:
			day = "Tuesday";
			break;
		case 4:
			day = "Wednesday";
			break;
		case 5:
			day = "Thursday";
			break;
		case 6:
			day = "Friday";
			break;
		case 7:
			day = "Saturday";
			break;
		}
		
		//ajax를 통해 삭제한 요일을 전송한다
		out.println(day);
		
		return null;
	}

}
