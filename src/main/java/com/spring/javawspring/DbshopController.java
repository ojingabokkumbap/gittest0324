package com.spring.javawspring;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javawspring.pagination.PageProcess;
import com.spring.javawspring.pagination.PageVO;
import com.spring.javawspring.service.AdminService;
import com.spring.javawspring.service.DbshopService;
import com.spring.javawspring.service.MemberService;
import com.spring.javawspring.vo.CouponDownVO;
import com.spring.javawspring.vo.CouponIssueVO;
import com.spring.javawspring.vo.DbBaesongVO;
import com.spring.javawspring.vo.DbCartVO;
import com.spring.javawspring.vo.DbOptionVO;
import com.spring.javawspring.vo.DbOrderVO;
import com.spring.javawspring.vo.DbProductVO;
import com.spring.javawspring.vo.DbShopNoticeVO;
import com.spring.javawspring.vo.MemberVO;
import com.spring.javawspring.vo.PayMentVO;
import com.spring.javawspring.vo.ReviewVO;
import com.spring.javawspring.vo.WishListVO;

@Controller
@RequestMapping("/dbShop")
public class DbshopController {

	@Autowired
	PageProcess pageProcess;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	DbshopService dbShopService;
	
	@Autowired
	AdminService adminService;
	
	

	
	// 移댄뀒怨좊━ �뤌
	@RequestMapping(value = "/dbCategory", method = RequestMethod.GET)
	public String dbCategoryGet(Model model) {
		List<DbProductVO> mainVos = dbShopService.getCategoryMain();
		List<DbProductVO> subVos = dbShopService.getCategorySub();
		
		model.addAttribute("mainVos", mainVos);
		model.addAttribute("subVos", subVos);
		
		return "dbShop/dbCategory";
	}
	
	
	// ��遺꾨쪟 �벑濡앺븯湲�
	@ResponseBody
	@RequestMapping(value = "/categoryMainInput", method = RequestMethod.POST)
	public String categoryMainInputGet(DbProductVO vo) {
		// 湲곗〈�뿉 媛숈��씠由꾩쓽 ��遺꾨쪟媛� �엳�뒗吏�瑜� 泥댄겕�븳�떎.
		DbProductVO imsiVo = dbShopService.getCategoryMainOne(vo.getCategoryMainCode(), vo.getCategoryMainName());
		
		if(imsiVo != null) return "0";
		
		dbShopService.setCategoryMainInput(vo);  // ��遺꾨쪟�빆紐� ���옣
		
		return "1";
		}

	// �냼遺꾨쪟 �벑濡앺븯湲�
	@ResponseBody
	@RequestMapping(value = "/categorySubInput", method = RequestMethod.POST)
	public String categorySubInputGet(DbProductVO vo) {
		// 湲곗〈�뿉 媛숈��씠由꾩쓽 �냼遺꾨쪟媛� �엳�뒗吏�瑜� 泥댄겕�븳�떎.
		List<DbProductVO> vos = dbShopService.getCategorySubOne(vo);
		
		if(vos.size() != 0) return "0";
		dbShopService.setCategorySubInput(vo);  // �냼遺꾨쪟�빆紐� ���옣
		
		return "1";
	}

	
	// ��遺꾨쪟 �꽑�깮�떆 �냼遺꾨쪟 媛��졇�삤湲�
	@ResponseBody
	@RequestMapping(value="/categorySubName", method = RequestMethod.POST)
	public List<DbProductVO> categorySubNamePost(String categoryMainCode) {
		return dbShopService.getCategorySubName(categoryMainCode);
	}
	
