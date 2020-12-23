package com.helpme.app.schedule;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;
import com.helpme.app.client.vo.ClientVO;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.reservation.dao.ReservationDAO;
import com.helpme.app.reservation.vo.ReservationVO;
import com.helpme.app.schedule.dao.ScheduleDAO;
import com.helpme.app.schedule.vo.ScheduleVO;

public class HelperScheduleOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//리턴타입(전송방식, 응답경로)을 설정한다
		ActionForward forward = new ActionForward();

		ScheduleDAO s_dao = new ScheduleDAO();
		HelperDAO h_dao = new HelperDAO();
		ClientDAO c_dao = new ClientDAO();

		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		//만약 고객 아이디가 널이면 forward방식으로 아래 경로로 이동한다
		if(helper_id == null) {
			forward.setRedirect(false);
			forward.setPath("/helper_schedule.jsp");

			return forward;
			
			
		}else {

			//헬퍼가 일하지않는 요일을 저장하기 위한 list
			ArrayList<String> free_days = new ArrayList<>();
			
			//일요일부터 토요일을 문자열 숫자로 초기화
			String days = "1234567";
			
			//헬퍼가 일하는 요일을 저장하기 위한 변수 초기화
			String workingDays = "";

			//헬퍼 아이디로 헬퍼가 일하는 요일을 문자열로 연결한다
			for (ScheduleVO s_vo : s_dao.getSchedule(helper_id)) {
				workingDays += s_vo.getAvail_day() + "";
			}

			//헬퍼가 일하는 요일을 제외한 요일을 free_days에 저장하는 작업
			for (int i = 0; i < days.length(); i++) {
				if (!workingDays.contains(days.charAt(i) + "")) {
					free_days.add(days.charAt(i) + "");
				}
			}

			//근무 시작 시간을 저장하기 위한 list
			ArrayList<String> start = new ArrayList<>();
			
			//근무 끝 시간을 저장하기 위한 list
			ArrayList<String> end = new ArrayList<>();
			
			
			for (ScheduleVO s_vo : s_dao.getSchedule(helper_id)) {
				String start_time = s_vo.getStart_time() + "";
				//만약 가져온 시작 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 변수에 저장한다
				if (start_time.contains(".5")) {
					start_time = start_time.substring(0, start_time.indexOf(".")) + ":30";
				} else {
					//.5가 포함되지않았다면 뒤에 :00를 붙여 (예를 들어 9:00) 변수에 저장한다
					start_time = start_time.substring(0, start_time.indexOf(".")) + ":00";
				}
				
				start.add(start_time);

			}

			for (ScheduleVO s_vo : s_dao.getSchedule(helper_id)) {
				String end_time = s_vo.getEnd_time() + "";
				//만약 가져온 끝 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 변수에 저장한다
				if (end_time.contains(".5")) {
					end_time = end_time.substring(0, end_time.indexOf(".")) + ":30";
				} else {
					//.5가 포함되지않았다면 뒤에 :00를 붙여 (예를 들어 9:00) 변수에 저장한다
					end_time = end_time.substring(0, end_time.indexOf(".")) + ":00";
				}

				end.add(end_time);
			}

			//예약된 정보를 가져오는 작업
			ReservationDAO r_dao = new ReservationDAO();
			List<ReservationVO> reservation = r_dao.getReservationByHelperId(helper_id);
			
			//예약 정보들을 저장하기위한 변수 초기화
			int client_no = 0, pointsSpent = 0, res_no = 0;
			String resDate = "", resStart = "", resEnd = "", client_name = "", meetingArea = "", resStatus = "",
					service = "";

			//날짜 형식 지정하기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			//현재 날짜를 now에 대입한다
			String now = sdf.format(new Date());
			
			//예약 정보들을 저장하기 위한 list
			ArrayList<Integer> resNoList = new ArrayList<>();
			ArrayList<Integer> clientNoList = new ArrayList<>();
			ArrayList<String> resStartList = new ArrayList<>();
			ArrayList<String> resEndList = new ArrayList<>();
			ArrayList<String> resDateList = new ArrayList<>();
			ArrayList<String> clientNameList = new ArrayList<>();
			ArrayList<String> meetingAreaList = new ArrayList<>();
			ArrayList<String> serviceList = new ArrayList<>();
			ArrayList<Integer> pointsSpentList = new ArrayList<>();
			ArrayList<String> resStatusList = new ArrayList<>();

			//예약정보가 있다면 if문에 들어간다
			if (!reservation.isEmpty()) {
				for (ReservationVO r_vo : r_dao.getReservationByHelperId(helper_id)) {
					client_no = r_vo.getClient_no();
					res_no = r_vo.getRes_no();
					resStart = r_vo.getStart_time() + "";
					resEnd = r_vo.getEnd_time() + "";
					resDate = r_vo.getMeeting_date();
					meetingArea = r_vo.getMeeting_area();
					resStatus = r_vo.getRes_status();
					pointsSpent = r_vo.getPoints_spent();
					service = r_vo.getService();

					//예약을 한 고객 이름을 가져와 저장한다
					for (ClientVO c_vo : c_dao.getDetailByNum(client_no)) {
						client_name = c_vo.getName();
					}

					//예약 시작 시간을 가공하는 작업
					if (resStart.contains(".5")) {
						resStart = resStart.substring(0, resStart.indexOf(".")) + ":30";
					} else {
						resStart = resStart.substring(0, resStart.indexOf(".")) + ":00";
					}

					//예약 끝 시간을 가공하는 작업
					if (resEnd.contains(".5")) {
						resEnd = resEnd.substring(0, resEnd.indexOf(".")) + ":30";
					} else {
						resEnd = resEnd.substring(0, resEnd.indexOf(".")) + ":00";
					}

					//예약 날짜를 가공하는 작업
					String[] data = resDate.split(" ");
					String[] dateSplit = data[0].split("-");

					String date = dateSplit[0] + "/" + dateSplit[1] + "/" + dateSplit[2];

					// 오늘 날짜와 비교해서 지난 예약이면 RES_STATUS를 done 이라고 고침
					Date res_date = sdf.parse(data[0]);
					Date today = sdf.parse(now);

					long diff = res_date.getTime() - today.getTime();

					long diffDays = diff / (24 * 60 * 60 * 1000);

					if (diffDays < 0) {
						resStatus = "done";
					}

					//예약정보를 list에 담기
					resNoList.add(res_no);
					clientNoList.add(client_no);
					resStartList.add(resStart);
					resEndList.add(resEnd);
					resDateList.add(date);
					clientNameList.add(client_name);
					meetingAreaList.add(meetingArea);
					pointsSpentList.add(pointsSpent);
					resStatusList.add(resStatus);
					serviceList.add(service);

				}

			}

			//응답페이지로 전송한다
			request.setAttribute("helperId", helper_id);

			request.setAttribute("resNo", resNoList);
			request.setAttribute("clientNo", clientNoList);
			request.setAttribute("clientName", clientNameList);
			request.setAttribute("resDate", resDateList);
			request.setAttribute("resStart", resStartList);
			request.setAttribute("resEnd", resEndList);
			request.setAttribute("meetingArea", meetingAreaList);
			request.setAttribute("pointsSpent", pointsSpentList);
			request.setAttribute("resStatus", resStatusList);
			request.setAttribute("service", serviceList);

			request.setAttribute("helperAvailDay", s_dao.getSchedule(helper_id));
			request.setAttribute("helperStartTime", start);
			request.setAttribute("helperEndTime", end);
			request.setAttribute("helperFreeDays", free_days);
			request.setAttribute("helperName", h_dao.getHelperName(helper_id));

			forward.setRedirect(false);
			forward.setPath("/helper_schedule.jsp");

			return forward;
		}
	
	}
}
