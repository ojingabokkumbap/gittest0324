package com.spring.javawspring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javawspring.vo.DbOrderVO;
import com.spring.javawspring.vo.MemberVO;

public interface MemberService {

	public MemberVO getMemberIdCheck(String mid);

	public MemberVO getMemberNickNameCheck(String nickName);
	
	public int setMemberJoinOk(MemberVO vo);

	public int setMemberUpdateOk(MemberVO vo);
	
	public void setMemberDeleteOk(String mid);

	public MemberVO getMemberNickNameEmailCheck(String nickName, String email);

	public void setKakaoMemberInputOk(String mid, String pwd, String nickName, String email);

	public void setMemberUserDelCheck(String mid);

	public void setMemberPwdUpdate(String mid, String pwd);

	public MemberVO getMemberIdSearch(String email);

	public List<MemberVO> getMemberList(int startIndexNo, int pageSize, String mid);

	public void setMemberVisitProcess(MemberVO vo);

	public List<MemberVO> getRecentlyVisitCount(int i);

	public MemberVO getMemberIdVisitCnt();

	public List<MemberVO> getNewMember();

	public int getTotalPriceSum();

	public int getTotalOrder();

	public int getMemberCnt();

	public int getNoreply();


}
