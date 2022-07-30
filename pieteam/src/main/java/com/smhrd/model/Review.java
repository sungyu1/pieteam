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
public class Review {

	private BigDecimal r_seq;
	@NonNull
	private String r_content;
	private Timestamp r_date;
	@NonNull
	private String m_id;
	@NonNull
	private String r_name;
}