	// 愿�由ъ옄 �긽�뭹�벑濡앹떆�뿉 ckeditor�뿉 洹몃┝�쓣 �삱由곕떎硫�(dbShop)  dbShop �뤃�뜑�뿉 ���옣�릺怨�,
	// ���옣�맂 �뙆�씪�쓣 釉뚮씪�슦�� textarea �긽�옄�뿉 蹂댁뿬以��떎. 
	@ResponseBody
	@RequestMapping("/imageUpload")
	public void imageUploadGet(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String originalFilename = upload.getOriginalFilename();
		
		Date date = new Date();
		//�씠由� 以묐났 諛⑹� -> �궇吏쒕줈 �씠由� �꽕�젙 
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		originalFilename = sdf.format(date) + "_" + originalFilename;
		
		byte[] bytes = upload.getBytes();
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/dbShop/");
		OutputStream outStr = new FileOutputStream(new File(uploadPath + originalFilename));
		outStr.write(bytes);
		
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/dbShop/" + originalFilename;
		out.println("{\"originalFilename\":\""+originalFilename+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");
		
		out.flush();
		outStr.close();
	}
	
	// �긽�뭹 �벑濡앺븯湲�
	@RequestMapping(value = "/dbProductInput" , method = RequestMethod.POST)
	public String dbProductPost(MultipartFile file,DbProductVO vo) {
		
		dbShopService.imgCheckProductInput(file, vo);
		
		return "redirect:/msg/dbProductInputOk";
	}
	
	
	// �냼遺꾨쪟 �꽑�깮 �떆 �냼遺꾨쪟 媛��졇�삤湲�
	@ResponseBody
	@RequestMapping(value = "/categoryProductName" , method = RequestMethod.POST)
	public List<DbProductVO> categoryProductNamePost(String categoryMainCode , String categoryMiddleCode, String categorySubCode){
		
		return dbShopService.getCategoryProductName(categoryMainCode,categorySubCode);
	}
	
	//�샃�뀡 �벑濡� 李쎌뿉�꽌 �긽�뭹�쓣 �꽑�깮�븯硫� �긽�뭹�쓽 �긽�꽭�꽕紐낆쓣 媛��졇���꽌 肉뚮━湲�
	@ResponseBody
	@RequestMapping(value="/getProductInfor", method = RequestMethod.POST)
	public DbProductVO getProductInforPost(String productName) {
		
		System.out.println("productName"+productName);
		return dbShopService.getProductInfor(productName);
	}
	
	// �벑濡앸맂 �긽�뭹 紐⑤몢 蹂댁뿬二쇨린(愿�由ъ옄�솕硫댁뿉�꽌 蹂댁뿬二쇰뒗 泥섎━遺�遺꾩씠�떎.) - �긽�뭹�쓽 �냼遺꾨쪟紐�(subTitle)�룄 �븿猿� 異쒕젰�떆耳쒖��떎.
	@RequestMapping(value = "/dbAdminProductList" , method = RequestMethod.GET)
	public String dbProductPost(@RequestParam(name="part", defaultValue="전체", required=false) String part , Model model,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "30", required = false) int pageSize
			) {
		
		// �냼遺꾨쪟紐낆쓣 媛��졇�삩�떎.
		List<DbProductVO> subTitleVos = dbShopService.getSubTitle();
		model.addAttribute("subTitleVos", subTitleVos);
		model.addAttribute("part", part);
		
		System.out.println("part"+part);
		
		PageVO pageVo = pageProcess.totRecCnt(pag,  pageSize, "dbProductNotice",part, "");
		List<DbProductVO> productVos = dbShopService.getDbShopList(pageVo.getStartIndexNo(), pageVo.getPageSize(), part);
		 model.addAttribute("productVos", productVos);
		
		return "dbShop/dbAdminProductList";
	}
	
	  // 吏꾩뿴�맂 �긽�뭹�겢由��떆 �빐�떦�긽�뭹�쓽 �긽�꽭�젙蹂� 蹂댁뿬二쇨린(�궗�슜�옄(怨좉컼)�솕硫댁뿉�꽌 蹂댁뿬二쇨린)
		@RequestMapping(value="/dbAdminProductContent", method=RequestMethod.GET)
		public String dbAdminProductContentGet(int idx, Model model) {
			DbProductVO productVo = dbShopService.getDBShopProduct(idx);			//1건의 상품정보 불러오기
			List<DbOptionVO> optionVos = dbShopService.getDbShopOption(idx);	// 해당 상품 옵션 가져오기
			
			model.addAttribute("productVo", productVo);
			model.addAttribute("optionVos", optionVos);
			
			return "dbShop/dbAdminProductContent";
		}
		
		
		// 옵션등록창에서 '옵셔보기'버튼클릭시에 해당 제품의 모든 옵션을 보여주기
		@ResponseBody
		@RequestMapping(value="/getOptionList", method = RequestMethod.POST)
		public List<DbOptionVO> getOptionListPost(int productIdx) {
			return dbShopService.getOptionList(productIdx);
		}
		
		// 옵션 기록사항들을 등록하기
		@RequestMapping(value="/dbOptionInput", method=RequestMethod.POST)
		public String dbOptionPost(Model model, DbOptionVO vo, String[] optionName, int[] optionPrice) {
			for(int i=0; i<optionName.length; i++) {
				//옵션중복체크
				int optionCnt = dbShopService.getOptionSame(vo.getProductIdx(), optionName[i]);
				if(optionCnt != 0) continue;
				
				// 동일한 옵션이 없으면 vo에 set시킨후 옵션테이블에 등록시킨다.
				vo.setProductIdx(vo.getProductIdx());
				vo.setOptionName(optionName[i]);
				vo.setOptionPrice(optionPrice[i]);
				
				dbShopService.setDbOptionInput(vo);
			}
				return "redirect:/msg/dbOptionInputOk";
		}
		
