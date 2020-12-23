package com.helpme.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helpme.domain.ReservationVO;
import com.helpme.mapper.ReservationMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service	// 서비스 객체임을 표시
@AllArgsConstructor	// 모든 파라미터를 이용하는 생성자를 선언
public class ReservationServiceImpl implements ReservationService {

	@Setter(onMethod_= @Autowired)
	private ReservationMapper mapper;
	
	@Override
	public List<ReservationVO> getReservationByHelperId(String helper_id) {
		log.info("getReservationByHelperId : " + helper_id);
		return mapper.getReservationByHelperId(helper_id);
	}

	@Override
	public List<ReservationVO> getReservationByClientNo(int client_no) {
		log.info("getReservationByClientNo : " + client_no);
		return mapper.getReservationByClientNo(client_no);
	}

	@Override
	public int getResNo(HashMap<String, Object> data) {
		log.info("getResNo : " + data);
		return mapper.getResNo(data);
	}

	@Override
	public int getReservationCount(int client_no) {
		log.info("getReservationCount : " + client_no);
		return mapper.getReservationCount(client_no);
	}

	@Override
	public void insertReservation(ReservationVO r_vo) {
		log.info("insertReservation : " + r_vo);
		mapper.insertReservation(r_vo);

	}

	@Override
	public int deleteReservationByResNo(int res_no) {
		log.info("deleteReservation : " + res_no);
		return mapper.deleteReservationByResNo(res_no);
	}

}
