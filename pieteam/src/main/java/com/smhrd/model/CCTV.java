package com.smhrd.model;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class CCTV {
	private BigDecimal cctv_seq;
	private String cctv_name;
	private String cctv_addr;
	private BigDecimal cctv_lat;
	private BigDecimal cctv_lon;
	private String cctv_tel;
	private String admin_id;
	
}
