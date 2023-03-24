package com.spring.javawspring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javawspring.vo.DbShopNoticeVO;
import com.spring.javawspring.vo.QnaReplyVO;
import com.spring.javawspring.vo.QnaVO;

public interface AdminDAO {

	public int setMemberLevelCheck(@Param("idx") int idx, @Param("level") int level);

	public void setQnaInputAdmin(@Param("vo") QnaReplyVO vo);

	public void setQnaUpdateAdmin(@Param("qnaIdx") int qnaIdx);

	public List<QnaVO> getAdQnaList(@Param("startIndexNo")int startIndexNo, @Param("pageSize") int pageSize, @Param("part")String part);

	public QnaVO getQnaContent(@Param("idx") int idx);

	public QnaReplyVO getQnaReplyContent(@Param("idx") int idx);

	public void getQnaReplyContent(MultipartFile file, DbShopNoticeVO noticeVo);

	public void noticeInputOk(@Param("noticeVo") DbShopNoticeVO noticeVo);

	public DbShopNoticeVO getNotifyUpdate(@Param("idx") int idx);

	public void setPopupCheckUpdate(@Param("idx") int idx, @Param("popupSw") String popupSw);

	public DbShopNoticeVO getNotifyView(@Param("idx") int idx);

	public List<DbShopNoticeVO> getNoticePopup();

}
