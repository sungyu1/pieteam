package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.Sqlsessionmanager;

public class MateDAO {

	SqlSessionFactory sqlSessionFactory = Sqlsessionmanager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	// 게시물 업로드
	public int insertMate(Mate vo) {
		int cnt=0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.MateDAO.insertMate", vo);
			
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
	
	// 전체 게시물 페이징
	public List<Mate> selectMateList(int num) {
		List<Mate> list = null;
		try {
			list = sqlSession.selectList("com.smhrd.model.MateDAO.selectMateList", num);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	
	// 게시물 하나 보여주기
	public Mate selectOne(int num) {
		Mate vo = null;
		try {
			vo = sqlSession.selectOne("com.smhrd.model.MateDAO.selectOne",num);
			// select - commit/rollback 생략
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return vo;
	}
}
