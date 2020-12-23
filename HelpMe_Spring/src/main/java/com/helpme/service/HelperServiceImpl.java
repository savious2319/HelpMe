package com.helpme.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helpme.domain.HelperVO;
import com.helpme.domain.Helper_CertificateVO;
import com.helpme.domain.Helper_EducationVO;
import com.helpme.domain.Helper_LanguagesVO;
import com.helpme.domain.Helper_PicsVO;
import com.helpme.domain.Helper_SpecialtyVO;
import com.helpme.domain.Helper_WorkVO;
import com.helpme.mapper.HelperMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service	// 서비스 객체임을 표시
@AllArgsConstructor	// 모든 파라미터를 이용하는 생성자를 선언
public class HelperServiceImpl implements HelperService {

	@Setter(onMethod_= @Autowired)
	private HelperMapper mapper;
	
	@Override
	public String login(HashMap<String, String> data) {
		log.info("login : " + data);
		return mapper.login(data);
	}

	@Override
	public boolean checkId(String id) {
		log.info("checkId : " + id);
		if(mapper.checkId(id) == 1) {
            return true;
         }
         return false;
	}
	
	@Override
	public String getName(String helper_id) {
		log.info("getName : " + helper_id);
		return mapper.getName(helper_id);
	}

	@Override
	public String getId(String helper_name) {
		log.info("getId : " + helper_name);
		return mapper.getId(helper_name);
	}

	@Override
	public int getFare(String helper_id) {
		log.info("getFare : " + helper_id);
		return mapper.getFare(helper_id);
	}

	@Override
	public List<HelperVO> getDetail(String helper_id) {
		log.info("getDetail : " + helper_id);
		return mapper.getDetail(helper_id);
	}

	@Override
	public int updatePassword(HashMap<String, String> data) {
		log.info("updatePassword : " + data);
		return mapper.updatePassword(data);
	}

	@Override
	public int updateDescription(HashMap<String, String> data) {
		log.info("updateDescription : " + data);
		return mapper.updateDescription(data);
	}

	@Override
	public List<Helper_LanguagesVO> getLanguages(String helper_id) {
		log.info("getLanguages : " + helper_id);
		return mapper.getLanguages(helper_id);
	}

	@Override
	public void insertLanguage(Helper_LanguagesVO hl_vo) {
		log.info("insertLanguage : " + hl_vo);
		mapper.insertLanguage(hl_vo);
	}

	@Override
	public int deleteLanguage(HashMap<String, String> data) {
		log.info("deleteLanguage : " + data);
		return mapper.deleteLanguage(data);
	}

	@Override
	public List<Helper_SpecialtyVO> getSpecialty(String helper_id) {
		log.info("getSepcialty : " + helper_id);
		return mapper.getSpecialty(helper_id);
	}

	@Override
	public int deleteSpecialty(HashMap<String, String> data) {
		log.info("deleteSpecialty : " + data);
		return mapper.deleteSpecialty(data);
	}

	@Override
	public void insertSpecialty(Helper_SpecialtyVO hs_vo) {
		log.info("insertSpecialty : " + hs_vo);
		mapper.insertSpecialty(hs_vo);

	}

	@Override
	public List<Helper_EducationVO> getEducation(String helper_id) {
		log.info("getEducation : " + helper_id);
		return mapper.getEducation(helper_id);
	}

	@Override
	public void insertEducation(Helper_EducationVO he_vo) {
		log.info("getEducation : " + he_vo);
		mapper.insertEducation(he_vo);
	}

	@Override
	public int deleteEducation(HashMap<String, String> data) {
		log.info("deleteEducation : " + data);
		return mapper.deleteEducation(data);
	}

	@Override
	public List<Helper_WorkVO> getWork(String helper_id) {
		log.info("getWork : " + helper_id);
		return mapper.getWork(helper_id);
	}

	@Override
	public void insertWork(Helper_WorkVO hw_vo) {
		log.info("insertWork : " + hw_vo);
		mapper.insertWork(hw_vo);
	}

	@Override
	public int deleteWork(HashMap<String, String> data) {
		log.info("deleteWork : " + data);
		return mapper.deleteWork(data);
	}

	@Override
	public List<Helper_CertificateVO> getCertificate(String helper_id) {
		log.info("getCertificate : " + helper_id);
		return mapper.getCertificate(helper_id);
	}

	@Override
	public void insertCertificate(Helper_CertificateVO hc_vo) {
		log.info("insertCertificate : " + hc_vo);
		mapper.insertCertificate(hc_vo);
	}

	@Override
	public int deleteCertificate(HashMap<String, String> data) {
		log.info("deleteCertificate : " + data);
		return mapper.deleteCertificate(data);
	}

	@Override
	public int updateRating1(HashMap<String, Object> data) {
		log.info("updateRating1 : " + data);
		return mapper.updateRating1(data);
	}

	@Override
	public int updateRating2(String helper_id) {
		log.info("updateRating2 : " + helper_id);
		return mapper.updateRating2(helper_id);
	}

	@Override
	public List<Helper_PicsVO> getPics(String helper_id) {
		log.info("getPics : " + helper_id);
		return mapper.getPics(helper_id);
	}

	@Override
	public int updateMainPic(HashMap<String, String> data) {
		log.info("updateMainPic : " + data);
		return mapper.updateMainPic(data);
	}

	@Override
	public int updatePic1(HashMap<String, String> data) {
		log.info("updatePic1 : " + data);
		return mapper.updatePic1(data);
	}

	@Override
	public int updatePic2(HashMap<String, String> data) {
		log.info("updatePic2 : " + data);
		return mapper.updatePic2(data);
	}

	@Override
	public int updatePic3(HashMap<String, String> data) {
		log.info("updatePic3 : " + data);
		return mapper.updatePic3(data);
	}

	@Override
	public int updatePic4(HashMap<String, String> data) {
		log.info("updatePic4 : " + data);
		return mapper.updatePic4(data);
	}

	@Override
	public int updatePic5(HashMap<String, String> data) {
		log.info("updatePic5 : " + data);
		return mapper.updatePic5(data);
	}

}
