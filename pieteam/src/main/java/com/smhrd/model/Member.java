package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class Member {

	@NonNull
	private String m_id;
	@NonNull
	private String m_pw;
	@NonNull
	private String m_name;
	@NonNull
	private String m_nick;
	@NonNull
	private String m_gender;
	@NonNull
	private BigDecimal m_age;
	private String m_type;
	private Timestamp m_joindate;
	
	public Member(String m_id, String m_pw) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
	}
	
	
}
