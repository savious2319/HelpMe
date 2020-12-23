package com.helpme.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.helpme.domain.Helper_CertificateVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HelperServiceTests {

	@Setter(onMethod_= @Autowired)
	private HelperService service;
	
//	@Test
//	public void getNameTest() {
//		log.info("getNameTest");
//		log.info(service.getName("brian"));
//	}
	
	@Test
	public void backgroundTest() {
		Helper_CertificateVO hc_vo = new Helper_CertificateVO();
		
		service.getCertificate("sky").forEach(hc ->{
			log.info("dateObtained : " + hc.getDateObtained());
			String[]date = hc.getDateObtained().split(" ");
			log.info("dateObtained split : " + date[0]);
			hc_vo.setDateObtained(date[0]);
			log.info(hc);
		});
		
		log.info(hc_vo);
	}
	
}
