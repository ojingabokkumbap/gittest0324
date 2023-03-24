package com.spring.javawspring.vo;

import lombok.Data;

@Data
public class DbProductVO {
	private int idx;
	private String productCode;
	private String productName;
	private String mainPrice;
	private String fSName;
	private String content;
	private String fDate;
	private int sell;
	private int readNum;
	private int love;
	
	private String categoryMainCode;
	private String categoryMainName;
	private String categorySubCode;
	private String categorySubName;
	
	private int reviewCount;
}
