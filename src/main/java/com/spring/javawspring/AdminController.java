package com.spring.javawspring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javawspring.pagination.PageProcess;
import com.spring.javawspring.pagination.PageVO;
import com.spring.javawspring.service.AdminService;
import com.spring.javawspring.service.DbshopService;
import com.spring.javawspring.service.MemberService;
import com.spring.javawspring.service.QnaService;
import com.spring.javawspring.vo.CouponIssueVO;
import com.spring.javawspring.vo.DbOrderVO;
import com.spring.javawspring.vo.DbShopNoticeVO;
import com.spring.javawspring.vo.MemberVO;
import com.spring.javawspring.vo.QnaReplyVO;
import com.spring.javawspring.vo.QnaVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	String msgFlag = "";
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	DbshopService dbshopService;
	
	@Autowired
	QnaService qnaService;
	
	@RequestMapping(value = "/adminMain", method=RequestMethod.GET)
	public String adminMainGet(Model model,
			@RequestParam(name="part", defaultValue="line", required=false) String part
			) {
		
		List<MemberVO> vos = null;
			vos = memberService.getRecentlyVisitCount(2);
			String[] visitDates = new String[7];
			int[] visitDays = new int[7];	// line차트는 x축과 y축이 모두 숫자가 와야하기에 날짜중에서 '일'만 담기로 한다.(정수타입으로)
			int[] visitCounts = new int[7];
			for(int i=0; i<7; i++) {
				visitDates[i] = vos.get(i).getLastDate();
				visitDays[i] = 7 - i;
				visitCounts[i] = vos.get(i).getVisitCnt();
			}
			
			//멤버아이디 챙겨오는 법 여쭈어보기~
			MemberVO topTitle = memberService.getMemberIdVisitCnt();
			
			
			model.addAttribute("visitCnt", "방문횟수");
			model.addAttribute("legend", "방문 총횟수");
			model.addAttribute("xTitle", "회원아이디");
			model.addAttribute("legend", "방문 총횟수");
			model.addAttribute("topTitle", topTitle);
			model.addAttribute("topTitle", "멤버아이디");
			model.addAttribute("part", part);
			model.addAttribute("visitDates", visitDates);
			model.addAttribute("visitDays", visitDays);
			model.addAttribute("visitCounts", visitCounts);
			
			//7일 총 수입
			int totalSum = memberService.getTotalPriceSum();
			model.addAttribute("totalSum", totalSum);
			 
			//주문수
			 int totalOrder = memberService.getTotalOrder();
			 model.addAttribute("totalOrder", totalOrder);
			 
			 
			//총회원
			 int memberCnt =  memberService.getMemberCnt();
			 model.addAttribute("memberCnt", memberCnt);			 
			 
			 
			//미답변
			int noReply = memberService.getNoreply();
			model.addAttribute("noReply", noReply);	
			 
			
			//신규회원 챙겨오기
			List<MemberVO> newMember = memberService.getNewMember();
			model.addAttribute("newMember", newMember);
			
		
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "/member/adminMemberList", method = RequestMethod.GET)
	public String adminMemberListGet(Model model,
			@RequestParam(name="mid", defaultValue = "", required = false) String mid,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize) {
		
		PageVO pageVo = pageProcess.totRecCnt(pag, pageSize, "member", "", mid);
		
		List<MemberVO> vos = memberService.getMemberList(pageVo.getStartIndexNo(), pageSize, mid);
		
		model.addAttribute("vos", vos);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("mid", mid);
		
		return "admin/member/adminMemberList";
	}
	
	// 회원 등급 변경하기
	@ResponseBody
	@RequestMapping(value = "/member/adminMemberLevel", method = RequestMethod.POST)
	public String adminMemberLevelPost(int idx, int level) {
		int res = adminService.setMemberLevelCheck(idx, level);
		return res+"";
	}
	
	// 관리자 답변달기 저장하기
	@ResponseBody
	@RequestMapping(value="/QnaReplyInput", method = RequestMethod.POST)
	public String adInquiryReplyInputPost(QnaReplyVO vo, Model model) {
		adminService.setQnaInputAdmin(vo);
		adminService.setQnaUpdateAdmin(vo.getQnaIdx());
		
		return "qna/qnaContent";
	}
	

	  @RequestMapping(value = "/qna/adQnaList", method = RequestMethod.GET)
	  public String qnaListGet(HttpSession session,
				@RequestParam(name="pag", defaultValue="1", required=false) int pag,
				@RequestParam(name="pageSize", defaultValue="10", required=false) int pageSize,
				@RequestParam(name="part", defaultValue="전체", required=false) String part,
				Model model) {
		  
			
			PageVO pageVo = pageProcess.totRecCnt(pag, pageSize, "qna", part, "");
			
			List<QnaVO> vos = adminService.getAdQnaList(pageVo.getStartIndexNo(), pageSize,part);
			
		    model.addAttribute("vos", vos);
			model.addAttribute("pageVo", pageVo);
			model.addAttribute("part", part);
			
	  	return "admin/qna/adQnaList";
	  }	
	  
	 
	// 관리자 답변달기 폼 보여주기(관리자가 답변글 수정/삭제처리하였을때도 함께 처리하고 있다.)
	@RequestMapping(value="/qna/adQnaReply", method = RequestMethod.GET)
	public String adInquiryReplyGet(int idx,
			@RequestParam(name="part", defaultValue="전체", required=false) String part,
			@RequestParam(name="pag", defaultValue="1", required=false) int pag,
	    @RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize,
			Model model) {
		
		
		QnaVO vo = adminService.getQnaContent(idx);
		QnaReplyVO reVo = adminService.getQnaReplyContent(idx);
		model.addAttribute("part", part);
		model.addAttribute("pag", pag);
		model.addAttribute("vo", vo);
		model.addAttribute("reVo", reVo);
		
		return "admin/qna/adQnaReply";
	}
	
	
	
	// 공지사항리스트
	@RequestMapping(value="/notice/adNoticeList", method=RequestMethod.GET)
	public String dbShopNoticeListGet(Model model, HttpSession session,
			@RequestParam(name="idx", defaultValue = "0", required = false) int idx,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="part", defaultValue = "전체", required = false) String part
			) {
		
		
		PageVO pageVo = pageProcess.totRecCnt(pag,  pageSize, "dbShopNotice", part, "");
		List<DbShopNoticeVO> noticeVos = dbshopService.getdbShopNoticeList(pageVo.getStartIndexNo(), pageVo.getPageSize(), part);
		pageVo.setPart(part);
		
		model.addAttribute("noticeVos", noticeVos);
		model.addAttribute("pageVo", pageVo);
		
		
		return "admin/notice/adNoticeList";
	}
	
	// 공지사항 작성폼
	@RequestMapping(value="/adNoticeInput", method=RequestMethod.GET)
	public String adNoticeInputGet() {
		
		return "admin/notice/adNoticeInput";
	}
	
	// 공지사항 작성하기
	@RequestMapping(value="/adNoticeInput", method=RequestMethod.POST)
	public String adShopNoticeInputPost(Model model, DbShopNoticeVO noticeVo, MultipartFile file) {
		
		adminService.setNoticeInput(file, noticeVo);
		msgFlag = "noticeInputOk";
		
		return "redirect:/msg/" + msgFlag;
	}
	
	// 공지사항 팝업을 호출하는 메소드
	@RequestMapping(value="/popup", method=RequestMethod.GET)
	public String popupGet(int idx, Model model) {
		System.out.println("idx"+idx);
		DbShopNoticeVO vo = adminService.getNotifyUpdate(idx);  // idx로 검색된 공지사항의 정보를 가져온다.(가져온 정보는 무조건 popupSw가 'Y'로 되어 있다)
		model.addAttribute("vo", vo);
		return "admin/notice/popup";
	}
	
	// 여러개의 리턴값을 반환하는 경우....
	@ResponseBody
	@RequestMapping(value="/popupCheck", method=RequestMethod.GET)
	public Map<Object, Object> popupCheck(int idx, String popupSw) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		adminService.setPopupCheckUpdate(idx, popupSw);
		
		map.put("idx", idx);
		map.put("sw", popupSw);
		
		return map;
	}
	
	// 공지사항 리스트 보기-첫화면에서(사이트에 방문한 모든 사용자가 볼수 있다.)
	@RequestMapping(value="/topNoticeList", method=RequestMethod.GET)
	public String topNoticeListGet(Model model) {
		//List<DbShopNoticeVO> vos = adminService.getNotifyList();
		//model.addAttribute("vos", vos);
		return "notify/topNoticeList";
	}
	
	// 공지사항 팝업으로 보기
	@RequestMapping(value="/noticeView", method=RequestMethod.GET)
	public String mnNotifyViewGet(int idx, Model model) {
		DbShopNoticeVO vo = adminService.getNotifyView(idx);
		model.addAttribute("vo", vo);
		
		return "notice/noticeView";
	}
}
