package com.helpme.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.helpme.domain.Helper_CertificateVO;
import com.helpme.domain.Helper_EducationVO;
import com.helpme.domain.Helper_LanguagesVO;
import com.helpme.domain.Helper_SpecialtyVO;
import com.helpme.domain.Helper_WorkVO;
import com.helpme.service.HelperService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/helper/")
@RestController
@Log4j
public class HelperController {

	@Setter(onMethod_ = @Autowired)
	private HelperService helper_service;

	//헬퍼 로그인
	@GetMapping(value = "/login/{helperId}/{helperPassword}/{loginAs}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> login(HttpServletRequest request, @PathVariable("helperId") String helperId,
			@PathVariable("helperPassword") String helperPassword, @PathVariable("loginAs") String loginAs) {

		HttpSession session = request.getSession();

		log.info("request : " + request);
		log.info("helperId : " + helperId);
		log.info("helperPassword : " + helperPassword);
		log.info("loginAs : " + loginAs);

		HashMap<String, String> data = new HashMap<>();
		data.put("helper_id", helperId);
		data.put("helper_password", helperPassword);

		String session_id = helper_service.login(data);

		if (session_id != null) {
			//로그인 성공 시 세션에 아이디를 저장한다
			log.info("session_id : " + session_id);
			session.setAttribute("session_id", session_id);
		} else {
			//로그인 실패 시 전송하는 메세지
			loginAs = "false";
		}

		return new ResponseEntity<>(loginAs, HttpStatus.OK);
	}

	//헬퍼 언어, 서비스 업데이트
	////브라우저에서 JSON 타입으로 데이터를 전송하고 Rest컨트롤러에서는 @RequestBody HashMap으로 받는다
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/aboutUpdates", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> aboutUpdates(HttpServletRequest request, @RequestBody HashMap<String, String> data) {

		Helper_LanguagesVO hl_vo = new Helper_LanguagesVO();
		Helper_SpecialtyVO hs_vo = new Helper_SpecialtyVO();

		String helper_id = (String) request.getSession().getAttribute("session_id");
		hl_vo.setHelperId(helper_id);
		hs_vo.setHelperId(helper_id);

		for (String key : data.keySet()) {

			//전송된 언어레벨이 있다면 그 값을 setter()에 넣는다
			if (key.equals("level") && data.get(key) != null) {
				hl_vo.setLevel(data.get(key));
				//전송된 언어가 있다면 그 값을 setter()에 넣는다
			} else if (key.equals("language") && data.get(key) != null) {
				hl_vo.setLanguage(data.get(key));
				//전송된 서비스가 있다면 그 값을 setter()에 넣는다
			} else if (key.equals("specializedField") && data.get(key) != null) {
				hs_vo.setSpecializedField(data.get(key));
			}

		}

		log.info("Data : " + data);
		log.info("Helper Languages : " + hl_vo);
		log.info("Helper Specialties : " + hs_vo);

		//변경된 언어가 있다면 DB에서 업데이트함
		if (hl_vo.getLanguage() != null) {
			helper_service.insertLanguage(hl_vo);
		}

		//변경된 서비스가 있다면 DB에서 업데이트함
		if (hs_vo.getSpecializedField() != null) {
			helper_service.insertSpecialty(hs_vo);
		}

