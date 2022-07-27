package com.smhrd.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class Member {

	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_nick;
	private String m_gender;
	private BigDecimal m_age;
}
