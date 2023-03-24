package com.spring.javawspring.vo;

import lombok.Data;

@Data
public class MemberVO {
	private int idx;
	private String mid;
	private String pwd;
	private String nickName;
	private String email;
	private String userDel;
	private int level;
	private int point;
	private int visitCnt;
	private String startDate;
	private String lastDate;
	private int todayCnt;
}
