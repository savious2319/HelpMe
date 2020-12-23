package com.helpme.mapper;

import java.util.HashMap;

public interface RatingCntMapper {
	
	//몇번 고객이 헬퍼의 점수를 주었는지 조회
	public Object getCnt(HashMap<String, Object> data);
	
	//점수 준 횟수 등록
	public void insertCnt(HashMap<String, Object> data);

	//점수 횟수 수정
	public int updateCnt(HashMap<String, Object> data);
}
