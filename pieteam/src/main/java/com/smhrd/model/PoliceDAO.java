package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.Sqlsessionmanager;

public class PoliceDAO {
	// 세션을 생성해 줄수 있는 factory 생성
	SqlSessionFactory sqlSessionFactory = Sqlsessionmanager.getSqlSession();

	// 세션 생성(sql 실행, close(), 연결)
	SqlSession sqlSession = sqlSessionFactory.openSession();

	

	public List<Police> selectAll() {
		List<Police> name = null;
		try {
			name = sqlSession.selectList("com.smhrd.model.PoliceDAO.selectAll");
			// select ==> commit/rollback 생략가능
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return name;
	}
	
//	public List<CCTV> selectAll() {
//		List<CCTV> name = null;
//		try {
//			name = sqlSession.selectList("com.smhrd.model.CCTVDAO.selectAll");
//			// select ==> commit/rollback 생략가능
//		}catch(Exception e) {
//			e.printStackTrace();
//		} finally {
//			sqlSession.close();
//		}
//		return name;
//	}
}
