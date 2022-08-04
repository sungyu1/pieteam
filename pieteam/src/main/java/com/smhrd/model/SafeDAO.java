package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.Sqlsessionmanager;

public class SafeDAO {
	
			SqlSessionFactory sqlSessionFactory = Sqlsessionmanager.getSqlSession();

			
			SqlSession sqlSession = sqlSessionFactory.openSession();
			
			// 전체 보호구역
			public List<Safe> selectSafeList(int num) {
				List<Safe> list = null;
				try {
					list = sqlSession.selectList("com.smhrd.model.SafeDAO.selectSafeList", num);
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					sqlSession.close();
				}
				return list;
			}
			
			// 관리자의 보호구역 삭제
			public int deleteSafe(int num) {
				int cnt=0;
				try {
					cnt = sqlSession.delete("com.smhrd.model.SafeDAO.deleteSafe", num);
					if(cnt>0) {
						sqlSession.commit();
					}else {
						sqlSession.rollback();
					}
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					sqlSession.close();
				}
				return cnt;
			}
		}





