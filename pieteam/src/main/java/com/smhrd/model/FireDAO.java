package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.Sqlsessionmanager;

public class FireDAO {
	
	// 세션을 생성해 줄수 있는 factory 생성
		SqlSessionFactory sqlSessionFactory = Sqlsessionmanager.getSqlSession();

		// 세션 생성(sql 실행, close(), 연결)
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		// 전체 소방서 페이징
		public List<Fire> selectFireList(int num) {
			List<Fire> list = null;
			try {
				list = sqlSession.selectList("com.smhrd.model.FireDAO.selectFireList", num);
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			return list;
		}
	}



