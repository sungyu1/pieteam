package com.smhrd.model;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class Police {
	private BigDecimal p_seq;
	@NonNull
	private String p_name;
	@NonNull
	private String p_addr;
	@NonNull
	private BigDecimal p_lat;
	@NonNull
	private BigDecimal p_lon;
	@NonNull
	private String p_tel;
	private String admin_id;
	
}
