package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.Sqlsessionmanager;

public class EastDAO {
	// 세션을 생성해 줄수 있는 factory 생성
		SqlSessionFactory sqlSessionFactory = Sqlsessionmanager.getSqlSession();

		// 세션 생성(sql 실행, close(), 연결)
		SqlSession sqlSession = sqlSessionFactory.openSession();

		public List<CCTV> selectAllcctvE() {
			List<CCTV> name = null;
			try {
				name = sqlSession.selectList("com.smhrd.model.EastDAO.selectAllcctvE");
				// select ==> commit/rollback 생략가능
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return name;
		}
		
		public List<Fire> selectAllfireE() {
			List<Fire> name = null;
			try {
				name = sqlSession.selectList("com.smhrd.model.EastDAO.selectAllfireE");
				// select ==> commit/rollback 생략가능
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return name;
		}
		
		public List<Police> selectAllpolE() {
			List<Police> name = null;
			try {
				name = sqlSession.selectList("com.smhrd.model.EastDAO.selectAllpolE");
				// select ==> commit/rollback 생략가능
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return name;
		}
		
		public List<Safe> selectAllsafeE() {
			List<Safe> name = null;
			try {
				name = sqlSession.selectList("com.smhrd.model.EastDAO.selectAllsafeE");
				// select ==> commit/rollback 생략가능
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return name;
		}
		
}
