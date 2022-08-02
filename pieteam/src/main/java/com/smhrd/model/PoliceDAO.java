package com.smhrd.model;

import java.math.BigDecimal;
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
	
	// 전체 경찰서 페이징
	public List<Police> selectPoliceList(int num) {
		List<Police> list = null;
		try {
			list = sqlSession.selectList("com.smhrd.model.PoliceDAO.selectPoliceList", num);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	
	// 관리자의 경찰서 삭제
	public int deletePolice(BigDecimal num) {
		int cnt=0;
		try {
			cnt = sqlSession.delete("com.smhrd.model.PoliceDAO.deletePolice", num);
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
