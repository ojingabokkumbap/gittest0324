package com.spring.javawspring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {
	
	@RequestMapping(value="/msg/{msgFlag}", method=RequestMethod.GET)
	public String msgGet(@PathVariable String msgFlag, Model model,
			@RequestParam(value="mid", defaultValue = "", required = false) String mid,
			@RequestParam(value="flag", defaultValue = "", required = false) String flag) {
		
		if(msgFlag.equals("memberLoginOk")) {
			model.addAttribute("msg", mid + "님 로그인 되었습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("memberLogout")) {
			model.addAttribute("msg", mid + "님 로그아웃 되셨습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("memberLoginNo")) {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인하세요.");
			model.addAttribute("url", "member/memberLogin");
		}
		else if(msgFlag.equals("memberJoinOk")) {
			model.addAttribute("msg", "회원 가입되었습니다.");
			model.addAttribute("url", "member/memberLogin");
		}
		else if(msgFlag.equals("memberIdCheckNo")) {
			model.addAttribute("msg", "이미 사용중인 아이디 입니다.");
			model.addAttribute("url", "member/memberJoin");
		}
		else if(msgFlag.equals("memberNickNameCheckNo")) {
			model.addAttribute("msg", "이미 사용중인 닉네임 입니다.");
			model.addAttribute("url", "member/memberJoin");
		}
		else if(msgFlag.equals("memberNickNameCheckNo2")) {
			model.addAttribute("msg", "이미 사용중인 닉네임입니다.");
			model.addAttribute("url", "member/memberInforUpdate");
		}
		
		else if(msgFlag.equals("dbProductInputOk")) {
			model.addAttribute("msg", "상품이 등록되었습니다.");
			model.addAttribute("url", "dbShop/dbCategory");
		}
		else if(msgFlag.equals("memberNo")) {
			model.addAttribute("msg", "로그인후 사용하세요");
			model.addAttribute("url", "member/memberLogin");
		}
		else if(msgFlag.equals("levelCheckNo")) {
			model.addAttribute("msg", "등급을 확인하세요");
			model.addAttribute("url", "member/memberMain");
		}
		else if(msgFlag.equals("memberImsiPwdOk")) {
			model.addAttribute("msg", "임시 비밀번호를 발송했습니다.\\n메일을 확인하세요.");
			model.addAttribute("url", "member/memberLogin");
		}
		else if(msgFlag.equals("memberImsiPwdNo")) {
			model.addAttribute("msg", "존재하지 않는 회원 정보입니다 \\n아이디 또는 이메일을 확인하세요.");
			model.addAttribute("url", "member/memberPwdSearch");
		}
		else if(msgFlag.equals("memberIdSearchNo")) {
			model.addAttribute("msg", "존재하지 않는 회원 정보입니다 \\n이메일을 확인하세요.");
			model.addAttribute("url", "member/memberIdSearch");
		}

		else if(msgFlag.equals("fileUploadOk")) {
			model.addAttribute("msg", "파일이 업로드 되었습니다.");
			model.addAttribute("url", "study/fileUpload/fileUploadForm");
		}
		else if(msgFlag.equals("fileUploadNo")) {
			model.addAttribute("msg", "파일이 업로드 실패~~");
			model.addAttribute("url", "study/fileUpload/fileUploadForm");
		}
		else if(msgFlag.equals("memberPwdCheckNo")) {
			model.addAttribute("msg", "비밀번호가 틀립니다. 확인해 보세요.");
			model.addAttribute("url", "member/memberPwdUpdate?flag=pwdCheck");
		}
		else if(msgFlag.equals("memberPwdCheckNo")) {
			model.addAttribute("msg", "비밀번호가 틀립니다. 확인해 보세요.");
			model.addAttribute("url", "member/memberPwdUpdate?flag=pwdCheck");
		}
		else if(msgFlag.equals("memberUpdateOk")) {
			model.addAttribute("msg", "회원 정보가 수정되었습니다.");
			model.addAttribute("url", "member/memberInforUpdate");
		}
		else if(msgFlag.equals("memberUpdateNo")) {
			model.addAttribute("msg", "회원 정보 수정에 실패하였습니다.");
			model.addAttribute("url", "member/memberPwdUpdate");
		}
		else if(msgFlag.equals("memberDeleteOk")) {
			model.addAttribute("msg", "회원 탈퇴되었습니다.");
			model.addAttribute("url", "member/memberLogin");
		}
		else if(msgFlag.equals("Cartgogo")) {
			model.addAttribute("url", "dbShop/dbCart");
		}
		else if(msgFlag.equals("dbHere")) {
			model.addAttribute("url", "dbShop/dbProductContent");
		}
		else if(msgFlag.equals("boardInputNo")) {
			model.addAttribute("msg", "게시글이 등록되었습니다.");
			model.addAttribute("url", "board/boardInput");
		}
		else if(msgFlag.equals("boardDeleteOk")) {
			model.addAttribute("msg", "게시글이 삭제되었습니다.");
			model.addAttribute("url", "board/boardList"+flag);
		}
		else if(msgFlag.equals("boardUpdateOk")) {
			model.addAttribute("msg", "게시글이 수정되었습니다.");
			model.addAttribute("url", "board/boardList"+flag);
		}
		else if(msgFlag.equals("pdsInputOk")) {
			model.addAttribute("msg", "자료실에 파일이 업로드 되었습니다.");
			model.addAttribute("url", "pds/pdsList");
		}
		else if(msgFlag.equals("dbOptionInputOk")) {
			model.addAttribute("msg", "옵션이 등록되었습니다.");
			model.addAttribute("url", "dbShop/dbCategory");
		}
		else if(msgFlag.equals("paymentResultOk")) {
			model.addAttribute("msg", "주문이 완료되었습니다.");
			model.addAttribute("url", "dbShop/paymentResultOk");
		}
		else if(msgFlag.equals("dbShopNoticeList")) {
			model.addAttribute("msg", "글이 작성되었습니다.");
			model.addAttribute("url", "dbShop/adNoticeInputOk");
		}
		else if(msgFlag.equals("dbShopNoticeDel")) {
			model.addAttribute("msg", "게시글이 삭제되었습니다.");
			model.addAttribute("url", "dbShop/dbShopNoticeList");
		}
		else if(msgFlag.equals("dbShopNoticeUpdateOk")) {
			model.addAttribute("msg", "게시글이 수정되었습니다.");
			model.addAttribute("url", "dbShop/dbShopNoticeContent");
		}
		else if(msgFlag.equals("ReviewInputOk")) {
			model.addAttribute("msg", "리뷰가 등록되었습니다.");
			model.addAttribute("url", "dbShop/dbMyOrder");
		}
		else if(msgFlag.equals("couponInputOk")) {
			model.addAttribute("msg", "쿠폰이 등록되었습니다.");
			model.addAttribute("url", "dbShop/couponInput");
		}
		else if(msgFlag.equals("couponDownOk")) {
			model.addAttribute("msg", "쿠폰 받기가 완료되었습니다.");
			model.addAttribute("url", "dbShop/dbShopNoticeList");
		}
		else if(msgFlag.equals("couponDownNo")) {
			model.addAttribute("msg", "이미 보유한 쿠폰입니다.");
			model.addAttribute("url", "dbShop/dbShopNoticeList");
		}
		else if(msgFlag.equals("qnaInputOk")) {
			model.addAttribute("msg", "글이 등록되었습니다.");
			model.addAttribute("url", "qna/qnaList");
		}
		else if(msgFlag.equals("noticeInputOk")) {
			model.addAttribute("msg", "글이 등록되었습니다.");
			model.addAttribute("url", "admin/notice/adNoticeList");
		}
		else if(msgFlag.equals("cartInputOk")) {
			model.addAttribute("msg", "장바구니에 상품이 등록되었습니다.");
			model.addAttribute("url", "dbShop/dbCart");
		}
		else if(msgFlag.equals("cartOrderOk")) {
			model.addAttribute("msg", "상품 구매페이지로 이동합니다.");
			model.addAttribute("url", "dbShop/dbCart");
		}
		
		
		return "include/message";
	}
}
