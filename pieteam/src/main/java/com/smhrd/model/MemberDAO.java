package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.Sqlsessionmanager;

public class MemberDAO {

	SqlSessionFactory sqlSessionFactory = Sqlsessionmanager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	// 회원가입
	public int insertMember(Member vo) {
		int cnt=0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.MemberDAO.insertMember", vo);
			
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
	
	// 로그인
	public Member selectMember(Member vo) {
		Member loginMember = null;
		try {
			loginMember = sqlSession.selectOne("com.smhrd.model.MemberDAO.selectMember",vo);
			// select - commit/rollback 생략
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return loginMember;
	}
	
	// 개인정보수정
	public int updateMember(Member vo) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.smhrd.model.MemberDAO.updateMember",vo);
			
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
