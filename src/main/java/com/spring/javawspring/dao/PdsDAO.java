package com.spring.javawspring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javawspring.vo.PdsVO;

public interface PdsDAO {

	public int totRecCnt(@Param("part") String part);

	public List<PdsVO> getPdsList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("part") String part);

	public void setPdsInput(@Param("vo") PdsVO vo);

	public void setPdsDownNum(@Param("idx") int idx);

	public PdsVO getPdsContent(@Param("idx") int idx);

	public void setPdsDelete(@Param("idx") int idx);

}
