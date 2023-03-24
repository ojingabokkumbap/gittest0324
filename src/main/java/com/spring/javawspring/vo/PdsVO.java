package com.spring.javawspring.vo;

import lombok.Data;

@Data
public class PdsVO {
	private int idx;
	private String mid;
	private String nickName;
	private String fName;
	private String fSName;
	private int fSize;
	private String title;
	private String part;
	private String pwd;
	private String fDate;
	private int downNum;
	private String openSw;
	private String content;
	private String hostIp;
	
	private int day_diff;		// 새글처리를 위한 변수
	private int hour_diff;	// 새글처리를 위한 변수
}
