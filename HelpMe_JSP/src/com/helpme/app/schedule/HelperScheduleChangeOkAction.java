package com.helpme.app.schedule;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.schedule.dao.ScheduleDAO;
import com.helpme.app.schedule.vo.ScheduleVO;

public class HelperScheduleChangeOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//html코드를 작성하기 위해서 getWriter()를 out에 담아준다.
		PrintWriter out = response.getWriter();
		
		// out으로 작성할 문자열 환경을 text, html로 잡아준다.
		response.setContentType("text/html;charset=utf-8");

		ScheduleDAO s_dao = new ScheduleDAO();

		//헬퍼가 변경한 요일, 시작, 끝 시간을 전달받는다
		int changeDay = Integer.parseInt(request.getParameter("changeDay"));
		String start_time = request.getParameter("changeStartTime");
		String end_time = request.getParameter("changeEndTime");

		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		//헬퍼가 추가한 요일의 시작, 끝 시간이 정수인지 실수인지 판단해서 저장할 변수 초기화
		double startTimeDouble = 0.0, endTimeDouble = 0.0;
		int startTimeInt = 0, endTimeInt = 0;

		//시작, 끝 시간에 .이 있다면 실수로 파싱한다
		if ((start_time.contains(".") || end_time.contains("."))
				|| (start_time.contains(".") && end_time.contains("."))) {
			startTimeDouble = Double.parseDouble(request.getParameter("changeStartTime"));
			endTimeDouble = Double.parseDouble(request.getParameter("changeEndTime"));
			
			//생성자를 통해 추가 요일 정보를 저장하고 DB에 저장한다
			ScheduleVO s_vo = new ScheduleVO(helper_id, startTimeDouble, endTimeDouble, changeDay);
			s_dao.updateSchedule(s_vo);
			
		//시작, 끝 시간에 .이 포함이 않았다면 정수로 파싱한다		
		} else {
			startTimeInt = Integer.parseInt(request.getParameter("changeStartTime"));
			endTimeInt = Integer.parseInt(request.getParameter("changeEndTime"));
			
			//생성자를 통해 추가 요일 정보를 저장하고 DB에 저장한다
			ScheduleVO s_vo = new ScheduleVO(helper_id, startTimeInt, endTimeInt, changeDay);
			s_dao.updateSchedule(s_vo);
		}

		//ajax로 응답페이지에서 바로 변경된 요일의 시작, 끝 시간을 보여주기 위해 하는 작업
		
		//정수로 받은 요일을 문자열 요일로 바꾸는 작업
		String day = "";
		switch (changeDay) {
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

		//만약 가져온 시작 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 변수에 저장한다 
		if (start_time.contains(".5")) {
			start_time = start_time.substring(0, start_time.indexOf(".")) + ":30";
		}else {
			start_time = start_time + ":00";
		}
		
		//만약 가져온 끝 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 변수에 저장한다 
		if (end_time.contains(".5")) {
			end_time = end_time.substring(0, end_time.indexOf(".")) + ":30";
		}else {
			end_time = end_time + ":00";
		}
		
		//ajax를 통해 전송할 데이터를 문자열로 연결한다
		String data = day + "," + start_time + "," + end_time;

		//ajax를 통해 전송한다
		out.println(data);
		out.close();

		return null;
	}
}
