package com.helpme.app.client;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;
import com.helpme.app.client.vo.ClientVO;
import com.helpme.app.reservation.dao.ReservationDAO;
import com.helpme.app.reservation.vo.ReservationVO;

public class ClientPointsOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		//리턴타입(전송방식, 응답경로)을 설정한다
		ActionForward forward = new ActionForward();
		
		//세션에 저장된 고객 아이디를 client_id에 저장한다
		String client_id = (String) request.getSession().getAttribute("session_id");
		
		//만약 고객 아이디가 널이면 forward방식으로 client_points.jsp로 이동한다
		if (client_id == null) {
			forward.setRedirect(false);
			forward.setPath("/client_points.jsp");

			return forward;
		
		//만약 고객 아이디가 널이 아니면 아래 데이터를 client_points.jsp로 전송한다	
		} else {

			ClientDAO c_dao = new ClientDAO();

			//고객의 현재 보유 포인트를 저장할 변수 초기화
			int client_points = 0;
			
			//고객 번호를 저장할 변수 초기화
			int client_no = 0;
			
			//고객 아이디로 고객의 현재 보유 포인트와 고객 번호를 getDetailById 메소드로 가져온다
			for (ClientVO c_vo : c_dao.getDetailById(client_id)) {
				client_points = c_vo.getAvailable_points();
				client_no = c_vo.getClient_no();
			}
			
			
			ReservationDAO r_dao = new ReservationDAO();
			
			//예약 시작 시간을 저장할 변수 초기화
			String meetingStart = "";
			
			//예약 끝 시간을 저장할 변수 초기화
			String meetingEnd = "";
			
			//고객의 모든 예약된 날짜들을 저장하기 위한 list
			ArrayList<String> resDate = new ArrayList<>();
			
			//고객의 예약된 시작 시간을 저장하기 위한 list
			ArrayList<String> start = new ArrayList<>();
			
			//고객의 예약된 끝 시간을 저장하기 위한 list
			ArrayList<String> end = new ArrayList<>();
			
			//고객의 모든 예약에 소비된 포인트를 저장하기 위한 list
			ArrayList<String> points_spent = new ArrayList<>();
			
			//고객이 예약한 서비스를 저장하기 위한 list
			ArrayList<String> service = new ArrayList<>();

			
			for (ReservationVO r_vo : r_dao.getReservationByClientNo(client_no)) {
				// 2020-11-10 00:00:00의 형태로 예약 날짜를 가져온다
				// 먼저 공백을 기준으로 문자열을 분리한다
				String[] calendar = r_vo.getMeeting_date().split(" ");
				
				// 2020-11-10만 남게되고 다시 -를 기준으로 문자열을 분리한다
				String[] dateSplit = calendar[0].split("-");
				
				// 분리한 문자열을 아래 순서로 date 문자열에 저장한다
				String date = dateSplit[1] + "/" + dateSplit[2] + "/" + dateSplit[0];

				// 가공된 예약날짜를 resDate에 저장한다
				resDate.add(date);
				
				// 가져온 예약 시작 시간을 문자열로 형변환 한다
				meetingStart = r_vo.getStart_time() + "";
				
				// 가져온 예약 끝 시간을 문자열로 형변환 한다
				meetingEnd = r_vo.getEnd_time() + "";
				
				//만약 가져온 시작 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 meetingStart 변수에 저장한다 
				if (meetingStart.contains(".5")) {
					meetingStart = meetingStart.substring(0, meetingStart.indexOf(".")) + ":30";
				} else {
					//.5가 포함되지않았다면 뒤에 :00를 붙여 (예를 들어 9:00) meetingStart에 변수에 저장한다
					meetingStart = meetingStart.substring(0, meetingStart.indexOf(".")) + ":00";
				}

				// 가공된 시작 시간을 start에 저장한다
				start.add(meetingStart);
				
				//만약 가져온 끝 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 meetingEnd 변수에 저장한다 
				if (meetingEnd.contains(".5")) {
					meetingEnd = meetingEnd.substring(0, meetingEnd.indexOf(".")) + ":30";
				} else {
					//.5가 포함되지않았다면 뒤에 :00를 붙여 (예를 들어 9:00) meetingEnd에 변수에 저장한다
					meetingEnd = meetingEnd.substring(0, meetingEnd.indexOf(".")) + ":00";
				}

				// 가공된 끝 시간을 end에 저장한다
				end.add(meetingEnd);

				// 예약에 사용된 포인트를 문자열로 형변화해서 points_spent에 저장한다
				points_spent.add(r_vo.getPoints_spent() + "");

				// 고객이 예약한 서비스를 저장한다
				service.add(r_vo.getService());
			}

			// 고객의 현재 포인트에서 총 예약에서 사용한 포인트를 차감한다
			for (int i = 0; i < points_spent.size(); i++) {
				client_points -= Integer.parseInt(points_spent.get(i));
			}

			//응답페이지로 전달하기
			request.setAttribute("clientId", client_id);
			request.setAttribute("loginAs", request.getParameter("loginAs"));
			request.setAttribute("client_points", client_points);
			request.setAttribute("resInfo", r_dao.getReservationByClientNo(client_no));
			request.setAttribute("resDate", resDate);
			request.setAttribute("start", start);
			request.setAttribute("end", end);

			forward.setRedirect(false);
			forward.setPath("/client_points.jsp");

			return forward;
		}
	}

}
