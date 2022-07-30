package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.Sqlsessionmanager;

public class CommentDAO {

	SqlSessionFactory sqlSessionFactory = Sqlsessionmanager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	// 댓글 작성
	public int insertComment(Comment vo) {
		int cnt=0;
		try {
			cnt = sqlSession.insert("com.smhrd.model.CommentDAO.insertComment", vo);
			
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
	
	// 리뷰에 댓글 표시
	public List<Comment> selectComment(int boardnum) {
		List<Comment> list = null;
		try {
			list = sqlSession.selectList("com.smhrd.model.CommentDAO.selectComment", boardnum);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
}
