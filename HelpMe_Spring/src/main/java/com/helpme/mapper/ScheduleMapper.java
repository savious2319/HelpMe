package com.helpme.mapper;

import java.util.HashMap;
import java.util.List;

import com.helpme.domain.ScheduleVO;

public interface ScheduleMapper {
	
	//헬퍼 스케줄 조회
	public List<ScheduleVO> getSchedule(String helper_id);

	//헬퍼 스케줄 수정
	public int updateSchedule(ScheduleVO s_vo);

	//헬퍼 스케줄 추가
	public void insertSchedule(ScheduleVO s_vo);

	//헬퍼 스케줄 삭제
	public int deleteSchedule(HashMap<String, Object> data);
}
