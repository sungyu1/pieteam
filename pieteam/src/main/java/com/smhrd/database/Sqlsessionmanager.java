package com.smhrd.database;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Sqlsessionmanager {

	public static SqlSessionFactory sqlSession;
	static {
		//myBatis 설정파일 경로 -> db연결
		String resource = "com/smhrd/database/mybatis-config.xml";//나중에 수정은 여기만 해주면됨
		Reader reader;
		try {
			reader = Resources.getResourceAsReader(resource);
			// SqlSessionFactory : Sqlsession(db연결,sql실행,트랜잭션 관리)생성
			sqlSession = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//dao(class)사용 
	public static SqlSessionFactory getSqlSession() {
		return sqlSession;
	}
}
