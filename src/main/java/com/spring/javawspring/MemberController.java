package com.spring.javawspring;

import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javawspring.pagination.PageProcess;
import com.spring.javawspring.pagination.PageVO;
import com.spring.javawspring.service.DbshopService;
import com.spring.javawspring.service.MemberService;
import com.spring.javawspring.vo.DbBaesongVO;
import com.spring.javawspring.vo.DbProductVO;
import com.spring.javawspring.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	DbshopService dbShopService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping(value = "/memberLogin", method=RequestMethod.GET)
	public String memberLoginGet(HttpServletRequest request) {
		// 로그인폼 호출시에 기존에 저장된 쿠키가 있다면 불러와서 mid에 담아서 넘겨준다.
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				request.setAttribute("mid", cookies[i].getValue());
				break;
			}
		}
		return "member/memberLogin";
	}
	
	// 일반 로그인 OK 처리
		@RequestMapping(value = "/memberLogin", method=RequestMethod.POST)
		public String memberLoginPost(HttpServletRequest request, HttpServletResponse response, HttpSession session,
				@RequestParam(name="mid", defaultValue = "", required = false) String mid,
				@RequestParam(name="pwd", defaultValue = "", required = false) String pwd,
				@RequestParam(name="idCheck", defaultValue = "", required = false) String idCheck) {
			
			MemberVO vo = memberService.getMemberIdCheck(mid);
			
			if(vo != null && vo.getUserDel().equals("NO")) {
				String strLevel = "";
				if(vo.getLevel() == 0) strLevel = "관리자";
				else if(vo.getLevel() == 1) strLevel = "운영자";
				else if(vo.getLevel() == 2) strLevel = "우수회원";
				else if(vo.getLevel() == 3) strLevel = "정회원";
				else if(vo.getLevel() == 4) strLevel = "준회원";
				
				session.setAttribute("sLevel", vo.getLevel());
				session.setAttribute("sStrLevel", strLevel);
				session.setAttribute("sMid", mid);
				session.setAttribute("sNickName", vo.getNickName());
				
				if(idCheck.equals("on")) {
					Cookie cookie = new Cookie("cMid", mid);
					cookie.setMaxAge(60*60*24*7);
					response.addCookie(cookie);
				}
				else {
					Cookie[] cookies = request.getCookies();
					for(int i=0; i<cookies.length; i++) {
						if(cookies[i].getName().equals("cMid")) {
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
							break;
						}
					}
				}
				
				// 로그인한 사용자의 오늘 방문횟수(포인트) 누적...
				memberService.setMemberVisitProcess(vo);
				
				return "redirect:/msg/memberLoginOk?mid="+mid;
			}
			else {
				return "redirect:/msg/memberLoginNo";
			}
		}

		
	// 카카오 로그인 완료후 수행할 내용들을 기술한다.
	@RequestMapping(value="/memberKakaoLogin", method=RequestMethod.GET)
	public String memberKakaoLoginGet(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			String nickName,
			String email) {
		
		session.setAttribute("sLogin", "kakao");
		
		// 카카오로그인한 회원이 현재 우리 회원인지를 조회한다.
		// 이미 가입된 회원이라면 서비스를 사용하게 하고, 그렇지 않으면 강제로 회원 가입시킨다.
		MemberVO vo = memberService.getMemberNickNameEmailCheck(nickName, email);
		
		// 현재 우리회원이 아니면 자동회원가입처리..(가입필수사항: 아이디,닉네임,이메일) - 아이디는 이메일주소의 '@'앞쪽 이름을 사용하기로 한다.
		if(vo == null) {
			// 아이디 결정하기
			String mid = email.substring(0, email.indexOf("@"));
			
			// 같은 아이디가 존재하면 가입할 수 없도록 처리했다.
			MemberVO vo2 = memberService.getMemberIdCheck(mid);
			if(vo2 != null) return "redirect:/msg/midSameSearch";
			
			// 임시 비밀번호 발급하기(UUID 8자리로 발급하기로 한다. -> 발급후 암호화시켜 DB에 저장)
			UUID uid = UUID.randomUUID();
			String pwd = uid.toString().substring(0,8);
			session.setAttribute("sImsiPwd", pwd);	// 임시비밀번호를 발급하여 로그인후 변경처리하도록 한다.
			pwd = passwordEncoder.encode(pwd);
			
			// 새로 발급된 임시비밀번호를 메일로 전송처리한다.
			//  메일 처리부분... 생략함.
			
			// 자동 회원 가입처리한다.
			memberService.setKakaoMemberInputOk(mid, pwd, nickName, email);
			
			// 가입 처리된 회원의 정보를 다시 읽어와서 vo에 담아준다.
			vo = memberService.getMemberIdCheck(mid);
		}
		// 만약에 탈퇴신청한 회원이 카카오로그인처리하였다라면 'userDel'필드를 'NO'로 업데이트한다.
		if(!vo.getUserDel().equals("NO")) {
			memberService.setMemberUserDelCheck(vo.getMid());
		}
		
		// 회원 인증처리된 경우 수행할 내용? strLevel처리, session에 필요한 자료를 저장, 쿠키값처리, 그날 방문자수 1 증가(방문포인트도 증가), ..
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "관리자";
		else if(vo.getLevel() == 1) strLevel = "운영자";
		else if(vo.getLevel() == 2) strLevel = "우수회원";
		else if(vo.getLevel() == 3) strLevel = "정회원";
		else if(vo.getLevel() == 4) strLevel = "준회원";
		
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("sStrLevel", strLevel);
		session.setAttribute("sMid", vo.getMid());
		session.setAttribute("sNickName", vo.getNickName());
		
		// 로그인한 사용자의 오늘 방문횟수(포인트) 누적...
		memberService.setMemberVisitProcess(vo);
		
		return "redirect:/msg/memberLoginOk?mid="+vo.getMid();
	}
		

	@RequestMapping(value="/memberLogout", method=RequestMethod.GET)
	public String memberLogoutGet(HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		
		session.invalidate();
		
		return "redirect:/msg/memberLogout?mid="+mid;
	}
	
	// 회원가입폼
	@RequestMapping(value = "/memberJoin", method=RequestMethod.GET)
	public String memberJoinGet() {
		return "member/memberJoin";
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/memberIdCheck", method=RequestMethod.POST)
	public String memberIdCheckGet(String mid) {
		String res = "0";
		MemberVO vo = memberService.getMemberIdCheck(mid);
		
		if(vo != null) res = "1";
		
		return res;
	}
	
	//닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value = "/memberNickNameCheck", method=RequestMethod.POST)
	public String memberNickNameCheckGet(String nickName) {
		String res = "0";
		MemberVO vo = memberService.getMemberNickNameCheck(nickName);
		
		if(vo != null) res = "1";
		
		return res;
	}
	
	// 회원가입처리
	@RequestMapping(value = "/memberJoin", method=RequestMethod.POST)
	public String memberJoinPost(MemberVO vo) {
		
		// 아이디 중복 체크
		if(memberService.getMemberIdCheck(vo.getMid()) != null) {
			return "redirect:/msg/memberIdCheckNo";
		}
		// 닉네임 중복 체크
		if(memberService.getMemberNickNameCheck(vo.getNickName()) != null) {
			return "redirect:/msg/memberNickNameCheckNo";
		}
		
		// 비밀번호 암호화(BCryptPasswordEncoder)
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		// 체크가 완료되면 vo에 담긴 자료를 DB에 저장시켜준다.(회원 가입) - 서비스객체에서 수행처리했다.
		memberService.setMemberJoinOk(vo);
		
		return "redirect:/msg/memberJoinOk";
	}
	
	
	@RequestMapping(value = "/memberMain", method=RequestMethod.GET)
	public String memberMainGet(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("sMid");
		
		MemberVO vo = memberService.getMemberIdCheck(mid);
		model.addAttribute("vo", vo);
		
		return "member/memberMain";
	}
	
	// 비밀번호 변경하기 폼
	@RequestMapping(value = "/memberPwdUpdate", method = RequestMethod.GET)
	public String memberPwdUpdateGet() {
		return "member/memberPwdUpdate";
	}
	
	// 비밀번호 변경처리를 위한 비밀번호 확인 처리하기
	@ResponseBody 
	@RequestMapping(value = "/memberPwdUpdate", method = RequestMethod.POST)
	public String memberPwdCheckPost(String newPwd, String originPwd, String mid, String pwd) {
		MemberVO vo = memberService.getMemberIdCheck(mid);
		
		if(vo != null && passwordEncoder.matches(originPwd, vo.getPwd())) {
			return "redirect:/msg/memberPwdUpdateNo";
		}
		else {
			memberService.setMemberPwdUpdate(mid,passwordEncoder.encode(newPwd));
			return "res";
		}
	}
	
	// 정보 수정하기 폼
	@RequestMapping(value = "/memberInforUpdate", method = RequestMethod.GET)
	public String memberInforUpdateGet(String nickName,MemberVO vo,Model model) {
		System.out.println("vo"+vo);
		model.addAttribute("vo",vo);
		
		return "member/memberInforUpdate";
	}
	
	// 회원 정보 수정처리..
		@RequestMapping(value = "/memberInforUpdate", method = RequestMethod.POST)
		public String memberUpdateOkPost(MemberVO vo, HttpSession session) {
			System.out.println("post vo : " + vo);
			
			// 닉네임 체크
			String nickName = (String) session.getAttribute("sNickName");
			if(memberService.getMemberNickNameCheck(vo.getNickName()) != null && !nickName.equals(vo.getNickName())) {
				return "redirect:/msg/memberNickNameCheckNo2";
			}
			
			// 체크 완료된 자료를 다시 vo에 담았다면 파일체크처리후, DB에 저장시켜준다.(회원 수정처리)
			int res = memberService.setMemberUpdateOk(vo);
			
			if(res == 1) {
				session.setAttribute("sNickName", vo.getNickName());
				return "redirect:/msg/memberUpdateOk";
			}
			else return "redirect:/msg/memberUpdateNo";
		}
		
		//아이디 찾기 폼
		@RequestMapping(value = "/memberIdSearch", method = RequestMethod.GET)
		public String memberIdSearchGet() {
			return "member/memberIdSearch";
		}
		
		//아이디 찾기
		@RequestMapping(value = "/memberIdSearch", method = RequestMethod.POST)
		public String memberIdSearchPost(String email, Model model) {
			MemberVO vo = memberService.getMemberIdSearch(email);
			
			if(vo != null && vo.getEmail().equals(email)) {
				model.addAttribute("vo", vo);
				System.out.println("mid"+vo.getMid());
				return "member/memberIdSearchRes";
			}
			else {
				return "redirect:/msg/memberIdSearchNo";
			}
		}
		
		//비밀번호 찾기 폼
		@RequestMapping(value = "/memberPwdSearch", method = RequestMethod.GET)
		public String memberPwdSearchGet() {
			return "member/memberPwdSearch";
		}
		
		
		// 비밀번호 찾기를 위한 임시비밀번호처리(임시비밀번호를 생성시켜 메일로 보내기)
		@RequestMapping(value = "/memberPwdSearch", method = RequestMethod.POST)
		public String memberPwdSearchPost(String mid, String email) {
			MemberVO vo = memberService.getMemberIdCheck(mid);
			
			if(vo.getEmail().equals(email)) {
				// 회원정보가 맞다면 임시비밀번호를 받급받는다.
				UUID uid = UUID.randomUUID();
				String pwd = uid.toString().substring(0,8);
				
				// 발급받은 임시비밀번호를 암호화처리시켜서 DB에 저장한다.
				memberService.setMemberPwdUpdate(mid, passwordEncoder.encode(pwd));
				String content = pwd;
				
				// 임시비밀번호를 메일로 전송처리한다.
				String res = mailSend(email, content);
				
				if(res.equals("1")) return "redirect:/msg/memberImsiPwdOk";
				else return "redirect:/msg/memberImsiPwdNo";
			}
			else {
				return "redirect:/msg/memberImsiPwdNo";
			}
		}
		
		// 임시비밀번호를 메일로 전송하는 메소드
		public String mailSend(String toMail, String content) {
			try {
				String title = "League Of Legends 임시 비밀번호 발급";
				
				// 메일을 전송하기위한 객체 : MimeMessage() , MimeMessageHelper()
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				// 메일보관함에 회원이 보내온 메세지들을 모두 저장시킨다.
				messageHelper.setTo(toMail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);
				
				// 메세지 보관함의 내용(content)에 필요한 정보를 추가로 담아서 전송시킬수 있도록 한다.
				content += "<hr><p><img src=\"cid:main.jpg\" width='500px'></p>";
				content = "<h3>임시 비밀번호 : <font color='red'>"+content+"</font></h3><br>";
				content += "임시 비밀번호로 로그인 시 비밀번호를 변경해주세요!";
				content += "<hr>";
				messageHelper.setText(content, true);
				
				// 본문에 기재된 그림파일의 경로를 따로 표시시켜준다. 그리고, 보관함에 다시 저장시켜준다.
				FileSystemResource file = new FileSystemResource("D:\\JavaWorkspace\\springframework\\project\\works\\green2209S_02\\src\\main\\webapp\\resources\\images\\main.jpg");
				messageHelper.addInline("main.jpg", file);
				
				// 메일 전송하기
				mailSender.send(message);
				return "1";
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			return "0";
		}
		
		// 회원 탈퇴처리(userDel = 'No')
		@RequestMapping(value="/memberDelete", method=RequestMethod.GET)
		public String memberDelete() {

			
			return "member/memberDelete";
		}
		
		// 회원 탈퇴처리(userDel = 'No')
		@RequestMapping(value="/memberDelete", method=RequestMethod.POST)
		public String memberDelete(HttpSession session, Model model) {
			
			String mid = (String) session.getAttribute("sMid");
			memberService.setMemberDeleteOk(mid);
			
			session.invalidate();
			
			model.addAttribute("mid", mid);
			
			return "redirect:/msg/memberDeleteOk";
		}
		
		@RequestMapping(value="/myPageMain", method=RequestMethod.GET)
		public String myPageMainGet(HttpServletRequest request, HttpSession session, Model model,
				@RequestParam(name="pag", defaultValue="1", required=false) int pag,
				@RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize) {
			
			// 1. 마이 오더
			String mid = (String) session.getAttribute("sMid");
			int level = (int) session.getAttribute("sLevel");
			if(level == 0) mid = "전체";
			
			PageVO pageVo = pageProcess.totRecCnt(pag, pageSize, "dbMyOrder", mid, "");
			
			// 오늘 구매한 내역을 초기화면에 보여준다.
			List<DbProductVO> vos = dbShopService.getMyOrderList(pageVo.getStartIndexNo(), pageSize, mid);
			model.addAttribute("vos", vos);
			model.addAttribute("pageVo",pageVo);
			
			
			return "member/myPageMain";
		}
		
		// 날짜별 상태별 기존제품 구매한 주문내역 확인하기
		@RequestMapping(value="/myOrderStatus", method=RequestMethod.GET)
		public String myOrderStatusGet(
				HttpServletRequest request, 
				HttpSession session, 
				String startJumun, 
				String endJumun, 
				@RequestParam(name="pag", defaultValue="1", required=false) int pag,
				@RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize,
				@RequestParam(name="conditionOrderStatus", defaultValue="전체", required=false) String conditionOrderStatus,
				Model model) {
			String mid = (String) session.getAttribute("sMid");
			int level = (int) session.getAttribute("sLevel");
			
			if(level == 0) mid = "전체";
			String searchString = startJumun + "@" + endJumun + "@" + conditionOrderStatus;
			PageVO pageVo = pageProcess.totRecCnt(pag, pageSize, "myOrderStatus", mid, searchString);  // 4번째인자에 '아이디/조건'(을)를 넘겨서 part를 아이디로 검색처리하게 한다.
			
			List<DbBaesongVO> vos = dbShopService.getMyOrderStatus(pageVo.getStartIndexNo(), pageSize, mid, startJumun, endJumun, conditionOrderStatus);
			model.addAttribute("vos", vos);				
			model.addAttribute("startJumun", startJumun);
			model.addAttribute("endJumun", endJumun);
			model.addAttribute("conditionOrderStatus", conditionOrderStatus);
			model.addAttribute("pageVo", pageVo);
			
			return "member/myPageMain";
		}
		
}
		
	
