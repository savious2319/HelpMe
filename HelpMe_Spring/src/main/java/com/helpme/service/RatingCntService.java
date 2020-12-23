package com.helpme.service;

import java.util.HashMap;

public interface RatingCntService {
	
	public Object getCnt(HashMap<String, Object> data);
	
	public void insertCnt(HashMap<String, Object> data);

	public int updateCnt(HashMap<String, Object> data);
}
