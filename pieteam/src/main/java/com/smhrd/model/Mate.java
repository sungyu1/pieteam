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
public class Mate {

	private BigDecimal mate_seq;
	private String mate_id;
	@NonNull
	private String mate_memo;
	private Timestamp mate_date;
	@NonNull
	private String m_id;
	@NonNull
	private String mate_name;
	
	public Mate(BigDecimal mate_seq, String mate_memo, Timestamp mate_date, String m_id, String mate_name) {
		super();
		this.mate_seq = mate_seq;
		this.mate_memo = mate_memo;
		this.mate_date = mate_date;
		this.m_id = m_id;
		this.mate_name = mate_name;
	}
	
	
}
