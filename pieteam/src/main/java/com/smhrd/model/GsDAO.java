package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.Sqlsessionmanager;

public class GsDAO {
	// 세션을 생성해 줄수 있는 factory 생성
				SqlSessionFactory sqlSessionFactory = Sqlsessionmanager.getSqlSession();

				// 세션 생성(sql 실행, close(), 연결)
				SqlSession sqlSession = sqlSessionFactory.openSession();

				public List<CCTV> selectAllcctvGs() {
					List<CCTV> name = null;
					try {
						name = sqlSession.selectList("com.smhrd.model.GsDAO.selectAllcctvGs");
						// select ==> commit/rollback 생략가능
					}catch(Exception e) {
						e.printStackTrace();
					} finally {
						sqlSession.close();
					}
					return name;
				}
				
				public List<Fire> selectAllfireGs() {
					List<Fire> name = null;
					try {
						name = sqlSession.selectList("com.smhrd.model.GsDAO.selectAllfireGs");
						// select ==> commit/rollback 생략가능
					}catch(Exception e) {
						e.printStackTrace();
					} finally {
						sqlSession.close();
					}
					return name;
				}
				
				public List<Police> selectAllpolGs() {
					List<Police> name = null;
					try {
						name = sqlSession.selectList("com.smhrd.model.GsDAO.selectAllpolGs");
						// select ==> commit/rollback 생략가능
					}catch(Exception e) {
						e.printStackTrace();
					} finally {
						sqlSession.close();
					}
					return name;
				}
				
				public List<Safe> selectAllsafeGs() {
					List<Safe> name = null;
					try {
						name = sqlSession.selectList("com.smhrd.model.GsDAO.selectAllsafeGs");
						// select ==> commit/rollback 생략가능
					}catch(Exception e) {
						e.printStackTrace();
					} finally {
						sqlSession.close();
					}
					return name;
				}
}
