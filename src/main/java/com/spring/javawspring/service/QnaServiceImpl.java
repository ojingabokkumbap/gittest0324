package com.spring.javawspring.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javawspring.common.ProjectSupport;
import com.spring.javawspring.dao.QnaDAO;
import com.spring.javawspring.vo.QnaReplyVO;
import com.spring.javawspring.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaDAO qnaDAO;

	@Override
	public String getEmail(String mid) {
		return qnaDAO.getEmail(mid);
	}

	@Override
	public int getMaxIdx() {
		return qnaDAO.getCountIdx() == 0 ? 0 : qnaDAO.getMaxIdx();
	}

	@Override
	public void qnaInputOk(MultipartFile file, QnaVO vo) {
		// 사진작업 처리후 DB에 저장
			try {
				String oFileName = file.getOriginalFilename();
				if(oFileName != null && !oFileName.equals("")) {
					UUID uid = UUID.randomUUID();
					String saveFileName = uid + "_" + oFileName;
					ProjectSupport ps = new ProjectSupport();
					ps.writeFile(file, saveFileName,"qna");
					vo.setFName(oFileName);
					vo.setFSName(saveFileName);
				}
				qnaDAO.qnaInputOk(vo);
			} catch (IOException e) {
				e.printStackTrace();
			}
	}

	@Override
	public List<QnaVO> getQnaList(int startIndexNo, int pageSize,String part, String mid) {
		return qnaDAO.getQnaList(startIndexNo, pageSize, part , mid);
	}

	@Override
	public QnaVO getQnaContent(int idx) {
		return qnaDAO.getQnaContent(idx);
	}

	@Override
	public void setQnaDelete(int idx) {
		qnaDAO.setQnaDelete(idx);
	}

	@Override
	public QnaVO getInquiryView(int idx) {
		return qnaDAO.getInquiryView(idx);
	}

	@Override
	public QnaReplyVO getInquiryReply(int idx) {
		return qnaDAO.getInquiryReply(idx);
	}

	
}