		return new ResponseEntity<>("success", HttpStatus.OK);

	}

	//헬퍼 언어 삭제
	@DeleteMapping(value = "/deleteLanguage/{language}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteLanguage(HttpServletRequest request,
			@PathVariable("language") String language) {
		log.info("deleteLanguage : " + language);

		String helper_id = (String) request.getSession().getAttribute("session_id");
		HashMap<String, String> data = new HashMap<>();
		data.put("helper_id", helper_id);
		data.put("language", language);

		int result = helper_service.deleteLanguage(data);

		return result == 1 ? new ResponseEntity<>(language, HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	//헬퍼 서비스 삭제
	@DeleteMapping(value = "/deleteService/{service}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteService(HttpServletRequest request, @PathVariable("service") String service) {
		log.info("deleteService : " + service);

		String helper_id = (String) request.getSession().getAttribute("session_id");
		HashMap<String, String> data = new HashMap<>();
		data.put("helper_id", helper_id);
		data.put("service", service);

		int result = helper_service.deleteSpecialty(data);

		return result == 1 ? new ResponseEntity<>(service, HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	//헬퍼 사진 변경
	@PostMapping(value = "/changePhoto", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> changePhoto(HttpServletRequest request, @RequestParam("picId") String picId, 
			@RequestParam("picSrc") String picSrc, MultipartHttpServletRequest multi) {

		String helper_id = (String) request.getSession().getAttribute("session_id");

		log.info("picId : " + picId); // pic1
		log.info("picSrc : " + picSrc); // /helpme/resources/images/sky/add_picture.png

		String saveFolder = "C:\\GB_0900_07_BSM\\Spring\\workspace\\HelpMe_BSM\\src\\main\\webapp\\resources\\images\\"
				+ helper_id;
		String deleteFolder = "C:\\GB_0900_07_BSM\\Spring\\workspace\\HelpMe_BSM\\src\\main\\webapp\\resources\\images\\";
//		String saveFolder = "D:\\GB_0900_07_BSM\\Spring\\workspace\\HelpMe_BSM\\src\\main\\webapp\resources\\images\\" + helper_id;
//		String deleteFolder = "D:\\GB_0900_07_BSM\\JSP\\workspace\\HelpMe_final\\WebContent\\images";

//		String saveFolder = "/usr/local/apache-tomcat-8.5.59/webapps/ROOT/images/"+helper_id;
//		String deleteFolder = "/usr/local/apache-tomcat-8.5.59/webapps/ROOT"; 

		Iterator<String> iterator = multi.getFileNames();

		// 스프링에서 쓰는 파일업로드 인터페이스
		MultipartFile multipartFile = null;

		String savedName = "";
		File file = null;

		while (iterator.hasNext()) {

			multipartFile = multi.getFile(iterator.next());
			if (!multipartFile.isEmpty()) {

				// 업로드 한 파일의 실제 이름을 구한다.
				String originalFileName = multipartFile.getOriginalFilename();

				savedName = changeFileName(originalFileName);

				log.info("savedName : " + savedName);

				file = new File(saveFolder + "\\" + savedName);

				try {
					// 업로드 한 파일 데이터를 지정한 경로에 저장한다.
					multipartFile.transferTo(file);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		// /helpme/resources/images/sky/add_picture.png
		picSrc = picSrc.substring(25);

		// String emptyPicSrc = picSrc.substring(picSrc.indexOf("/"),
		// picSrc.indexOf(picSrc.length()));

		if (!picSrc.contains("add_picture.png")) {
			File f = new File(deleteFolder + picSrc);
			log.info("deleteFolder : " + deleteFolder);
			log.info("picSrc : " + picSrc);
			log.info("deleteFolder : " + deleteFolder + "\\" + picSrc);

			log.info("f : " + f.getName());
			if (f.exists()) {
				f.delete();
				log.info("파일 삭제성공");
			}
		}

		// images/helperid/fileName
		savedName = "images/" + helper_id + "/" + savedName;
		log.info("DB savedName : " + savedName);

		HashMap<String, String> data = new HashMap<>();
		data.put("helper_id", helper_id);
		data.put("fileName", savedName);

		switch (picId) {
		case "main_pic":
			helper_service.updateMainPic(data);
			break;
		case "pic1":
			helper_service.updatePic1(data);
			break;
		case "pic2":
			helper_service.updatePic2(data);
			break;
		case "pic3":
			helper_service.updatePic3(data);
			break;
		case "pic4":
			helper_service.updatePic4(data);
			break;
		case "pic5":
			helper_service.updatePic5(data);
			break;
		}

		String picData = picId + "," + savedName;

		log.info("picData : " + picData);

		return new ResponseEntity<>(picData, HttpStatus.OK);

	}

	//업로드하는 파일이름 중복되지 않게 하기 위한 메소드
	public String changeFileName(String originalFileName) {
		UUID uuid = UUID.randomUUID();

		String savedName = uuid.toString() + "_" + originalFileName;

		return savedName;
	}

	//헬퍼 사진 삭제
	@DeleteMapping(value = "/deletePhoto", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deletePhoto(HttpServletRequest request, @RequestParam("picId") String picId,
			@RequestParam("picSrc") String picSrc, @RequestParam("emptyPic") String emptyPic) {

		log.info("picId : " + picId);
		log.info("picSrc : " + picSrc);
		log.info("emptyPic : " + emptyPic);

		String helper_id = (String) request.getSession().getAttribute("session_id");

		String deleteFolder = "C:\\GB_0900_07_BSM\\Spring\\workspace\\HelpMe_BSM\\src\\main\\webapp\\resources\\images\\";
		// String deleteFolder =
		// "D:\\GB_0900_07_BSM\\Spring\\workspace\\HelpMe_BSM\\src\\main\\webapp\\resources\\images\\";

		// 삭제될 사진파일의 서버 경로
		// String deleteFolder = "/usr/local/apache-tomcat-8.5.59/webapps/ROOT";

		// /HelpMe_BSM/images/KakaoTalk_Photo_2020-11-14-00-00-52.jpeg
		// images/add_picture.png

		// 해당 헬퍼 DB에 저장할 emptyPic 가공하는 작업
		String[] emptyPicSplit = emptyPic.split("/");
		emptyPic = emptyPicSplit[0] + "/" + helper_id + "/" + emptyPicSplit[1];

		log.info("emptyPicSplit : " + emptyPic);

		picSrc = picSrc.substring(25);

		log.info("picSrc : " + picSrc);

		HashMap<String, String> data = new HashMap<>();
		data.put("helper_id", helper_id);
		data.put("fileName", emptyPic);

		// switch문을 통해 해당 DB의 emptyPic으로 변경하기
		switch (picId) {
		case "pic1":
			helper_service.updatePic1(data);
			break;
		case "pic2":
			helper_service.updatePic2(data);
			break;
		case "pic3":
			helper_service.updatePic3(data);
			break;
		case "pic4":
			helper_service.updatePic4(data);
			break;
		case "pic5":
			helper_service.updatePic5(data);
			break;
		}

		// 삭제할 사진파일을 제거한다
		File f = new File(deleteFolder + picSrc);
		if (f.exists()) {
			f.delete();
			log.info("삭제 성공");
		}

		// data에 ajax로 전송할 <img> id값과 파일이름을 저장한다
		String picData = picId + "," + emptyPic;

		return new ResponseEntity<>(picData, HttpStatus.OK);

	}

	//헬퍼 메인사진으로 변경
	@GetMapping(value = "/setMainPhoto", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> setMainPhoto(HttpServletRequest request, @RequestParam("picId") String picId,
			@RequestParam("picSrc") String picSrc, @RequestParam("mainSrc") String mainSrc) {
		log.info("picId : " + picId);
		log.info("picSrc : " + picSrc);
		log.info("mainSrc : " + mainSrc);

		String helper_id = (String) request.getSession().getAttribute("session_id");

		// mainSrc : /images/sky/sky1.jpg
		// picSrc : /images/sky/KakaoTalk_20201113_1425041571.jpg

		// 앞에 / 잘라내기
		picSrc = picSrc.substring(18);
		mainSrc = mainSrc.substring(18);

		log.info("picSrc substring: " + picSrc);
		log.info("mainSrc substring: " + mainSrc);

		HashMap<String, String> updateMainPic = new HashMap<>();
		updateMainPic.put("helper_id", helper_id);
		updateMainPic.put("fileName", picSrc);

		// 선택한 사진을 메인 사진으로 업데이트하기
		helper_service.updateMainPic(updateMainPic);

		HashMap<String, String> updatePic = new HashMap<>();
		updatePic.put("helper_id", helper_id);
		updatePic.put("fileName", mainSrc);

		// 선택한 사진이 있는 <img>에 메인 사진파일 경로 저장하기
		switch (picId) {
		case "pic1":
			helper_service.updatePic1(updatePic);
			break;
		case "pic2":
			helper_service.updatePic2(updatePic);
			break;
		case "pic3":
			helper_service.updatePic3(updatePic);
			break;
		case "pic4":
			helper_service.updatePic4(updatePic);
			break;
		case "pic5":
			helper_service.updatePic5(updatePic);
			break;
		}

		// data에 ajax로 전송할 <img> id값, 메인 사진으로 바꿀 파일이름, 메인 파일이름을 저장한다
		String data = picId + "," + picSrc + "," + mainSrc;

		return new ResponseEntity<>(data, HttpStatus.OK);
	}

	//헬퍼 소개 수정
	@PostMapping(value = "/updateDescription", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> updateDescription(HttpServletRequest request, @RequestParam("title") String title,
			@RequestParam("content") String content) {

		String helper_id = (String) request.getSession().getAttribute("session_id");

		HashMap<String, String> data = new HashMap<>();
		data.put("helper_id", helper_id);
		data.put("title", title);
		data.put("content", content);

		// 소개글 제목, 소개글 업데이트 하기
		helper_service.updateDescription(data);

		return new ResponseEntity<>(HttpStatus.OK);
	}

	//헬퍼 이력 수정
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/updateBackground/{datepicker}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> updateBackground(HttpServletRequest request,
			@RequestBody HashMap<String, String> data, @PathVariable("datepicker") String obtainedDate) {
		
		log.info("updateBackground");
		log.info("datepicker : " + obtainedDate);
		Helper_EducationVO he_vo = new Helper_EducationVO();
		Helper_WorkVO hw_vo = new Helper_WorkVO();
		Helper_CertificateVO hc_vo = new Helper_CertificateVO();

		if (!obtainedDate.equals("empty")) {
			// 예약 날짜를 가공하는 작업
			String[] calendar = obtainedDate.split(" ");
			String month = "";

			switch (calendar[1]) {
			case "Jan":
				month = "01";
				break;
			case "Feb":
				month = "02";
				break;
			case "Mar":
				month = "03";
				break;
			case "Apr":
				month = "04";
				break;
			case "May":
				month = "05";
				break;
			case "Jun":
				month = "06";
				break;
			case "Jul":
				month = "07";
				break;
			case "Aug":
				month = "08";
				break;
			case "Sep":
				month = "09";
				break;
			case "Oct":
				month = "10";
				break;
			case "Nov":
				month = "11";
				break;
			case "Dec":
				month = "12";
				break;
			}

			String date = calendar[3] + "/" + month + "/" + calendar[2];

			log.info("date : " + date);
			
			hc_vo.setDateObtained(date);
		}
		

		String helper_id = (String) request.getSession().getAttribute("session_id");
		he_vo.setHelperId(helper_id);
		hw_vo.setHelperId(helper_id);
		hc_vo.setHelperId(helper_id);

		for (String key : data.keySet()) {

			if (key.equals("school") && data.get(key) != null) {
				log.info("school : " + data.get(key));
				he_vo.setEducation(data.get(key));
			} else if (key.equals("gradYear")) {
				log.info("gradYear : " + data.get(key));
				he_vo.setGraduateYear(Integer.parseInt(data.get(key)));
			} else if (key.equals("work") && data.get(key) != null) {
				log.info("work : " + data.get(key));
				hw_vo.setWorkExperience(data.get(key));
			} else if (key.equals("startYear")) {
				log.info("startYear : " + data.get(key));
				hw_vo.setWorkStartyear(Integer.parseInt(data.get(key)));
			} else if (key.equals("endYear")) {
				log.info("endYear : " + data.get(key));
				hw_vo.setWorkEndyear(Integer.parseInt(data.get(key)));
			} else if (key.equals("license") && data.get(key) != null) {
				log.info("license : " + data.get(key));
				hc_vo.setCertificate(data.get(key));
			}

		}

		log.info("Helper Education : " + he_vo);
		log.info("Helper Work : " + hw_vo);
		log.info("Helper Certificate : " + hc_vo);

		if (he_vo.getEducation() != null) {
			helper_service.insertEducation(he_vo);
		}

		if (hw_vo.getWorkExperience() != null) {
			helper_service.insertWork(hw_vo);
		}

		if (hc_vo.getCertificate() != null) {
			helper_service.insertCertificate(hc_vo);
		}

		return new ResponseEntity<>("success", HttpStatus.OK);

	}

	//헬퍼 학력 삭제
	@DeleteMapping(value = "/deleteEducation/{school}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteEducation(HttpServletRequest request, @PathVariable("school") String school) {
		log.info("deleteEducation : " + school);

		String helper_id = (String) request.getSession().getAttribute("session_id");
		HashMap<String, String> data = new HashMap<>();
		data.put("helper_id", helper_id);
		data.put("education", school);

		int result = helper_service.deleteEducation(data);

		return result >= 1 ? new ResponseEntity<>(school, HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	//헬퍼 경력 삭제
	@DeleteMapping(value = "/deleteWork/{work}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteWork(HttpServletRequest request, @PathVariable("work") String work) {
		log.info("deleteWork : " + work);

		String helper_id = (String) request.getSession().getAttribute("session_id");
		HashMap<String, String> data = new HashMap<>();
		data.put("helper_id", helper_id);
		data.put("work", work);

		int result = helper_service.deleteWork(data);

		return result >= 1 ? new ResponseEntity<>(work, HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	//헬퍼 자격증 삭제
	@DeleteMapping(value = "/deleteCertificate/{license}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> deleteCertificate(HttpServletRequest request,
			@PathVariable("license") String license) {
		log.info("deleteCertificate : " + license);

		String helper_id = (String) request.getSession().getAttribute("session_id");
		HashMap<String, String> data = new HashMap<>();
		data.put("helper_id", helper_id);
		data.put("certificate", license);

		int result = helper_service.deleteCertificate(data);

		log.info("result : " + result);

		return result >= 1 ? new ResponseEntity<>(license, HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	//헬퍼 비밀변호 수정
	@PutMapping(value = "/updatePassword/{password}", produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> updatePassword(HttpServletRequest request, @PathVariable("password") String pw) {
		
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		HashMap<String, String > data = new HashMap<>();
		data.put("helper_id", helper_id);
		data.put("password", pw);
		
		helper_service.updatePassword(data);
		
		
		return new ResponseEntity<>(helper_id, HttpStatus.OK);

	}
}
