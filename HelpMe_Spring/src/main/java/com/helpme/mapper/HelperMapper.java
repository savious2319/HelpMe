package com.helpme.mapper;

import java.util.HashMap;
import java.util.List;

import com.helpme.domain.HelperVO;
import com.helpme.domain.Helper_CertificateVO;
import com.helpme.domain.Helper_EducationVO;
import com.helpme.domain.Helper_LanguagesVO;
import com.helpme.domain.Helper_PicsVO;
import com.helpme.domain.Helper_SpecialtyVO;
import com.helpme.domain.Helper_WorkVO;

public interface HelperMapper {
	
	//헬퍼 로그인
	public String login(HashMap<String, String> data);

	//고객이 회원가입 시 아디이가 헬퍼 아이디와 중복 되지 않기 위해 검사하는 메소드
	public int checkId(String id);
	
	//헬퍼 이름 조회
	public String getName(String helper_id);

	//헬퍼 아이디 조회
	public String getId(String helper_name);

	//헬퍼 요금 조회
	public int getFare(String helper_id);

	//헬퍼 아이디로 모든 정보 조회
	public List<HelperVO> getDetail(String helper_id);

	//헬퍼 비밀번호 수정
	public int updatePassword(HashMap<String, String> data);

	//헬퍼 소개 수정
	public int updateDescription(HashMap<String, String> data);

	//헬퍼 언어 조회
	public List<Helper_LanguagesVO> getLanguages(String helper_id);

	//헬퍼 언어 추가
	public void insertLanguage(Helper_LanguagesVO hl_vo);

	//헬퍼 언어 삭제
	public int deleteLanguage(HashMap<String, String> data);

	//헬퍼 서비스 조회
	public List<Helper_SpecialtyVO> getSpecialty(String helper_id);

	//헬퍼 서비스 삭제
	public int deleteSpecialty(HashMap<String, String> data);

	//헬퍼 서비스 추가
	public void insertSpecialty(Helper_SpecialtyVO hs_vo);

	//헬퍼 학력 조회
	public List<Helper_EducationVO> getEducation(String helper_id);

	//헬퍼 학력 추가
	public void insertEducation(Helper_EducationVO he_vo);

	//헬퍼 학력 삭제
	public int deleteEducation(HashMap<String, String> data);

	//헬퍼 이력 조회
	public List<Helper_WorkVO> getWork(String helper_id);

	//헬퍼 이력 추가
	public void insertWork(Helper_WorkVO hw_vo);

	//헬퍼 이력 삭제
	public int deleteWork(HashMap<String, String> data);

	//헬퍼 자격증 조회
	public List<Helper_CertificateVO> getCertificate(String helper_id);

	//헬퍼 자격증 추가
	public void insertCertificate(Helper_CertificateVO hc_vo);

	//헬퍼 자격증 삭제
	public int deleteCertificate(HashMap<String, String> data);

	//헬퍼 점수 수정
	public int updateRating1(HashMap<String, Object> data);

	//헬퍼 점수 수정
	public int updateRating2(String helper_id);

	//헬퍼 사진 조회
	public List<Helper_PicsVO> getPics(String helper_id);

	//헬퍼 메인사진 수정
	public int updateMainPic(HashMap<String, String> data);
	
	//헬퍼 사진1 수정
	public int updatePic1(HashMap<String, String> data);
	
	//헬퍼 사진2 수정
	public int updatePic2(HashMap<String, String> data);
	
	//헬퍼 사진3 수정
	public int updatePic3(HashMap<String, String> data);
	
	//헬퍼 사진4 수정
	public int updatePic4(HashMap<String, String> data);
	
	//헬퍼 사진5 수정
	public int updatePic5(HashMap<String, String> data);
}