		// 쿠폰 등록
		@RequestMapping(value="/couponInput", method=RequestMethod.GET)
		public String couponInputGet(Model model) {
			
			List<CouponIssueVO> CouponVos = dbShopService.getCouponList();
			model.addAttribute("CouponVos", CouponVos);
			
			return "dbShop/couponInput";
		}			
		
		
		// 쿠폰 등록 (포스트)
		@RequestMapping(value="/couponInput", method=RequestMethod.POST)
		public String couponInputPost(CouponIssueVO vo) {
			
			dbShopService.couponInput(vo);
			
			return "redirect:/msg/couponInputOk";
		}		
		
		// 쿠폰 삭제
		@RequestMapping(value="/couponDel", method=RequestMethod.POST)
		public String couponInputDel(CouponIssueVO vo) {
			
			dbShopService.couponInput(vo);
			
			return "redirect:/msg/couponInputOk";
		}		
		
	
		//===================================================================고객
		
		//숍 메인
		@RequestMapping(value = "/dbShopMain", method = RequestMethod.GET)
		public String dbShopMainGet(@RequestParam(name="part", defaultValue="전체", required=false) String part,
				@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
				@RequestParam(name="pageSize", defaultValue = "30", required = false) int pageSize,
				Model model ,HttpSession session ) {
			List<DbProductVO> subTitleVos = dbShopService.getSubTitle();
			model.addAttribute("subTitleVos", subTitleVos);
			model.addAttribute("part", part);
			
			String mid = (String) session.getAttribute("sMid");
			
			int reply = dbShopService.getReplyCnt(mid);
			model.addAttribute("reply", reply);
			
			
			//List<DbProductVO> productVos = dbShopService.getDbShopList(part);
			PageVO pageVo = pageProcess.totRecCnt(pag,  pageSize, "dbProductNotice",part, "");
			List<DbProductVO> productVos = dbShopService.getDbShopList(pageVo.getStartIndexNo(), pageVo.getPageSize(), part);
			model.addAttribute("productVos", productVos);
			
			// 첫화면에 공지사항 팝업으로 띄우기
			List<DbShopNoticeVO> popupVos = adminService.getNoticePopup();
			model.addAttribute("popupVos", popupVos);
			
			return "dbShop/dbShopMain";
		}
		
		//상품리스트
		@RequestMapping(value = "/dbProductList", method = RequestMethod.GET)
		public String dbProductListGet(Model model, 
				@RequestParam(name="part", defaultValue="전체", required=false) String part,
				@RequestParam(name="productIdx", defaultValue="0", required=false) int productIdx,
				@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
				@RequestParam(name="pageSize", defaultValue = "72", required = false) int pageSize		
				) {
			
			PageVO pageVo = pageProcess.totRecCnt(pag, pageSize, "dbProductList",part, "");
			List<DbProductVO> productVos = dbShopService.getDbShopList(pageVo.getStartIndexNo(), pageVo.getPageSize(), part);
			// List<DbProductVO> productVos = dbShopService.getDbShopList(part);
			model.addAttribute("productVos", productVos);
			
			System.out.println("pag"+pag);
			System.out.println("pageSize"+pageSize);
			
			List<DbProductVO> subTitleVos = dbShopService.getSubTitle();
			model.addAttribute("subTitleVos", subTitleVos);
			model.addAttribute("part", part);
			System.out.println("part : " + part);
			
			
			return "dbShop/dbProductList";
		}
		
		
	  // 진열된 상품클릭시 해당상품의 상세정보 보여주기(사용자(고객)화면에서 보여주기)
		@SuppressWarnings({ "unchecked", "rawtypes" })
		@RequestMapping(value="/dbProductContent", method=RequestMethod.GET)
		public String dbProductContentGet(Model model, HttpSession session,
				@RequestParam(name="idx", defaultValue = "0", required = false) int idx,
				@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
				@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
				@RequestParam(name="part", defaultValue = "전체", required = false) String part, 
				@RequestParam(name="productIdx", defaultValue = "0", required = false) int productIdx) {
			
			PageVO pageVo = pageProcess.totRecCnt(pag,  pageSize, "dbShopNotice", part, "");
			List<DbShopNoticeVO> noticeVos = dbShopService.getdbShopNoticeList(pageVo.getStartIndexNo(), pageVo.getPageSize(), part);
			pageVo.setPart(part);
			
			model.addAttribute("noticeVos", noticeVos);
			model.addAttribute("pageVo", pageVo);
			
			
			DbProductVO productVo = dbShopService.getDBShopProduct(idx);			// 상품의 상세정보 불러오기
			List<DbOptionVO> optionVos = dbShopService.getDbShopOption(idx);	// 옵션의 모든 정보 불러오기
			
			
			//리뷰 리스트 
			List<ReviewVO> reviewVos = dbShopService.getReviewList(idx);
			model.addAttribute("reviewVos", reviewVos);
			
			System.out.println("reviewVos"+reviewVos);
			
			model.addAttribute("productVo", productVo);
			model.addAttribute("optionVos", optionVos);
			
			
			// 해당글에 '좋아요' 버튼을 클릭하였었다면 '좋아요세션'에 아이디를 저장시켜두었기에 찾아서 있다면 sSw값을 1로 보내어 하트색을 빨강색으로 변경유지하게한다.(세션이 끈기면 다시 초기화 된다.)
			ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
			if(goodIdx == null) {
				goodIdx = new ArrayList<String>();
			}
			String imsiGoodIdx = "ReviewGood" + idx;
			if(goodIdx.contains(imsiGoodIdx)) {
				session.setAttribute("sSw", "1");		// 로그인 사용자가 이미 좋아요를 클릭한 게시글이라면 빨강색으로 표시가히위해 sSW에 1을 전송하고 있다.
			}
			else {
				session.setAttribute("sSw", "0");
			}
			
			
			return "dbShop/dbProductContent";
		}
		
