package com.spring.javawspring.vo;

import lombok.Data;

@Data
public class CouponDownVO {
	private int idx;
	private int couponId;
	private String cName;
	private int cPrice;
	private String cDownDate;
	private String cUseDate;
	private int cLevel;
	private String cCondition;
	private String mid;
}
