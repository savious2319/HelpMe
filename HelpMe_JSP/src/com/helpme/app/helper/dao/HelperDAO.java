package com.helpme.app.helper.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.helpme.app.helper.vo.HelperVO;
import com.helpme.app.helper.vo.Helper_CertificateVO;
import com.helpme.app.helper.vo.Helper_EducationVO;
import com.helpme.app.helper.vo.Helper_LanguagesVO;
import com.helpme.app.helper.vo.Helper_PicsVO;
import com.helpme.app.helper.vo.Helper_SpecialtyVO;
import com.helpme.app.helper.vo.Helper_WorkVO;
import com.helpme.mybatis.config.SqlMapConfig;


public class HelperDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	Double worktime = 0.0;	
	
	ArrayList<Helper_LanguagesVO> languageList;
	
	public HelperDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	//헬퍼 로그인
	public String helperLogin(String id, String pw) {
		HashMap<String, String> data = new HashMap<>();
		
		data.put("helper_id", id);
		data.put("helper_password", pw);
		
		return (String)sqlsession.selectOne("Helper.login", data);
	}
	
	//헬퍼 이름으로 id값 가져오기
	public String getHelperId(String helper_name) {
		
		return (String)sqlsession.selectOne("Helper.getId", helper_name);
	}
	
	// 헬퍼 이름 검색
	public String getHelperName(String helper_id) {
		String helper_name = "";

		helper_name = sqlsession.selectOne("Helper.getName", helper_id);

		return helper_name;
	}
	
	//헬퍼 패스워드 변경
	public void updatePassword(String helper_id, String password) {
		HashMap<String, String> data = new HashMap<>();
		
		data.put("helper_id", helper_id);
		data.put("password", password);
		
		sqlsession.update("Helper.updatePassword", data);
	}

	// 헬퍼 금액 검색
	public int getHelperFare(String helper_id) {
		return sqlsession.selectOne("Helper.getFare", helper_id);
	}

	// 헬퍼 정보 가지고 오기
	public List<HelperVO> getHelperDetailInfo(String helper_id) {
		return sqlsession.selectList("Helper.getDetail", helper_id);
	}

	// 헬퍼 언어

	// 헬퍼 언어 정보 가져오기
	public List<Helper_LanguagesVO> getLanguage(String helper_id) {
		return sqlsession.selectList("Helper.getLanguage", helper_id);
	}

	// 헬퍼 언어 추가
	public void insertLanguage(Helper_LanguagesVO hl_vo) {
		sqlsession.insert("Helper.insertLanguage", hl_vo);
	}

	// 헬퍼 언어 삭제
	public void deleteLanguage(String helper_id, String language) {
		HashMap<String, String> data = new HashMap<>();

		data.put("helper_id", helper_id);
		data.put("language", language);

		sqlsession.delete("Helper.deleteLanguage", data);
	}

	// 헬퍼 서비스 카테고리

	// 헬퍼 서비스 카테고리 정보 가져오기
	public List<Helper_SpecialtyVO> getSpecialty(String helper_id) {
		return sqlsession.selectList("Helper.getSpecialty", helper_id);
	}

	// 헬퍼 서비스 카테고리 추가
	public void insertSpecialty(Helper_SpecialtyVO hs_vo) {
		sqlsession.insert("Helper.insertSpecialty", hs_vo);
	}

	// 헬퍼 서비스 카테고리 삭제
	public void deleteSpecialty(String helper_id, String service) {
		HashMap<String, String> data = new HashMap<>();

		data.put("helper_id", helper_id);
		data.put("service", service);

		sqlsession.delete("Helper.deleteSpecialty", data);
	}

	// 헬퍼 소개글 수정
	public void updateDescription(String helper_id, String title, String content) {
		HashMap<String, String> data = new HashMap<>();

		data.put("helper_id", helper_id);
		data.put("title", title);
		data.put("content", content);

		sqlsession.update("Helper.updateDescription", data);
	}
	
	//헬퍼 학력 가져오기
	public List<Helper_EducationVO> getEducation(String helper_id) {
		return sqlsession.selectList("Helper.getEducation", helper_id);
	}

	// 헬퍼 학력 추가
	public void insertEducation(Helper_EducationVO he_vo) {
		sqlsession.selectOne("Helper.insertEducation", he_vo);
	}

	// 헬퍼 학력 삭제
	public void deleteEducation(String helper_id, String education) {
		HashMap<String, String> data = new HashMap<>();

		data.put("helper_id", helper_id);
		data.put("education", education);

		sqlsession.delete("Helper.deleteEducation", data);
	}

	//헬퍼 경력 가져오기
	public List<Helper_WorkVO> getWork(String helper_id) {
		return sqlsession.selectList("Helper.getWork", helper_id);
	}
	
	// 헬퍼 경력 추가
	public void insertWork(Helper_WorkVO hw_vo) {
		sqlsession.selectOne("Helper.insertWork", hw_vo);
	}

	// 헬퍼 경력 삭제
	public void deleteWokr(String helper_id, String work) {
		HashMap<String, String> data = new HashMap<>();

		data.put("helper_id", helper_id);
		data.put("work", work);

		sqlsession.delete("Helper.deleteWork", data);

	}
	
	//헬퍼 자격증 가져오기
	public List<Helper_CertificateVO> getCertificateInfo(String helper_id) {
		return sqlsession.selectList("Helper.getCertificate", helper_id);
	}

	// 헬퍼 자격증 추가
	public void insertCertificate(Helper_CertificateVO hc_vo) {
		sqlsession.selectOne("Helper.insertCertificate", hc_vo);
	}

	// 헬퍼 자격증 삭제
	public void deleteCertificate(String helper_id, String certificate) {
		HashMap<String, String> data = new HashMap<>();

		data.put("helper_id", helper_id);
		data.put("certificate", certificate);

		sqlsession.delete("Helper.deleteCertificate", data);
	}
	
	//헬퍼 전체 점수 및 횟수
	public void updateRating1(String helper_id, int rating) {
		HashMap<String, Object> data = new HashMap<>();
		
		data.put("helper_id", helper_id);
		data.put("rating", rating);
		
		
		sqlsession.update("Helper.updateRating1", data);
	}
	
	//헬퍼 평균 평점 
	public void updateRating2(String helper_id) {
		
		sqlsession.update("Helper.updateRating2", helper_id);
	}
	
	//헬퍼 모든 사진 가져오기
	public List<Helper_PicsVO> getPics(String helper_id){
		
		return sqlsession.selectList("Helper.getPics", helper_id);
	}
	
	//메인 사진 업데이트 하기
	public void updateMainPic(String helper_id, String mainSrc) {
		HashMap<String, String> data = new HashMap<>();
		
		
		data.put("helper_id", helper_id);
		data.put("main_pic", mainSrc);
		
		sqlsession.update("Helper.updateMainPic", data);
	}
	
	//첫번째 사진 업데이트 하기
	public void updatePic1(String helper_id, String picSrc) {
		HashMap<String, String> data = new HashMap<>();
		
		
		data.put("helper_id", helper_id);
		data.put("pic1", picSrc);
		
		sqlsession.update("Helper.updatePic1", data);
	}
	
	//두번째 사진 업데이트 하기
	public void updatePic2(String helper_id, String pic2) {
		HashMap<String, String> data = new HashMap<>();
		
		data.put("helper_id", helper_id);
		data.put("pic2", pic2);
		
		sqlsession.update("Helper.updatePic2", data);
	}
	
	//세번째 사진 업데이트 하기
	public void updatePic3(String helper_id, String pic3) {
		HashMap<String, String> data = new HashMap<>();
		
		data.put("helper_id", helper_id);
		data.put("pic3", pic3);
		
		sqlsession.update("Helper.updatePic3", data);
	}
	
	//네번째 사진 업데이트 하기
	public void updatePic4(String helper_id, String pic4) {
		HashMap<String, String> data = new HashMap<>();
		
		data.put("helper_id", helper_id);
		data.put("pic4", pic4);
		
		sqlsession.update("Helper.updatePic4", data);
	}
	
	//다섯번째 사진 업데이트 하기
	public void updatePic5(String helper_id, String pic5) {
		HashMap<String, String> data = new HashMap<>();
		
		data.put("helper_id", helper_id);
		data.put("pic5", pic5);
		
		sqlsession.update("Helper.updatePic5", data);
	}
	
	
	//김시운
	
		//전체헬퍼리스트 - 헬퍼 서치 페이지 첫 로딩시
		public List<HelperVO> getAllHelperList(int startRow,int endRow){
			
			HashMap<String, Integer> pageMap = new HashMap<>();
			pageMap.put("startRow", startRow);
			pageMap.put("endRow", endRow);
			
			//모든 헬퍼의 정보 가져오기
			List<HelperVO> helperList = sqlsession.selectList("Helper.listAll",pageMap);
			
			return helperList;
		}
		//전체헬퍼언어 리스트
	      public ArrayList<String> getAllHelperLanguages(int startRow,int endRow){
	         HelperVO hp = new HelperVO(); //헬퍼 VO
	         ArrayList<String> endlan = new ArrayList<>();	//헬퍼 언어
	         
	         //전체헬퍼리스트 메서드 재사용
	         List<HelperVO> helperList = getAllHelperList(startRow, endRow);	        
	         
	         
	         for (int i = 0; i < helperList.size(); i++) {
	            hp.setHelper_id(helperList.get(i).getHelper_id());
            
	            //헬퍼 아이디별 언어 가져오기
	            List<String> lanList = sqlsession.selectList("Helper.Helper_Languages",hp);
	            String sum = "";
	            for (int j = 0; j < lanList.size(); j++) {
	               if (lanList.size() == j+1) {
	                  sum += lanList.get(j);
	                  continue;
	               }
	               if(lanList.size() == 1) {
	                  sum = lanList.get(j);
	                  continue;
	               }
	               sum += lanList.get(j)+ ", ";
	            }
	            endlan.add(sum);
	         }      
	         return endlan;
	      }
	      
		//전체헬퍼 메인사진 리스트
		public ArrayList<String> getAllHelperPicture(int startRow,int endRow){
			HelperVO hp = new HelperVO();						//헬퍼 VO
			ArrayList<String> pictures = new ArrayList<>();		//헬퍼 메인 사진 리스트
			String getpicture = "";
			
			//전체헬퍼리스트 메서드 재사용
	        List<HelperVO> helperList = getAllHelperList(startRow, endRow);			
			
			for (int i = 0; i < helperList.size(); i++) {
				hp.setHelper_id(helperList.get(i).getHelper_id());
				
				//헬퍼 메인사진 가져오기
				getpicture = sqlsession.selectOne("Helper.Helper_Picture", hp);
				
				pictures.add(getpicture);
			}
			return pictures;
		}
		
		//조건검색 헬퍼 수
	      public int getHelperCnt(String time,String select_date,String area,String service,int dayNum,int startRow,int endRow){
	         int cnt = 0;
	         HashMap<String, Object> cs   = new HashMap<>();    //클라이언트 선택 조건 VO   
	         List<String> possible1 = new ArrayList<>();        //헬퍼 workTime(예약가능) 리스트
	         List<String> possible2 = new ArrayList<>();        //서비스,지역,요일 리스트
	         ArrayList<String> possible3 = new ArrayList<>();   //possible1 과 possible2 중복 Id 리스트	         
	                  
	         //전체헬퍼 아이디 가져오기
	         List<String> helperIdList1 = sqlsession.selectList("Helper.helperIdList");   
	         
	         for (int i = 0; i < helperIdList1.size(); i++) {      
	            
	            cs.put("helper_id", helperIdList1.get(i));
	            cs.put("cs_select_date", select_date);
	            cs.put("cs_dayNum", dayNum);
	            cs.put("cs_area", area);
	            cs.put("cs_service", service);
	                     
	            //헬퍼 WorkTime 체크(오전)
	            if (time.equals("morning")) {
	               worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-1",cs);   
	               if(worktime == null) {
	                  worktime = 0.0;
	               }
	               if(worktime <= 5.0) {
	                  possible1.add(helperIdList1.get(i));               
	               }         
	            }         
	            //헬퍼 WorkTime 체크(오후)
	            if(time.equals("afternoon")) {
	                  worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-2",cs);   
	                  if(worktime == null) {
	                     worktime = 0.0;
	                  }
	                  if(worktime <= 4.0) {
	                     possible1.add(helperIdList1.get(i));               
	                  }         
	            }            
	            //헬퍼 WorkTime 체크(저녁)
	            if(time.equals("dinner")) {
	                  worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-3",cs);   
	                  if(worktime == null) {
	                     worktime = 0.0;
	                  }
	                  if(worktime <= 4.0) {
	                     possible1.add(helperIdList1.get(i));               
	                  }
	            }      	            
	            //요일,지역,서비스 조건 검색   
	            possible2 = sqlsession.selectList("ClientSelect.searchHelper_2",cs);           
	         }                           	               
	         //2개 리스트 중복체크
	         for (String a : possible1) {
	            for (String b : possible2) {
	               if(a.equals(b)) {
	                  possible3.add(a);
	               }            
	            }
	         }                           
	         cnt = possible3.size();	         
	         return cnt;
	      }		
			//조건검색헬퍼리스트
			public List<HelperVO> getHelperList(String time,String select_date,String area,String service,int dayNum,int startRow,int endRow){
				HashMap<String, Object> cs	= new HashMap<>();		//클라이언트 선택조건 VO		
				List<String> possible1 = new ArrayList<>();		 	//헬퍼 workTime(예약가능) 리스트
				List<String> possible2 = new ArrayList<>();			//서비스,지역,요일 리스트
				ArrayList<String> possible3 = new ArrayList<>(); 	//possible1 과 possible2 중복 Id 리스트
				List<HelperVO> endList = new ArrayList<>(); 		//helper_search에 넘길 헬퍼정보 리스트
				HashMap<String, Object> pageMap = new HashMap<>();	//페이징 처리				
				pageMap.put("startRow", startRow);
				pageMap.put("endRow", endRow);
							
				//전체헬퍼 아이디 가져오기
				List<String> helperIdList1 = sqlsession.selectList("Helper.helperIdList");					
				for (int i = 0; i < helperIdList1.size(); i++) {						
					cs.put("helper_id", helperIdList1.get(i));
					cs.put("cs_select_date", select_date);
					cs.put("cs_dayNum", dayNum);
					cs.put("cs_area", area);
					cs.put("cs_service", service);							
					//헬퍼 WorkTime 체크(오전)
					if (time.equals("morning")) {
						worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-1",cs);	
						if(worktime == null) {
							worktime = 0.0;
						}
						if(worktime <= 5.0) {
							possible1.add(helperIdList1.get(i));					
						}			
					}			
					//헬퍼 WorkTime 체크(오후)
					if(time.equals("afternoon")) {
							worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-2",cs);	
							if(worktime == null) {
								worktime = 0.0;
							}
							if(worktime <= 4.0) {
								possible1.add(helperIdList1.get(i));					
							}			
					}				
					//헬퍼 WorkTime 체크(저녁)
					if(time.equals("dinner")) {
							worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-3",cs);	
							if(worktime == null) {
								worktime = 0.0;
							}
							if(worktime <= 4.0) {
								possible1.add(helperIdList1.get(i));					
							}
					}							
					//요일,지역,서비스 조건 검색	
					possible2 = sqlsession.selectList("ClientSelect.searchHelper_2",cs);					
				}														
				//2개 리스트 중복체크
				for (String a : possible1) {
					for (String b : possible2) {
						if(a.equals(b)) {
							possible3.add(a);
						}				
					}
				}					
				for (int i = 0; i < possible3.size(); i++) {					
					if (startRow <= i+1 && i+1 <= endRow) {
						pageMap.put("helper_id", possible3.get(i));
						endList.add(sqlsession.selectOne("Helper.end_HelperInfor",pageMap));
					}
				}																		
				return endList;
			}		
		
			//조건검색 완료 헬퍼 지역
			public ArrayList<String> getHelperLanguanges(String time,String select_date,String area,String service,int dayNum){
				HashMap<String, Object> cs	= new HashMap<>();		//클라이언트 선택 조건	
				HelperVO hp = new HelperVO();						//헬퍼 VO
				List<String> possible1 = new ArrayList<>();			//헬퍼 workTime(예약가능) 리스트
				List<String> possible2 = new ArrayList<>();			//서비스,지역,요일 리스트
				ArrayList<String> possible3 = new ArrayList<>(); 	//possible1 과 possible2 중복 Id 리스트
				ArrayList<String> endlan = new ArrayList<>();		//헬퍼 언어 가져오기
				
				//전체헬퍼 아이디 가져오기
				List<String> helperIdList1 = sqlsession.selectList("Helper.helperIdList");							
				for (int i = 0; i < helperIdList1.size(); i++) {				
					cs.put("helper_id", helperIdList1.get(i));
					cs.put("cs_select_date", select_date);
					cs.put("cs_dayNum", dayNum);
					cs.put("cs_area", area);
					cs.put("cs_service", service);
					
					//헬퍼 WorkTime 체크(오전)
					if (time.equals("morning")) {
						worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-1",cs);	
						if(worktime == null) {
							worktime = 0.0;
						}
						if(worktime <= 5.0) {
							possible1.add(helperIdList1.get(i));					
						}			
					}			
					//헬퍼 WorkTime 체크(오후)
					if(time.equals("afternoon")) {
							worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-2",cs);	
							if(worktime == null) {
								worktime = 0.0;
							}
							if(worktime <= 4.0) {
								possible1.add(helperIdList1.get(i));					
							}			
					}				
					//헬퍼 WorkTime 체크(저녁)
					if(time.equals("dinner")) {
							worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-3",cs);	
							if(worktime == null) {
								worktime = 0.0;
							}
							if(worktime <= 4.0) {
								possible1.add(helperIdList1.get(i));					
							}
					}							
					//요일,지역,서비스 조건 검색	
					possible2 = sqlsession.selectList("ClientSelect.searchHelper_2",cs);				
				}															
				//2개 리스트 중복체크
				for (String a : possible1) {
					for (String b : possible2) {
						if(a.equals(b)) {
							possible3.add(a);
						}				
					}
				}						
				for (int i = 0; i < possible3.size(); i++) {
					hp.setHelper_id(possible3.get(i));
					//헬퍼 언어가져오기
					List<String> lan = sqlsession.selectList("Helper.Helper_Languages",hp);					
					String sum = "";
					for (int j = 0; j < lan.size(); j++) {
						if(lan.size() == j+1) {
							sum += lan.get(j);
							continue;
						}
						if(lan.size() == 1) {
							sum = lan.get(j);
							continue;
						}
						 sum += lan.get(j)+ ", ";					 
					}													
					endlan.add(sum);
				}											
				return endlan;
			}
			
			//헬퍼 사진 리스트
			public ArrayList<String> getHelperPicture(String time,String select_date,String area,String service,int dayNum,int startRow,int endRow){
				HashMap<String, Object> cs	= new HashMap<>();		//클라이언트 선택 조건	
				HelperVO hp = new HelperVO();						//헬퍼 VO
				List<String> possible1 = new ArrayList<>();			//헬퍼 workTime(예약가능) 리스트
				List<String> possible2 = new ArrayList<>();			//서비스,지역,요일 리스트
				ArrayList<String> possible3 = new ArrayList<>(); 	//possible1 과 possible2 중복 Id 리스트
				ArrayList<String> pictures = new ArrayList<>();		//헬퍼 메인 사진 리스트
				String getpicture = "";								
				
				//전체헬퍼 아이디 가져오기
				List<String> helperIdList1 = sqlsession.selectList("Helper.helperIdList");							
				for (int i = 0; i < helperIdList1.size(); i++) {					
					cs.put("helper_id", helperIdList1.get(i));
					cs.put("cs_select_date", select_date);
					cs.put("cs_dayNum", dayNum);
					cs.put("cs_area", area);
					cs.put("cs_service", service);				
					//헬퍼 WorkTime 체크(오전)
					if (time.equals("morning")) {
						worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-1",cs);	
						if(worktime == null) {
							worktime = 0.0;
						}
						if(worktime <= 5.0) {
							possible1.add(helperIdList1.get(i));					
						}			
					}			
					//헬퍼 WorkTime 체크(오후)
					if(time.equals("afternoon")) {
							worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-2",cs);	
							if(worktime == null) {
								worktime = 0.0;
							}
							if(worktime <= 4.0) {
								possible1.add(helperIdList1.get(i));					
							}			
					}				
					//헬퍼 WorkTime 체크(저녁)
					if(time.equals("dinner")) {
							worktime = sqlsession.selectOne("ClientSelect.searchHelper_1-3",cs);	
							if(worktime == null) {
								worktime = 0.0;
							}
							if(worktime <= 4.0) {
								possible1.add(helperIdList1.get(i));					
							}
					}							
					//요일,지역,서비스 조건 검색	
					possible2 = sqlsession.selectList("ClientSelect.searchHelper_2",cs);	
				}														
				//2개 리스트 중복체크
				for (String a : possible1) {
					for (String b : possible2) {
						if(a.equals(b)) {
							possible3.add(a);
						}				
					}
				}					
				for (int j = 0; j < possible3.size(); j++) {
					hp.setHelper_id(possible3.get(j));
					getpicture = sqlsession.selectOne("Helper.Helper_Picture", hp);	
					if (startRow-1 <= j && j <= endRow-1) {
						pictures.add(getpicture);
					}
				}
				return pictures;
			}
			
			//헬퍼 상세페이지(헬퍼정보)
			public ArrayList<HelperVO> getHelperDetail(String helper_id){
				HashMap<String, String> map = new HashMap<>();
				ArrayList<HelperVO> hpList = new ArrayList<>();
				
				map.put("helper_id", helper_id);		
			 	hpList.add(sqlsession.selectOne("Helper.end_HelperInfor",map));
			 	
				return hpList;
			}
			
			//헬퍼 상세페이지(헬퍼언어)
			public ArrayList<String> getLanguagesDetail(String helper_id){
				ArrayList<String> endlan = new ArrayList<>();
				List<Helper_LanguagesVO> lanVOList = new ArrayList<>();
				HelperVO hp = new HelperVO();
				hp.setHelper_id(helper_id);
				
				//헬퍼 상세페이지 언어 가져오기
				lanVOList = sqlsession.selectList("Helper.Helper_DetailLanguages",hp);
				for (int i = 0; i < lanVOList.size(); i++) {
					endlan.add(lanVOList.get(i).getLanguage() + " ("+lanVOList.get(i).getLevel()+")");
				}				
				return endlan;
			}	
			
			//헬퍼 상세페이지(헬퍼 학력리스트)
			public ArrayList<String> getEducationDetail(String helper_id){
				ArrayList<String> endedu = new ArrayList<>();
				List<Helper_EducationVO> eduVOList = new ArrayList<>();
				HelperVO hp = new HelperVO();
				hp.setHelper_id(helper_id);
				
				//헬퍼 상세페이지 학력가져오기
				eduVOList = sqlsession.selectList("Helper.Helper_DetailEducation",hp);
				for (int i = 0; i < eduVOList.size(); i++) {		
					String temp = eduVOList.get(i).getGraduate_year()+"";
					endedu.add(eduVOList.get(i).getEducation() + " ("+temp+")");
				}					
				return endedu;
			}
			
			//헬퍼 상세페이지(헬퍼 직무리스트)
			public ArrayList<String> getWorkDetail(String helper_id){
				List<Helper_WorkVO> workVO = new ArrayList<>();
				ArrayList<String> endwork = new ArrayList<>();
				HelperVO hp = new HelperVO();
				hp.setHelper_id(helper_id);
				
				//헬퍼 상세페이지 경력가져오기
				workVO = sqlsession.selectList("Helper.Helper_WorkDetail", hp);				
				for (int i = 0; i < workVO.size(); i++) {
					endwork.add(workVO.get(i).getWork_experience() + " ("+workVO.get(i).getWork_startyear()
					+ " ~ " + workVO.get(i).getWork_endyear()+")");
				}			
				return endwork;
			}
			
			//헬퍼 상세페이지(헬퍼 자격증리스트)
			public ArrayList<String> getCertificate(String helper_id){
				List<Helper_CertificateVO> certificateVO = new ArrayList<>();
				ArrayList<String> endcertificate = new ArrayList<>();
				HelperVO hp = new HelperVO();
				hp.setHelper_id(helper_id);
				
				//헬퍼 상세페이지 자격증가져오기
				certificateVO = sqlsession.selectList("Helper.Helper_CertificateDetail", hp);				
				for (int i = 0; i < certificateVO.size(); i++) {					
					String temp [] = certificateVO.get(i).getDate_obtained().split(" ");				
					 endcertificate.add(certificateVO.get(i).getCertificate() + " (" + temp[0]+")"); 
				}			
				return endcertificate;
			}
			
			//헬퍼 상세페이지(헬퍼 메인사진)
			public String getPicturesMainDetail(String helper_id){
				String main_picture = "";
				
				//헬퍼 메인사진 가져오기
				main_picture = sqlsession.selectOne("Helper.Helper_Picture",helper_id);				
				return main_picture;
			}	
			
			//헬퍼 상세페이지(헬퍼 사진리스트)
			public ArrayList<String> getPicturesDetail(String helper_id){
				ArrayList<Helper_PicsVO> hp_pic = new ArrayList<>();
				ArrayList<String> hp_list = new ArrayList<>();
				
				//헬퍼 사진리스트가져오기
				hp_pic.add(sqlsession.selectOne("Helper.Helper_Pictures", helper_id));					
					if(!(hp_pic.get(0).getMain_filename().contains("add_picture.png"))) {
						hp_list.add(hp_pic.get(0).getMain_filename());
					}
					if(!(hp_pic.get(0).getPic1_filename().contains("add_picture.png"))) {
						hp_list.add(hp_pic.get(0).getPic1_filename());
					}
					if(!(hp_pic.get(0).getPic2_filename().contains("add_picture.png"))) {
						hp_list.add(hp_pic.get(0).getPic2_filename());
					}
					if(!(hp_pic.get(0).getPic3_filename().contains("add_picture.png"))) {
						hp_list.add(hp_pic.get(0).getPic3_filename());
					}
					if(!(hp_pic.get(0).getPic4_filename().contains("add_picture.png"))) {
						hp_list.add(hp_pic.get(0).getPic4_filename());
					}
					if(!(hp_pic.get(0).getPic5_filename().contains("add_picture.png"))) {
						hp_list.add(hp_pic.get(0).getPic5_filename());
					}				
				return hp_list;
			}
			
		//전체 헬퍼수 가져오기
		public int getHelperCnt(){
			return sqlsession.selectOne("Helper.helperCnt");
		}	
		
		//상세페이지에 보여줄 언어
		public String getLanguagesDetail_1(String helper_id){
            String sum = "";
            HelperVO hp = new HelperVO();
            hp.setHelper_id(helper_id);
            List<String> lan = new ArrayList<>();
            
            //헬퍼 상세페이지 언어 가져오기
            lan = sqlsession.selectList("Helper.Helper_Languages", hp);
            
            for (int i = 0; i < lan.size(); i++) {            
               if (lan.size() == i+1) {
                  sum += lan.get(i);
               }else {
                  sum += lan.get(i)+", ";
               }
            }                   
            return sum;
         }   
		
		//최명기 헬퍼와 고객 아이디가 중복되는지 확인
	      public boolean checkId(String id) {
	         if((Integer)sqlsession.selectOne("Helper.checkId", id)==1) {
	            //헬퍼 아이디와 가입하고자 하는 고객 아이디가 중복될 때
	            return true;
	         }
	         return false;
	      	
	      }
}