		//찜하기
		@ResponseBody
		@RequestMapping(value="/wishListInput", method=RequestMethod.POST)
		public String wishListInput(Model model, WishListVO wishListVo, DbProductVO dbProductVo,
				int productIdx, int idx){
			
			String res= "0";
			

			//이미 wishList에 있는지 확인하기
			int wishListCnt = dbShopService.getWishListCheck(wishListVo.getMid(), dbProductVo.getIdx());
			
			//있으면 저장
			if(wishListCnt == 0) {
				wishListVo.setProductIdx(dbProductVo.getIdx());
				dbShopService.setWishListInput(wishListVo);
				res = "1";
			}
			
			return res;
		}
		
		// 좋아요수 증가처리하기
		// 좋아요 버튼을 클릭했을때 처리(처음으로 '좋아요'누르면 1을, 이미 '좋아요'가 한번이라도 눌렸었다면 '0'을 돌려준다.
		@SuppressWarnings({ "unchecked", "rawtypes"})
		@ResponseBody
		@RequestMapping(value = "/reviewGood", method = RequestMethod.POST)
		public String ReviewGoodGet(HttpSession session, int idx) {
			String res = "0"; // 처음 0으로 셋팅하고, 처음 좋아요 버튼을 누르면 '1'을 돌려준다., 이미 '좋아요'를 한번 눌렀으면 '0'으로 res값을 보내준다.
			ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
			if(goodIdx == null) {
				goodIdx = new ArrayList<String>();
			}
			
			String imsiGoodIdx = "ReviewGood" + idx;
			if(!goodIdx.contains(imsiGoodIdx)) {
				dbShopService.setReviewGoodPlus(idx);
				goodIdx.add(imsiGoodIdx);
				res = "1";	// 처음으로 좋아요 버튼을 클릭하였기에 '1'을 반환
			}
			session.setAttribute("sGoodIdx", goodIdx);
			
			return res;	// '좋아요'를 이미 눌렸을때 이곳으로 들어오면 처음설정값인 res는 '0'을 반환, 처음 눌렀으면 '1'을 반환~~
		}
			
		
		//상품 상세정보 보기창에서 '장바구니' 버튼 , '주문하기' 버튼을 클릭하면 모두 이 곳을 거쳐 이동처리했다.
		// '장바구니'버튼에서는 '다시 쇼핑하기'처리했고, '주문하기'버튼에서는 '주문창'으로 보내도록 처리했다.
		@RequestMapping(value="/dbProductContent", method=RequestMethod.POST)  //어디에서 보냈는지 체크하는 flag
		public String dbProductContentPost(DbCartVO vo, HttpSession session, String flag) {
			
			String mid = (String) session.getAttribute("sMid");
			//장바구니에서 내가 장바구니에 넣은 상품(이름/옵션) 뿌리기
			DbCartVO resVo = dbShopService.getDbCartProductOptionSearch(vo.getProductName(), vo.getOptionName(), mid);
			//DbCartVO(vo) : 사용자가 선택한 품목(기본품목 + 옵션)의 정보를 담고 있는 VO
			//DbCartVO(resVo) : 사용자가 기존에 장바구니에 담은 적 이 있는 품목(기본+옵션)의 정보를 담고있는 VO
			
//				냉장고 . 1 (0) , 1300000
//				탈취제 , 2 (1) , 15000
//				칸막이 , 2 (2) , 5000
			if(resVo != null) { 
				String[] voOptionNums = vo.getOptionNum().split(",");
				String[] resOptionNums = resVo.getOptionNum().split(",");
				int[] nums = new int[99];
				String strNums = "";
				for(int i=0; i<voOptionNums.length; i++) {
					nums[i] += (Integer.parseInt(voOptionNums[i]) + Integer.parseInt(resOptionNums[i]));
					strNums += nums[i];
					if(i < nums.length - 1) strNums += ",";
				}
				vo.setOptionNum(strNums);
				// 기존에 구매한 적이 있으면 '현재 구매 내역'과 '기존 장바구니의 수량'을 합쳐 update한다.
				dbShopService.dbShopCartUpdate(vo);
			}
			else {
				// 처음 구매하는 제품이라면 장바구니에 insert한다.
				dbShopService.dbShopCartInput(vo);
			}
			
			if(flag.equals("order")) {
				return "redirect:/msg/cartOrderOk";
			}
			else {
				return "redirect:/msg/cartInputOk";
			}
		}
		
		
		
