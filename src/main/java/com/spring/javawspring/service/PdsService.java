package com.spring.javawspring.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javawspring.vo.PdsVO;

public interface PdsService {

	public List<PdsVO> getPdsList(int startIndexNo, int pageSize, String part);

	public void setPdsInput(MultipartHttpServletRequest file, PdsVO vo);

	public void setPdsDownNum(int idx);

	public PdsVO getPdsContent(int idx);

	public void setPdsDelete(PdsVO vo);

}
