package com.smhrd.model;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Fire {
	private BigDecimal f_seq;
	private String f_name;
	private String f_addr;
	private BigDecimal f_lat;
	private BigDecimal f_lon;
	private String f_tel;
	private String admin_id;
	
}
