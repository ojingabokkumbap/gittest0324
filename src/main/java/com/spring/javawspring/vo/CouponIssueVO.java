package com.spring.javawspring.vo;

import lombok.Data;

@Data
public class CouponIssueVO {
	private int idx;
	private String cName;
	private int cPrice;
	private String cDate;
	private String cStartDate;
	private String cEndDate;
	private String mid;
	private int productIdx;
	private String qrCode;
	private String bigo;
}