		//장바구니
		@RequestMapping(value="/dbCart", method=RequestMethod.GET)
		public String dbCartGet(@RequestParam(name="part", defaultValue="전체", required=false) String part,
				HttpSession session, Model model) {
			
			List<DbProductVO> subTitleVos = dbShopService.getSubTitle();
			model.addAttribute("subTitleVos", subTitleVos);
			model.addAttribute("part", part);
			
			//List<DbProductVO> productVos = dbShopService.getDbShopList(part);
			// model.addAttribute("productVos", productVos);
			
			String mid = (String) session.getAttribute("sMid");
			List<DbCartVO> vos = dbShopService.getDbCartList(mid);
			
			model.addAttribute("cartListVos", vos);
			
			return "dbShop/dbCart";
		}
		

		
		
		
		
		@ResponseBody
		@RequestMapping(value="/dbCartDelete", method=RequestMethod.POST)
		public String dbCartDeleteGet(int idx) {
			dbShopService.dbCartDelete(idx);
			return "";
		}
		
		@ResponseBody
		@RequestMapping(value="/wishDelete", method=RequestMethod.POST)
		public String wishDeleteGet(int idx, WishListVO wishListVo) {
			dbShopService.wishDelete(idx);
			return "";
		}
		
		// 카트에 담겨있는 품목들중에서, 주문한 품목들을 읽어와서 세션에 담아준다. 이때 고객의 정보도 함께 처리하며, 주문번호를 만들어서 다음단계인 '결제'로 넘겨준다.
		@RequestMapping(value="/dbCart", method=RequestMethod.POST)
		public String dbCartListPost(HttpServletRequest request, Model model, HttpSession session,String cName,
				@RequestParam(name="baesong", defaultValue = "0", required = false) int baesong,
				String address
				) {
			String mid = session.getAttribute("sMid").toString();
			
			// 주문한 상품에 대하여 '고유번호'를 만들어준다.
			// 고유주문번호(idx) = 기존에 존재하는 주문테이블의 고유번호 + 1
			DbOrderVO maxIdx = dbShopService.getOrderMaxIdx();
			int idx = 1;
			if(maxIdx != null) idx = maxIdx.getMaxIdx() + 1;
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String orderIdx = sdf.format(today) + idx;
					
			// 장바구니에서 구매를 위해 선택한 모든 항목들은 배열로 넘어온다.
			String[] idxChecked = request.getParameterValues("idxChecked");
			
			DbCartVO cartVo = new DbCartVO();
			List<DbOrderVO> orderVos = new ArrayList<DbOrderVO>();
			
			for(String strIdx : idxChecked) {
				cartVo = dbShopService.getCartIdx(Integer.parseInt(strIdx));
				DbOrderVO orderVo = new DbOrderVO();
				orderVo.setProductIdx(cartVo.getProductIdx());
				orderVo.setProductName(cartVo.getProductName());
				orderVo.setMainPrice(cartVo.getMainPrice());
				orderVo.setThumbImg(cartVo.getThumbImg());
				orderVo.setOptionName(cartVo.getOptionName());
				orderVo.setOptionPrice(cartVo.getOptionPrice());
				orderVo.setOptionNum(cartVo.getOptionNum());
				orderVo.setTotalPrice(cartVo.getTotalPrice());
				orderVo.setCartIdx(cartVo.getIdx());
				orderVo.setBaesong(baesong);
				
				orderVo.setOrderIdx(orderIdx);	// 관리자가 만들어준 '주문고유번호'를 저장
				orderVo.setMid(mid);						// 로그인한 아이디를 저장한다.
				
				orderVos.add(orderVo);
			}
			session.setAttribute("sOrderVos", orderVos);
			

			
			//주문에서 내가 가지고있는 쿠폰 확인
			ArrayList<CouponDownVO> couponDownVos = dbShopService.getCouponDownList(mid);
			model.addAttribute("couponDownVo", couponDownVos);
			model.addAttribute("CouponCnt", couponDownVos.size());
			model.addAttribute("cName", cName);
			
			//배송지 호출
			MemberVO memberVo = memberService.getMemberIdCheck(mid);
			model.addAttribute("memberVo", memberVo);
			
			ArrayList<DbBaesongVO> vos = dbShopService.getDbBaesongList(mid);
			model.addAttribute("vos", vos);
			model.addAttribute("cnt", vos.size());
			model.addAttribute("address", address);
			
			
			return "dbShop/dbOrder";
		}
		

