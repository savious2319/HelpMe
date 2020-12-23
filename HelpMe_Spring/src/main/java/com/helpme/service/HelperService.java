package com.helpme.service;

import java.util.HashMap;
import java.util.List;

import com.helpme.domain.HelperVO;
import com.helpme.domain.Helper_CertificateVO;
import com.helpme.domain.Helper_EducationVO;
import com.helpme.domain.Helper_LanguagesVO;
import com.helpme.domain.Helper_PicsVO;
import com.helpme.domain.Helper_SpecialtyVO;
import com.helpme.domain.Helper_WorkVO;

public interface HelperService {
	
	public String login(HashMap<String, String> data);
	
	public boolean checkId(String id);

	public String getName(String helper_id);

	public String getId(String helper_name);

	public int getFare(String helper_id);

	public List<HelperVO> getDetail(String helper_id);

	public int updatePassword(HashMap<String, String> data);

	public int updateDescription(HashMap<String, String> data);

	public List<Helper_LanguagesVO> getLanguages(String helper_id);

	public void insertLanguage(Helper_LanguagesVO hl_vo);

	public int deleteLanguage(HashMap<String, String> data);

	public List<Helper_SpecialtyVO> getSpecialty(String helper_id);

	public int deleteSpecialty(HashMap<String, String> data);

	public void insertSpecialty(Helper_SpecialtyVO hs_vo);

	public List<Helper_EducationVO> getEducation(String helper_id);

	public void insertEducation(Helper_EducationVO he_vo);

	public int deleteEducation(HashMap<String, String> data);

	public List<Helper_WorkVO> getWork(String helper_id);

	public void insertWork(Helper_WorkVO hw_vo);

	public int deleteWork(HashMap<String, String> data);

	public List<Helper_CertificateVO> getCertificate(String helper_id);

	public void insertCertificate(Helper_CertificateVO hc_vo);

	public int deleteCertificate(HashMap<String, String> data);

	public int updateRating1(HashMap<String, Object> data);

	public int updateRating2(String helper_id);

	public List<Helper_PicsVO> getPics(String helper_id);

	public int updateMainPic(HashMap<String, String> data);
	
	public int updatePic1(HashMap<String, String> data);
	
	public int updatePic2(HashMap<String, String> data);
	
	public int updatePic3(HashMap<String, String> data);
	
	public int updatePic4(HashMap<String, String> data);
	
	public int updatePic5(HashMap<String, String> data);
}
