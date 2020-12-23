package com.helpme.app.reservation.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.helpme.app.reservation.vo.ReservationVO;
import com.helpme.mybatis.config.SqlMapConfig;

public class ReservationDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public ReservationDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	//헬퍼 아이디로 예약 정보 가져오기
	public List<ReservationVO> getReservationByHelperId(String helper_id){
		
		return sqlsession.selectList("Reservation.getReservationByHelperId", helper_id);
	}
	
	//고객 번호로 예약 정보 가져오기
	public List<ReservationVO> getReservationByClientNo(int client_no){
		
		return sqlsession.selectList("Reservation.getReservationByClientNo", client_no);
	}
	
	//고객 번호와 헬퍼 아이디로 예약번호 가져오기
	public int getResNo(int client_no, String helper_id) {
		HashMap<String, Object> data = new HashMap<>();
		
		data.put("client_no", client_no);
		data.put("helper_id", helper_id);
		
		return sqlsession.selectOne("Reservation.getResNo", data);
	}
	
	//몇개의 예약이 있는지 가져오기
	public int getReservationCount(int client_no) {
		
		return (Integer)sqlsession.selectOne("Reservation.getReservationCount", client_no);
	}
	
	//예약 삽입
	public void insertReservation(ReservationVO r_vo) {
		sqlsession.insert("Reservation.insertReservation", r_vo);
	}
	
	//Res no으로 예약 삭제
	public void deleteReservationByResNo(int res_no) {
		sqlsession.delete("Reservation.deleteReservationByResNo", res_no);
	}
	
	
}