		  // 결제시스템(결제창 호출하기) - API이용
		@RequestMapping(value="/payment", method=RequestMethod.POST)
		public String paymentPost(DbOrderVO orderVo, PayMentVO payMentVo, DbBaesongVO baesongVo, HttpSession session, Model model) {
			model.addAttribute("payMentVo", payMentVo);
			
			session.setAttribute("sPayMentVo", payMentVo);
			session.setAttribute("sBaesongVo", baesongVo);
			
			return "dbShop/paymentOk";
		}

		@ResponseBody
		@RequestMapping(value="/pay", method=RequestMethod.POST)
		public String samplePost(PayMentVO payMentVO) {
			return "dbShop/paymentOk";
		}
		
		
	//결제시스템 연습하기(결제창 호출후 결재 완료후에 처리하는 부분)
		// 주문 완료후 주문내역을 '주문테이블(dbOrder)에 저장
		// 주문이 완료되었기에 주문된 물품은 장바구니(dbCartList)에서 내역을 삭제처리한다.
		// 사용한 세션은 제거시킨다.
		// 작업처리후 오늘 구매한 상품들의 정보(구매품목,결제내역,배송지)들을 model에 담아서 확인창으로 넘겨준다.
		@SuppressWarnings("unchecked")
		@RequestMapping(value="/paymentResult", method=RequestMethod.GET)
		public String paymentResultGet(HttpSession session, PayMentVO receivePayMentVo, Model model, DbProductVO pvo, DbOrderVO ovo) {
			// 주문내역 dbOrder/dbBaesong 테이블에 저장하기(앞에서 저장했던 세션에서 가져왔다.)
			List<DbOrderVO> orderVos = (List<DbOrderVO>) session.getAttribute("sOrderVos");
			PayMentVO payMentVo = (PayMentVO) session.getAttribute("sPayMentVo");
			DbBaesongVO baesongVo = (DbBaesongVO) session.getAttribute("sBaesongVo");
			
//			사용된 세션은 반환한다.
//			session.removeAttribute("sOrderVos");  // 마지막 결재처리후에 결재결과창에서 확인하고 있기에 지우면 안됨
			session.removeAttribute("sBaesongVo");
			
			for(DbOrderVO vo : orderVos) {
				vo.setIdx(Integer.parseInt(vo.getOrderIdx().substring(8))); // 주문테이블에 고유번호를 셋팅한다.	
				vo.setOrderIdx(vo.getOrderIdx());        				// 주문번호를 주문테이블의 주문번호필드에 지정처리한다.
				vo.setMid(vo.getMid());							
				
				dbShopService.setDbOrder(vo);                 	// 주문내용을 주문테이블(dbOrder)에 저장.
				dbShopService.dbCartDeleteAll(vo.getCartIdx()); // 주문이 완료되었기에 장바구니(dbCart)테이블에서 주문한 내역을 삭체처리한다.
				
			}
			// 주문된 정보를 배송테이블에 담기위한 처리(기존 baesongVo에 담기지 않은 내역들을 담아주고 있다.)
			baesongVo.setOIdx(orderVos.get(0).getIdx());
			baesongVo.setOrderIdx(orderVos.get(0).getOrderIdx());
			baesongVo.setAddress(payMentVo.getBuyer_addr());
			baesongVo.setTel(payMentVo.getBuyer_tel());
			
			dbShopService.setDbBaesong(baesongVo);  // 배송내용을 배송테이블(dbBaesong)에 저장
			//배송지의 전체 값의 1% , 주문한 아이디
			dbShopService.setMemberPointPlus((int) (baesongVo.getOrderTotalPrice() * 0.01), orderVos.get(0).getMid());	// 회원테이블에 포인트 적립하기(1%)
			//주문한 상품이름, sell
			dbShopService.setProductSellPlus(pvo.getSell() , orderVos.get(0).getProductName());
			
			payMentVo.setImp_uid(receivePayMentVo.getImp_uid());
			payMentVo.setMerchant_uid(receivePayMentVo.getMerchant_uid());
			payMentVo.setPaid_amount(receivePayMentVo.getPaid_amount());
			payMentVo.setApply_num(receivePayMentVo.getApply_num());
			
			// 오늘 주문에 들어간 정보들을 확인해주기위해 다시 session에 담아서 넘겨주고 있다.
			session.setAttribute("sPayMentVo", payMentVo);
			session.setAttribute("orderTotalPrice", baesongVo.getOrderTotalPrice());
			
			return "redirect:/msg/paymentResultOk";
		}
		
