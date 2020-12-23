package com.helpme.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonObject;
import com.helpme.domain.ReservationVO;
import com.helpme.service.ClientService;
import com.helpme.service.HelperService;
import com.helpme.service.ReservationService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reservation/")
@RestController
@AllArgsConstructor
@Log4j
public class ReservationController {

	private ReservationService res_service;
	private ClientService client_service;
	private HelperService helper_service;

	//고객 예약
	@PostMapping(value = "/makeReservation/{clientName}/{datepicker}/", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> makeReservation(HttpServletRequest request, @RequestBody ReservationVO res,
			@PathVariable("clientName") String clientName, @PathVariable("datepicker") String datepicker) {

		log.info("ReservationVO : " + res);

		JsonObject jo = new JsonObject();
		
		String helper_id = (String) request.getSession().getAttribute("session_id");

		if (!client_service.getClientNameByName(clientName)) {
			jo.addProperty("check", "fail");

		} else {

			int client_no = client_service.getClientNo(clientName);
			int points_spent = 0;

			points_spent = (int) (res.getEndTime() - res.getStartTime()) * helper_service.getFare(helper_id);

			res.setPointsSpent(points_spent);

			log.info("client name : " + clientName);
			log.info("client_no : " + client_no);
			log.info("service : " + res.getService());
			log.info("meetingArea : " + res.getMeetingArea());
			log.info("meetingPlace : " + res.getMeetingPlace());
			log.info("meetingDate : " + datepicker);
			log.info("meetingStartTime : " + res.getStartTime());
			log.info("meetingEndTime : " + res.getEndTime());
			log.info("points_spent : " + res.getPointsSpent());

			res.setHelperId(helper_id);
			res.setClientNo(client_no);
			
			//예약 날짜를 가공하는 작업
			String[] calendar = datepicker.split(" ");
			String month = "";

			switch (calendar[1]) {
			case "Jan":
				month = "01";
				break;
			case "Feb":
				month = "02";
				break;
			case "Mar":
				month = "03";
				break;
			case "Apr":
				month = "04";
				break;
			case "May":
				month = "05";
				break;
			case "Jun":
				month = "06";
				break;
			case "Jul":
				month = "07";
				break;
			case "Aug":
				month = "08";
				break;
			case "Sep":
				month = "09";
				break;
			case "Oct":
				month = "10";
				break;
			case "Nov":
				month = "11";
				break;
			case "Dec":
				month = "12";
				break;
			}

			String date = month + "/" + calendar[2] + "/" + calendar[3];

			log.info("date : " + date);
			
			res.setMeetingDate(date);
			
			res_service.insertReservation(res);

			String res_status = "";
			for (ReservationVO r : res_service.getReservationByHelperId(helper_id)) {
				res_status = r.getResStatus();
			}

			HashMap<String, Object> data = new HashMap<>();
			data.put("client_no", client_no);
			data.put("helper_id", helper_id);

			int res_no = res_service.getResNo(data);
			log.info("res_no : " + res_no);

			String meetingStartTime = res.getStartTime() + "";
			String meetingEndTime = res.getEndTime() + "";

			if (meetingStartTime.contains(".5")) {
				meetingStartTime = meetingStartTime.substring(0, meetingStartTime.indexOf(".")) + ":30";
			} else {
				meetingStartTime = meetingStartTime.substring(0, meetingStartTime.indexOf(".")) + ":00";
			}

			if (meetingEndTime.contains(".5")) {
				meetingEndTime = meetingEndTime.substring(0, meetingEndTime.indexOf(".")) + ":30";
			} else {
				meetingEndTime = meetingEndTime.substring(0, meetingEndTime.indexOf(".")) + ":00";
			}
			
			log.info("meetingStartTime : " + meetingStartTime);
			log.info("meetingEndTime : " + meetingEndTime);
			
			jo.addProperty("client_no", client_no);
			jo.addProperty("helper_id", helper_id);
			jo.addProperty("res_no", res_no);
			jo.addProperty("clientName", clientName);
			jo.addProperty("date", date);
			jo.addProperty("meetingStartTime", meetingStartTime);
			jo.addProperty("meetingEndTime", meetingEndTime);
			jo.addProperty("meetingArea", res.getMeetingArea());
			jo.addProperty("service", res.getService());
			jo.addProperty("pointsSpent", points_spent);
			jo.addProperty("res_status", res_status);
			jo.addProperty("check", "success");

		}
		return new ResponseEntity<>(jo.toString(), HttpStatus.OK); 
	}

	//고객 예약 수정 및 취소
	@DeleteMapping(value="/deleteReservation/{res_no}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteReservation(@PathVariable("res_no") int res_no){
		log.info("res_no : " + res_no);
		
		int result = res_service.deleteReservationByResNo(res_no);
		
		String resNo = res_no + "";
		
		return result == 1 ? new ResponseEntity<>(resNo, HttpStatus.OK) : 
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
}
