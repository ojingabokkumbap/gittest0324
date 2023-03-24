package com.spring.javawspring.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javawspring.common.JavawspringProvide;
import com.spring.javawspring.dao.MemberDAO;
import com.spring.javawspring.vo.DbOrderVO;
import com.spring.javawspring.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO getMemberIdCheck(String mid) {
		return memberDAO.getMemberIdCheck(mid);
	}

	@Override
	public MemberVO getMemberNickNameCheck(String nickName) {
		return memberDAO.getMemberNickNameCheck(nickName);
	}
	
	@Override
	public int setMemberJoinOk(MemberVO vo) {
		return memberDAO.setMemberJoinOk(vo);
	}
	
	@Override
	public void setMemberPwdUpdate(String mid, String pwd) {
		memberDAO.setMemberPwdUpdate(mid,pwd);
	}
	
	@Override
	public int setMemberUpdateOk(MemberVO vo) {
		int res = 0;
		
		memberDAO.setMemberUpdateOk(vo);
		res = 1;
		
		return res;
	}
	@Override
	public void setMemberDeleteOk(String mid) {
		memberDAO.setMemberDeleteOk(mid);
	}

	@Override
	public MemberVO getMemberNickNameEmailCheck(String nickName, String email) {
		return memberDAO.getMemberNickNameEmailCheck(nickName, email);
	}

	@Override
	public void setKakaoMemberInputOk(String mid, String pwd, String nickName, String email) {
		memberDAO.setKakaoMemberInputOk(mid, pwd, nickName, email);
	}

	@Override
	public void setMemberUserDelCheck(String mid) {
		memberDAO.setMemberUserDelCheck(mid);
	}

	@Override
	public MemberVO getMemberIdSearch(String email) {
		return memberDAO.getMemberIdSearch(email);
	}

	@Override
	public List<MemberVO> getMemberList(int startIndexNo, int pageSize, String mid) {
		return memberDAO.getMemberList(startIndexNo, pageSize, mid);
	}

	@Override
	public void setMemberVisitProcess(MemberVO vo) {
		// 오늘 날짜 편집
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strNow = sdf.format(now);
		
		// 오늘 처음 방문시는 오늘 방문카운트(todayCnt)를 0으로 셋팅한다. 
		if(!vo.getLastDate().substring(0,10).equals(strNow)) {
			//memberDAO.setTodayCntUpdate(vo.getMid());
			vo.setTodayCnt(0);
		}
		
		int todayCnt = vo.getTodayCnt() + 1;
		
		int nowTodayPoint = 0;
		if(vo.getTodayCnt() >= 5) {
			nowTodayPoint = vo.getPoint();
		}
		else {
			nowTodayPoint = vo.getPoint() + 10;
		}
		// 오늘 재방문이라면 '총방문수','오늘방문수','포인트' 누적처리
		memberDAO.setMemTotalUpdate(vo.getMid(), nowTodayPoint, todayCnt);
	}

	@Override
	public List<MemberVO> getRecentlyVisitCount(int i) {
		return memberDAO.getRecentlyVisitCount(i);
	}

	@Override
	public MemberVO getMemberIdVisitCnt() {
		return memberDAO.getMemberIdVisitCnt();
	}

	@Override
	public List<MemberVO> getNewMember() {
		return memberDAO.getNewMember();
	}

	@Override
	public int getTotalPriceSum() {
		return memberDAO.getTotalPriceSum();
	}

	@Override
	public int getTotalOrder() {
		return memberDAO.getTotalOrder();
	}

	@Override
	public int getMemberCnt() {
		return memberDAO.getMemberCnt();
	}

	@Override
	public int getNoreply() {
		return memberDAO.getNoreply();
	}



}
