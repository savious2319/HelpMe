package com.helpme.service;

import java.util.HashMap;
import java.util.List;

import com.helpme.domain.ReservationVO;

public interface ReservationService {

	public List<ReservationVO> getReservationByHelperId(String helper_id);

	public List<ReservationVO> getReservationByClientNo(int client_no);

	public int getResNo(HashMap<String, Object> data);

	public int getReservationCount(int client_no);

	public void insertReservation(ReservationVO r_vo);

	public int deleteReservationByResNo(int res_no);
}
