package com.helpme.app.board.dao;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.helpme.app.board.vo.Helpme_FilesVO;
import com.helpme.mybatis.config.SqlMapConfig;
import com.oreilly.servlet.MultipartRequest;

public class FilesDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public FilesDAO(){
		//항상 true를 넣어서 커밋을 해줘야 한다!
		sqlsession = sessionf.openSession(true);
	}
	
	public List<Helpme_FilesVO> getDetail(int board_num){
		List<Helpme_FilesVO> filesList = sqlsession.selectList("Files.getDetail", board_num);
		return filesList;
	}
	
	public boolean insertFiles(int board_num, MultipartRequest multi) {
		Enumeration<String> files = multi.getFileNames();
		HashMap<String, Object> fileMap = new HashMap<>();
		
		boolean check = true;
		
		fileMap.put("board_num", board_num);
		
		while(files.hasMoreElements()) {
			String data = files.nextElement();
			if(multi.getFilesystemName(data)==null) {continue;}
			//해쉬맵에 file_name으로 시스템 이름을 넣어준다.
			fileMap.put("file_name", multi.getFilesystemName(data));
//			System.out.println(fileMap);
			int sqlInsert = sqlsession.insert("Files.insertFile",fileMap);
			//DB에 해당 파일 시스템 이름 추가
			if(sqlInsert!=1) {
//				System.out.println("break.");
				check=false;
				break;
			}
		}
		return check;
	}
	
	public void deleteFiles(int board_num) {
		sqlsession.delete("Files.deleteFiles", board_num);
	}
}































