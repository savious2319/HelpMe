package com.helpme.app.schedule.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.helpme.app.schedule.vo.ScheduleVO;
import com.helpme.mybatis.config.SqlMapConfig;

public class ScheduleDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public ScheduleDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	//헬퍼 스케줄 정보 가져오기
	public List<ScheduleVO> getSchedule(String helper_id){
		
		List<ScheduleVO> schedule = sqlsession.selectList("Schedule.getSchedule", helper_id);
		
		return schedule;
	}
	
	//헬퍼 스케줄 수정
	public void updateSchedule(ScheduleVO s_vo) {
		sqlsession.update("Schedule.updateSchedule", s_vo);
	}
	
	//헬퍼 스케줄 추가
	public void insertSchedule(ScheduleVO s_vo) {
		sqlsession.insert("Schedule.insertSchedule", s_vo);
	}
	
	//헬퍼 스케줄 삭제
	public void deleteSchedule(String helper_id, int avail_day) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("helper_id", helper_id);
		data.put("avail_day", avail_day);
		sqlsession.delete("Schedule.deleteSchedule", data);
	}
}
