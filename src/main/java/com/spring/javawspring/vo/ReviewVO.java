package com.spring.javawspring.vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int idx;
	private String orderIdx;
	private int productIdx;
	private String mid;
	private String nickName;
	private String title;
	private String content;
	private String rDate;
	private String fName;
	private String fSName;
	private int fSize;
	private int good;
	private int ReviewCnt;
	
	private int day_diff;		// 날짜 차이 계산 필드(1일차이 계산필드)
	private int hour_diff;	// 날짜 차이 계산 필드(24시간차이 계산필드)

	
	
}
