package com.spring.javawspring.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javawspring.vo.DbShopNoticeVO;
import com.spring.javawspring.vo.QnaReplyVO;
import com.spring.javawspring.vo.QnaVO;

public interface AdminService {

	public int setMemberLevelCheck(int idx, int level);

	public void setQnaInputAdmin(QnaReplyVO vo);

	public void setQnaUpdateAdmin(int qnaIdx);

	public List<QnaVO> getAdQnaList(int startIndexNo, int pageSize, String part);

	public QnaVO getQnaContent(int idx);

	public QnaReplyVO getQnaReplyContent(int idx);

	public void setNoticeInput(MultipartFile file, DbShopNoticeVO noticeVo);

	public DbShopNoticeVO getNotifyUpdate(int idx);

	public int setPopupCheckUpdate(int idx, String popupSw);

	public DbShopNoticeVO getNotifyView(int idx);

	public List<DbShopNoticeVO> getNoticePopup();

}
