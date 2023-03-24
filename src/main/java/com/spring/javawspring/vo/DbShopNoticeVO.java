package com.spring.javawspring.vo;

import lombok.Data;

@Data
public class DbShopNoticeVO {
	private int idx;
	private String title;
	private String content;
	private String startDate;
	private String endDate;
	private String part;
	private String popupSw;
	private String fName;
	private String fSName;
	
	
	private int day_diff;		// 날짜 차이 계산 필드(1일차이 계산필드)
	private int hour_diff;	// 날짜 차이 계산 필드(24시간차이 계산필드)
	
}
