package com.helpme.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helpme.domain.ScheduleVO;
import com.helpme.mapper.ScheduleMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service	// 서비스 객체임을 표시
@AllArgsConstructor	// 모든 파라미터를 이용하는 생성자를 선언
public class ScheduleServiceImpl implements ScheduleService {

	@Setter(onMethod_= @Autowired)
	private ScheduleMapper mapper;
	
	@Override
	public List<ScheduleVO> getSchedule(String helper_id) {
		log.info("getSchedule : " + helper_id );
		return mapper.getSchedule(helper_id);
	}

	@Override
	public int updateSchedule(ScheduleVO s_vo) {
		log.info("updateSchedule : " + s_vo);
		return mapper.updateSchedule(s_vo);
	}

	@Override
	public void insertSchedule(ScheduleVO s_vo) {
		log.info("insertSchedule : " + s_vo);
		mapper.insertSchedule(s_vo);
	}

	@Override
	public int deleteSchedule(HashMap<String, Object> data) {
		log.info("deleteSchedule : " + data);
		return mapper.deleteSchedule(data);
	}

}
