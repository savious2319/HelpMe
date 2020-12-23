package com.helpme.mapper;

import java.util.HashMap;
import java.util.List;

import com.helpme.domain.ReservationVO;

public interface ReservationMapper {
	
	//헬퍼 아이디로 모든 예약 정보 조회
	public List<ReservationVO> getReservationByHelperId(String helper_id);

	//고객 번호로 모든 예약 정보 조회
	public List<ReservationVO> getReservationByClientNo(int client_no);

	//예약 번호 조회
	public int getResNo(HashMap<String, Object> data);

	//예약 수 조회
	public int getReservationCount(int client_no);

	//예약 등록
	public void insertReservation(ReservationVO r_vo);

	//예약 삭제
	public int deleteReservationByResNo(int res_no);
}
