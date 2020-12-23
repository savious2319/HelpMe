package com.helpme.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.helpme.domain.ScheduleVO;
import com.helpme.service.ScheduleService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/schedule/")
@RestController
@AllArgsConstructor
@Log4j
public class ScheduleController {

	private ScheduleService schedule_service;
	
	//헬퍼 스케줄 수정
	@GetMapping(value = "/changeSchedule/{changeDay}/{changeStartTime}/{changeEndTime}/", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> changeSchedule(HttpServletRequest request, @PathVariable("changeDay") int day,
			@PathVariable("changeStartTime") String startTime, @PathVariable("changeEndTime") String endTime) {
		
		log.info("Helper Change Schedule");
		log.info("day : " + day);
		log.info("startTime : " + startTime);
		log.info("endTime : " + endTime);
		String helper_id = (String) request.getSession().getAttribute("session_id");

		double startTimeDouble = 0.0, endTimeDouble = 0.0;
		int startTimeInt = 0, endTimeInt = 0;

		if ((startTime.contains(".") || endTime.contains(".")) || (startTime.contains(".") && endTime.contains("."))) {
			startTimeDouble = Double.parseDouble(startTime);
			endTimeDouble = Double.parseDouble(endTime);
			
			ScheduleVO s_vo = new ScheduleVO(helper_id, startTimeDouble, endTimeDouble, day);
			
			schedule_service.updateSchedule(s_vo);

		} else {
			startTimeInt = Integer.parseInt(startTime);
			endTimeInt = Integer.parseInt(endTime);
			ScheduleVO s_vo = new ScheduleVO(helper_id, startTimeInt, endTimeInt, day);
			schedule_service.updateSchedule(s_vo);
		}

		String StrDay = "";

		switch (day) {
		case 1:
			StrDay = "Sunday";
			break;
		case 2:
			StrDay = "Monday";
			break;
		case 3:
			StrDay = "Tuesday";
			break;
		case 4:
			StrDay = "Wednesday";
			break;
		case 5:
			StrDay = "Thursday";
			break;
		case 6:
			StrDay = "Friday";
			break;
		case 7:
			StrDay = "Saturday";
			break;
		}

		if (startTime.contains(".5")) {
			startTime = startTime.substring(0, startTime.indexOf(".")) + ":30";
		}else {
			startTime = startTime + ":00";
		}
		
		if (endTime.contains(".5")) {
			endTime = endTime.substring(0, endTime.indexOf(".")) + ":30";
		}else {
			endTime = endTime + ":00";
		}
		
		log.info("day : " + StrDay);
		log.info("start_time : " + startTime);
		log.info("end_time : " + endTime);

		String data = StrDay + "," + startTime + "," + endTime;
		
		return new ResponseEntity<>(data, HttpStatus.OK);
	}
	
	//헬퍼 스케줄 추가
	@GetMapping(value = "/addSchedule/{addDay}/{addStartTime}/{addEndTime}/", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> addSchedule(HttpServletRequest request, @PathVariable("addDay") int day,
			@PathVariable("addStartTime") String startTime, @PathVariable("addEndTime") String endTime) {
		
		log.info("Helper Add Schedule");
		log.info("day : " + day);
		log.info("startTime : " + startTime);
		log.info("endTime : " + endTime);
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		double startTimeDouble = 0.0, endTimeDouble = 0.0;
		int startTimeInt = 0, endTimeInt = 0;
		
		if ((startTime.contains(".") || endTime.contains("."))
				|| (startTime.contains(".") && endTime.contains("."))) {
			startTimeDouble = Double.parseDouble(startTime);
			endTimeDouble = Double.parseDouble(endTime);
			ScheduleVO s_vo = new ScheduleVO(helper_id, startTimeDouble, endTimeDouble, day);
			schedule_service.insertSchedule(s_vo);

		} else {
			startTimeInt = Integer.parseInt(startTime);
			endTimeInt = Integer.parseInt(endTime);
			ScheduleVO s_vo = new ScheduleVO(helper_id, startTimeInt, endTimeInt, day);
			schedule_service.insertSchedule(s_vo);
		}
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//헬퍼 스케줄 삭제
	@DeleteMapping(value = "/removeSchedule/{removeDay}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeSchedule(HttpServletRequest request, @PathVariable("removeDay") int day) {
		
		log.info("Helper Remove Schedule");
		log.info("remove day : " + day);
		
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		HashMap<String, Object> data = new HashMap<>();
		data.put("helper_id", helper_id);
		data.put("avail_day", day);
		
		schedule_service.deleteSchedule(data);
		
		String StrDay = "";

		switch (day) {
		case 1:
			StrDay = "Sunday";
			break;
		case 2:
			StrDay = "Monday";
			break;
		case 3:
			StrDay = "Tuesday";
			break;
		case 4:
			StrDay = "Wednesday";
			break;
		case 5:
			StrDay = "Thursday";
			break;
		case 6:
			StrDay = "Friday";
			break;
		case 7:
			StrDay = "Saturday";
			break;
		}
		
		return new ResponseEntity<>(StrDay, HttpStatus.OK);
	}
}
