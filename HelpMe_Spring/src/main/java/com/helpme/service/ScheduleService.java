package com.helpme.service;

import java.util.HashMap;
import java.util.List;

import com.helpme.domain.ScheduleVO;

public interface ScheduleService {
	
	public List<ScheduleVO> getSchedule(String helper_id);

	public int updateSchedule(ScheduleVO s_vo);

	public void insertSchedule(ScheduleVO s_vo);

	public int deleteSchedule(HashMap<String, Object> data);
}
