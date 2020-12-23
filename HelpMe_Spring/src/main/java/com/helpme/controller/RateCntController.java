package com.helpme.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.helpme.domain.ClientVO;
import com.helpme.service.ClientService;
import com.helpme.service.HelperService;
import com.helpme.service.RatingCntService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/")
@RestController
@AllArgsConstructor
@Log4j
public class RateCntController {

	private HelperService helper_service;
	private ClientService client_service;
	private RatingCntService rate_service;
	
	//헬퍼 점수 주기
	@GetMapping(value = "/updateRateCnt/{rating}/{helperId}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> updateRateCnt(HttpServletRequest request, @PathVariable("rating") int rating,
			@PathVariable("helperId") String helperId) {

		log.info("rating : " + rating);
		log.info("helperId : " + helperId);

		String client_id = (String) request.getSession().getAttribute("session_id");
		log.info("client_id : " + client_id);
		String check = "";
		int client_no = 0;

		// 고객 아이디로 고객 번호 가져오기
		for (ClientVO c_vo : client_service.getDetailById(client_id)) {
			client_no = c_vo.getClientNo();
		}
		
		log.info("client_no : " + client_no);
		
		HashMap<String, Object> cntUpdate = new HashMap<>();
		cntUpdate.put("rating", rating);
		cntUpdate.put("helper_id", helperId);

		HashMap<String, Object> rateCnt = new HashMap<>();
		rateCnt.put("helper_id", helperId);
		rateCnt.put("client_no", client_no);

		// 만약 고객이 해당 헬퍼를 이미 한번 평가했다면 1이 리턴된다
		if ((Integer) rate_service.getCnt(rateCnt) == 1) {
			log.info((Integer) rate_service.getCnt(rateCnt));
			check = "not-ok";

			// 만약 1이 리턴되지않았다면 아직 해당 헬퍼를 평가하지 않았다
		} else {

			// 고객이 헬퍼 한명씩만 평점을 매길 수 있도록 카운트를 등록한다
			rate_service.updateCnt(rateCnt);

			// 평가 매긴 횟수와 총 점수를 업데이트한다
			helper_service.updateRating1(cntUpdate);

			// 평점 구해서 업데이트한다
			helper_service.updateRating2(helperId);

			check = "ok";

		}

		return new ResponseEntity<>(check, HttpStatus.OK);
	}
}
