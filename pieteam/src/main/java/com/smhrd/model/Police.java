package com.smhrd.model;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Police {
	private BigDecimal p_seq;
	private String p_name;
	private String p_addr;
	private BigDecimal p_lat;
	private BigDecimal p_lon;
	private String p_tel;
	private String admin_id;
	
}
