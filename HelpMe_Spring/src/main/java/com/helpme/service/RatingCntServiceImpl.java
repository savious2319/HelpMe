package com.helpme.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helpme.mapper.RatingCntMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service	// 서비스 객체임을 표시
@AllArgsConstructor	// 모든 파라미터를 이용하는 생성자를 선언
public class RatingCntServiceImpl implements RatingCntService {

	@Setter(onMethod_= @Autowired)
	private RatingCntMapper mapper;
	
	@Override
	public Object getCnt(HashMap<String, Object> data) {
		log.info("getCnt : " + data);
		return mapper.getCnt(data);
	}

	@Override
	public void insertCnt(HashMap<String, Object> data) {
		log.info("getCnt : " + data);
		mapper.insertCnt(data);
	}

	@Override
	public int updateCnt(HashMap<String, Object> data) {
		log.info("updateCnt : " + data);
		return mapper.updateCnt(data);
	}

}
