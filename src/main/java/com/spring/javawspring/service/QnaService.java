package com.spring.javawspring.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javawspring.vo.QnaReplyVO;
import com.spring.javawspring.vo.QnaVO;

public interface QnaService {

	public String getEmail(String mid);

	public int getMaxIdx();

	public void qnaInputOk(MultipartFile file, QnaVO vo);

	public List<QnaVO> getQnaList(int startIndexNo, int pageSize, String part, String mid);

	public QnaVO getQnaContent(int idx);

	public void setQnaDelete(int idx);

	public QnaVO getInquiryView(int idx);

	public QnaReplyVO getInquiryReply(int idx);


}
