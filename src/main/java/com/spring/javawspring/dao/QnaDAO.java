package com.spring.javawspring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javawspring.vo.QnaReplyVO;
import com.spring.javawspring.vo.QnaVO;

public interface QnaDAO {

	public String getEmail(@Param("mid") String mid);

	public int getCountIdx();

	public int getMaxIdx();

	public void qnaInputOk(@Param("vo") QnaVO vo);
	
	public int totRecCnt(@Param("part") String part, @Param("mid") String mid);

	public List<QnaVO> getQnaList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("part") String part,  @Param("mid") String mid);

	public QnaVO getQnaContent(@Param("idx") int idx);

	public void setQnaDelete(@Param("idx") int idx);

	public QnaVO getInquiryView(@Param("idx") int idx);

	public QnaReplyVO getInquiryReply(@Param("idx") int idx);


}