		// 결재완료된 정보 보여주기
		@SuppressWarnings({ "unchecked" })
		@RequestMapping(value="/paymentResultOk", method=RequestMethod.GET)
		public String paymentResultOkGet(HttpSession session, Model model) {
			List<DbOrderVO> orderVos = (List<DbOrderVO>) session.getAttribute("sOrderVos");
			model.addAttribute("orderVos", orderVos);
			session.removeAttribute("sOrderVos");
			return "dbShop/paymentResult";
		}
		
		
		
		// 배송지 정보 보여주기
		@RequestMapping(value="/dbOrderBaesong", method=RequestMethod.GET)
		public String dbOrderBaesongGet(String orderIdx, Model model) {
			
			List<DbBaesongVO> vos = dbShopService.getOrderBaesong(orderIdx);  // 같은 주문번호가 2개 이상 있을수 있기에 List객체로 받아온다.
			model.addAttribute("vo", vos.get(0));  // 같은 배송지면 0번째것 하나만 vo에 담아서 넘겨주면 된다.
			
			return "dbShop/dbOrderBaesong";
		}
		
		// 현재 로그인 사용자가 주문내역 조회하기 폼 보여주기
		@RequestMapping(value="/dbMyOrder", method=RequestMethod.GET)
		public String dbMyOrderGet(HttpServletRequest request, HttpSession session, Model model,
				@RequestParam(name="pag", defaultValue="1", required=false) int pag,
				@RequestParam(name="pageSize", defaultValue="5", required=false) int pageSize) {
			String mid = (String) session.getAttribute("sMid");
			//int level = (int) session.getAttribute("sLevel");
			// if(level == 0) mid = "전체";
			
			PageVO pageVo = pageProcess.totRecCnt(pag, pageSize, "dbMyOrder", mid, "");
			
			// 오늘 구매한 내역을 초기화면에 보여준다.
			List<DbProductVO> vos = dbShopService.getMyOrderList(pageVo.getStartIndexNo(), pageSize, mid);
			model.addAttribute("vos", vos);
			model.addAttribute("pageVo",pageVo);
			
			
			List<DbProductVO> wishListVos = dbShopService.getWishList(mid);
			model.addAttribute("wishListVos", wishListVos);
			
			return "dbShop/dbMyOrder";
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
			
			return "dbShop/dbMyOrder";
		}
		
		
		
		
		// 공지사항 작성폼
		@RequestMapping(value="/dbShopNoticeInput", method=RequestMethod.GET)
		public String dbShopNoticeInputGet(CouponIssueVO vo) {
			
			return "dbShop/dbShopNoticeInput";
		}
		
		
		
