package com.spring.javawspring;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javawspring.common.ProjectSupport;
import com.spring.javawspring.pagination.PageProcess;
import com.spring.javawspring.pagination.PageVO;
import com.spring.javawspring.service.QnaService;
import com.spring.javawspring.vo.QnaReplyVO;
import com.spring.javawspring.vo.QnaVO;

@Controller
@RequestMapping("/qna")
public class QnaController {
  String msgFlag = "";
  
  @Autowired
  QnaService qnaService;
  
  @Autowired
  PageProcess pageProcess;
  
  @Autowired
  ProjectSupport projectSupport;
	
  @RequestMapping(value = "/qnaList", method = RequestMethod.GET)
  public String qnaListGet(HttpSession session,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			@RequestParam(name="pageSize", defaultValue="10", required=false) int pageSize,
			@RequestParam(name="part", defaultValue="전체", required=false) String part,
			Model model) {
	  
		String mid = (String) session.getAttribute("sMid");
		
		PageVO pageVO = pageProcess.totRecCnt(pag, pageSize, "qna", part, mid);
		List<QnaVO> vos = qnaService.getQnaList(pageVO.getStartIndexNo(), pageSize,part , mid);
		model.addAttribute("vos", vos);
		model.addAttribute("pageVO", pageVO);
		
  	return "qna/qnaList";
  }
  
  @RequestMapping(value = "/qnaInput", method = RequestMethod.GET)
  public String qnaListGet() {
  	
  	return "qna/qnaInput";
  }
  
  @RequestMapping(value = "/qnaInput", method = RequestMethod.POST)
  public String qnaListPost(MultipartFile file, QnaVO vo) {
	  
	qnaService.qnaInputOk(file, vo);
  	
  	return "redirect:/msg/qnaInputOk";
  }
  
  // qna 작성글 보기
  @RequestMapping(value = "/qnaContent", method = RequestMethod.GET)
  public String qnaListGet(int idx,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
			Model model) {
		QnaVO vo = qnaService.getInquiryView(idx);
		
		// 해당 문의글의 답변글 가져오기
		QnaReplyVO reVO = qnaService.getInquiryReply(idx);

		model.addAttribute("vo", vo);
		model.addAttribute("reVO", reVO);
		model.addAttribute("pag", pag);
  	
  	return "qna/qnaContent";
  }
  
  
  // qna 업데이트 폼 보기
  @RequestMapping(value = "/qnaUpdate", method = RequestMethod.GET)
  public String qnaUpdateGet(Model model, int idx) {
  	QnaVO vo = qnaService.getQnaContent(idx);
  	model.addAttribute("vo", vo);
  	
  	return "qna/qnaUpdate";
  }
  
  // qna글 삭제하기
  @RequestMapping(value = "/qnaDelete", method = RequestMethod.GET)
  public String qnaDeleteGet(int idx) {
  	QnaVO vo = qnaService.getQnaContent(idx);
  	
    // content에 이미지가 저장되어 있다면, 저장된 이미지만 골라서 /resources/data/qna/폴더에서 삭제시켜준다.
   	if(vo.getContent().indexOf("src=\"/") != -1) {
   		projectSupport.imgDelete(vo.getContent(), "qna");	// 이미지를 ckeditor폴더에서 qna폴더로 복사하기   		
   	}
   	// 이미지 삭제작업이 끝나면, DB에서 자료를 삭제시켜준다.
   	qnaService.setQnaDelete(idx);
  	
  	return "redirect:/qna/qnaDelete";
  }
  
}
