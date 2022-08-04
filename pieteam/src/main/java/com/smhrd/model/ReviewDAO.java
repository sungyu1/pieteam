package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.Sqlsessionmanager;

public class ReviewDAO {

	SqlSessionFactory sqlSessionFactory = Sqlsessionmanager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	// 게시물 업로드
	public int insertReview(Review vo) {
		int cnt=0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.ReviewDAO.insertReview", vo);
			
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
	public List<Review> selectReviewList(int num) {
		List<Review> list = null;
		try {
			list = sqlSession.selectList("com.smhrd.model.ReviewDAO.selectReviewList", num);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	
	// 게시물 하나 보여주기
	public Review selectOne(int num) {
		Review vo = null;
		try {
			vo = sqlSession.selectOne("com.smhrd.model.ReviewDAO.selectOne",num);
			// select - commit/rollback 생략
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return vo;
	}
	
	// 리뷰 게시글 삭제
	public int deleteReview(int num) {
		int cnt=0;
		try {
			cnt = sqlSession.delete("com.smhrd.model.ReviewDAO.deleteReview", num);
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
