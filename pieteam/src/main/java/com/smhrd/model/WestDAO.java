package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.Sqlsessionmanager;

public class WestDAO {
	// 세션을 생성해 줄수 있는 factory 생성
			SqlSessionFactory sqlSessionFactory = Sqlsessionmanager.getSqlSession();

			// 세션 생성(sql 실행, close(), 연결)
			SqlSession sqlSession = sqlSessionFactory.openSession();

			public List<CCTV> selectAllcctvW() {
				List<CCTV> name = null;
				try {
					name = sqlSession.selectList("com.smhrd.model.WestDAO.selectAllcctvW");
					// select ==> commit/rollback 생략가능
				}catch(Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return name;
			}
			
			public List<Fire> selectAllfireW() {
				List<Fire> name = null;
				try {
					name = sqlSession.selectList("com.smhrd.model.WestDAO.selectAllfireW");
					// select ==> commit/rollback 생략가능
				}catch(Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return name;
			}
			
			public List<Police> selectAllpolW() {
				List<Police> name = null;
				try {
					name = sqlSession.selectList("com.smhrd.model.WestDAO.selectAllpolW");
					// select ==> commit/rollback 생략가능
				}catch(Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return name;
			}
			
			public List<Safe> selectAllsafeW() {
				List<Safe> name = null;
				try {
					name = sqlSession.selectList("com.smhrd.model.WestDAO.selectAllsafeW");
					// select ==> commit/rollback 생략가능
				}catch(Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
				return name;
			}
}
