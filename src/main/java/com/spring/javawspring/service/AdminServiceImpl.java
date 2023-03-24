package com.spring.javawspring.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javawspring.common.ProjectSupport;
import com.spring.javawspring.dao.AdminDAO;
import com.spring.javawspring.vo.DbShopNoticeVO;
import com.spring.javawspring.vo.QnaReplyVO;
import com.spring.javawspring.vo.QnaVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO adminDAO;

	@Override
	public int setMemberLevelCheck(int idx, int level) {
		return adminDAO.setMemberLevelCheck(idx, level);
	}

	@Override
	public void setQnaInputAdmin(QnaReplyVO vo) {
		adminDAO.setQnaInputAdmin(vo);
	}

	@Override
	public void setQnaUpdateAdmin(int qnaIdx) {
		adminDAO.setQnaUpdateAdmin(qnaIdx);
	}

	@Override
	public List<QnaVO> getAdQnaList(int startIndexNo, int pageSize, String part) {
		return adminDAO.getAdQnaList(startIndexNo, pageSize,part);
	}

	@Override
	public QnaVO getQnaContent(int idx) {
		return adminDAO.getQnaContent(idx);
	}

	@Override
	public QnaReplyVO getQnaReplyContent(int idx) {
		return adminDAO.getQnaReplyContent(idx);
	}

	@Override
	public void setNoticeInput(MultipartFile file, DbShopNoticeVO noticeVo) {
		// 사진작업 처리후 DB에 저장
		try {
			String oFileName = file.getOriginalFilename();
			if(oFileName != null && !oFileName.equals("")) {
				UUID uid = UUID.randomUUID();
				String saveFileName = uid + "_" + oFileName;
				ProjectSupport ps = new ProjectSupport();
				ps.writeFile(file, saveFileName,"notice");
				noticeVo.setFName(oFileName);
				noticeVo.setFSName(saveFileName);
			}
			adminDAO.noticeInputOk(noticeVo);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public DbShopNoticeVO getNotifyUpdate(int idx) {
		return adminDAO.getNotifyUpdate(idx);
	}

	@Override
	public int setPopupCheckUpdate(int idx, String popupSw) {
		adminDAO.setPopupCheckUpdate(idx,  popupSw);
		return 1;
	}

	@Override
	public DbShopNoticeVO getNotifyView(int idx) {
		return adminDAO.getNotifyView(idx);
	}

	@Override
	public List<DbShopNoticeVO> getNoticePopup() {
		return adminDAO.getNoticePopup();
	}
}
