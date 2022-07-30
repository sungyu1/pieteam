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
public class Comment {

	private BigDecimal cmt_seq;
	@NonNull
	private BigDecimal r_seq;
	@NonNull
	private String cmt_content;
	private Timestamp cmt_date;
	@NonNull
	private String m_id;
}