		// 공지사항 리스트
		@RequestMapping(value="/dbShopNoticeList", method=RequestMethod.GET)
		public String dbShopNoticeListGet(Model model, HttpSession session,
				@RequestParam(name="idx", defaultValue = "0", required = false) int idx,
				@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
				@RequestParam(name="pageSize", defaultValue = "5", required = false) int pageSize,
				@RequestParam(name="part", defaultValue = "전체", required = false) String part
				) {
			
			
			PageVO pageVo = pageProcess.totRecCnt(pag,  pageSize, "dbShopNotice", part, "");
			List<DbShopNoticeVO> noticeVos = dbShopService.getdbShopNoticeList(pageVo.getStartIndexNo(), pageVo.getPageSize(), part);
			pageVo.setPart(part);
			
			model.addAttribute("noticeVos", noticeVos);
			model.addAttribute("pageVo", pageVo);
			
			
			
			List<CouponIssueVO> CouponVos = dbShopService.getCouponList();
			model.addAttribute("CouponVos", CouponVos);
			
			
			return "dbShop/dbShopNoticeList";
			
		}
		// 쿠폰다운 
		@RequestMapping(value="/dbShopNoticeList", method=RequestMethod.POST)
		public String dbShopNoticeListGet(Model model, HttpSession session,
				CouponDownVO couponDownVo, MemberVO memberVo , CouponIssueVO couponIssueVo) {

			//쿠폰을 다운 했었는지 확인하기
			int couponDownCnt = dbShopService.getCouponDownCheck(couponDownVo.getMid(), couponIssueVo.getIdx());
			System.out.println("couponDownCnt : " + couponDownCnt);
			if(couponDownCnt == 0) {
				couponDownVo.setCouponId(couponIssueVo.getIdx());
				dbShopService.setCouponDown(couponDownVo);
				return "redirect:/msg/couponDownOk";
			}
				return "redirect:/msg/couponDownNo";
		}
		
		// 리뷰등록
		@RequestMapping(value = "/dbMyOrder", method = RequestMethod.POST)
		public String pdsInputPost(ReviewVO reviewVo, MultipartHttpServletRequest file,DbOrderVO orderVo, DbProductVO productVo,
				@RequestParam(name="mid", defaultValue = "0", required = false) String mid
				) {
			
			// 리뷰 작성했는지 체크하기
			int reviewCnt = dbShopService.getReviewCheck(mid, orderVo.getOrderIdx(), orderVo.getProductIdx());
			
			
			if(reviewCnt != 0) {
			// 멀티파일을 서버에 저장시키고, 파일의 정보를 vo에 담아서 DB에 저장시킨다. 
			dbShopService.setReviewInput(file, reviewVo);
			
			// 리뷰가 작성 되었으면 order의 status 바꾸기
			dbShopService.setReviewStatusChange(mid, orderVo.getOrderIdx(), orderVo.getProductIdx());
			
			//
			dbShopService.setdbOrderReviewStatusChange(mid, orderVo.getOrderIdx(), orderVo.getProductIdx());
			
			}
			return "redirect:/msg/ReviewInputOk";
		}
		// 공지사항 내용
		@RequestMapping(value="/dbShopNoticeContent", method=RequestMethod.GET)
		public String dbShopNoticeContentGet(int idx,int pag, int pageSize, Model model) {
			
		DbShopNoticeVO vo = dbShopService.getShopNoticeContent(idx);	
		
		model.addAttribute("vo", vo);
		
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
			
			
			return "dbShop/dbShopNoticeContent";
		}
		
		
		
		// 게시글 삭제
		@RequestMapping(value = "/dbShopNoticeDel", method = RequestMethod.GET)
		public String boardDeleteOkGet(int idx, int pag, int pageSize, Model model) {
			
			// DB에서 실제로 존재하는 게시글을 삭제처리한다.
			dbShopService.setdbShopNoticeDeleteOk(idx);
			
			model.addAttribute("flag","?pag="+pag+"&pageSize="+pageSize);
			
			return "redirect:/msg/dbShopNoticeDel";
		}
		

		// 게시글 수정 폼
		@RequestMapping(value = "/dbShopNoticeUpdate", method = RequestMethod.GET)
		public String boardUpdateGet(Model model, int idx, int pag, int pageSize) {
			
			DbShopNoticeVO vo = dbShopService.getShopNoticeContent(idx);	
			
			model.addAttribute("vo", vo);
			model.addAttribute("pag", pag);
			model.addAttribute("pageSize", pageSize);
			
			return "dbShop/dbShopNoticeUpdate";
		}
		
		// 게시글 수정
		@RequestMapping(value = "/dbShopNoticeUpdate", method = RequestMethod.POST)
		public String dbShopNoticeUpdatePost(Model model, int idx, int pag, int pageSize, DbShopNoticeVO vo) {
			
			dbShopService.setBoardUpdateOk(vo);
			
			model.addAttribute("flag","?pag="+pag+"&pageSize="+pageSize);
			
			return "redirect:/msg/dbShopNoticeUpdateOk";
		}
		
		
		

}
