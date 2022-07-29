package com.smhrd.model;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class Safe {
	private BigDecimal sz_seq;
	private String sz_addr;
	private BigDecimal sz_lat;
	private BigDecimal sz_lon;
	private String admin_id;
	
}
