package com.helpme.app.schedule;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.schedule.dao.ScheduleDAO;
import com.helpme.app.schedule.vo.ScheduleVO;

public class HelperScheduleAddOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		ScheduleDAO s_dao = new ScheduleDAO();
		
		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		//헬퍼가 추가한 요일, 시작 시간, 끝 시간을 전달 받는다
		int addDay = Integer.parseInt(request.getParameter("addDay"));
		String start_time = request.getParameter("addStartTime");
		String end_time = request.getParameter("addEndTime");

		//헬퍼가 추가한 요일의 시작, 끝 시간이 정수인지 실수인지 판단해서 저장할 변수 초기화
		double startTimeDouble = 0.0, endTimeDouble = 0.0;
		int startTimeInt = 0, endTimeInt = 0;
		
		//시작, 끝 시간에 .이 있다면 실수로 파싱한다
		if ((start_time.contains(".") || end_time.contains("."))
				|| (start_time.contains(".") && end_time.contains("."))) {
			startTimeDouble = Double.parseDouble(start_time);
			endTimeDouble = Double.parseDouble(end_time);
			
			//생성자를 통해 추가 요일 정보를 저장하고 DB에 저장한다
			ScheduleVO s_vo = new ScheduleVO(helper_id, startTimeDouble, endTimeDouble, addDay);
			s_dao.insertSchedule(s_vo);

		//시작, 끝 시간에 .이 포함이 않았다면 정수로 파싱한다	
		} else {
			startTimeInt = Integer.parseInt(start_time);
			endTimeInt = Integer.parseInt(end_time);
			
			//생성자를 통해 추가 요일 정보를 저장하고 DB에 저장한다
			ScheduleVO s_vo = new ScheduleVO(helper_id, startTimeInt, endTimeInt, addDay);
			s_dao.insertSchedule(s_vo);
		}
		
		return null;
	}

}
