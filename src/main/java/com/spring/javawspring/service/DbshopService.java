package com.spring.javawspring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javawspring.vo.CouponDownVO;
import com.spring.javawspring.vo.CouponIssueVO;
import com.spring.javawspring.vo.DbBaesongVO;
import com.spring.javawspring.vo.DbCartVO;
import com.spring.javawspring.vo.DbOptionVO;
import com.spring.javawspring.vo.DbOrderVO;
import com.spring.javawspring.vo.DbProductVO;
import com.spring.javawspring.vo.DbShopNoticeVO;
import com.spring.javawspring.vo.ReviewVO;
import com.spring.javawspring.vo.WishListVO;

public interface DbshopService {
	// 대분류 중복 확인
	public DbProductVO getCategoryMainOne(String categoryMainCode, String categoryMainName);
	
	// 대분류 등록
	public void setCategoryMainInput(DbProductVO vo);
	
	// 소분류 중복 확인
	public List<DbProductVO> getCategorySubOne(DbProductVO vo);

	// 소분류 등록
	public void setCategorySubInput(DbProductVO vo);
	
	// 카테고리에서 대분류/소분류(mainVos)가져오기
	public List<DbProductVO> getCategoryMain();
	public List<DbProductVO> getCategorySub();
	
	// 대분류 선택시 소분류명 가져오기
	public List<DbProductVO> getCategorySubName(String categoryMainCode);
	
	// 상품 등록
	public void imgCheckProductInput(MultipartFile file, DbProductVO vo);

	public List<DbProductVO> getCategoryProductName(String categoryMainCode, String categorySubCode);

	public DbProductVO getProductInfor(String productName);

	public List<DbProductVO> getSubTitle();
	
	// 상품 리스트 가져와서 part별로 분리하기 
	public List<DbProductVO> getDbShopList(int startIndexNo, int pageSize, String part);
	
	// 상품컨텐츠 띄우기
	public DbProductVO getDBShopProduct(int idx);
	
	//옵션 리스트 보여주기
	public List<DbOptionVO> getOptionList(int productIdx);
	
	//옵션 중복 체크
	public int getOptionSame(int productIdx, String optionName);
	
	//옵션 저장하기
	public void setDbOptionInput(DbOptionVO vo);
	
	//옵션 읽어오기
	public List<DbOptionVO> getDbShopOption(int productIdx);
	
	//등록순 
	public List<DbProductVO> getDbShopListDate(String part);
	
	//장바구니 조회
	public List<DbCartVO> getDbCartList(String mid);
	
	// 사용자가 기존에 장바구니에 담은 적 이 있는 품목(기본+옵션)의 정보
	public DbCartVO getDbCartProductOptionSearch(String productName, String optionName, String mid);

	// 기존 구매자 장바구니 업데이트
	public void dbShopCartUpdate(DbCartVO vo);

	// 장바구니 넣기
	public void dbShopCartInput(DbCartVO vo);
	
	//장바구니 삭제하기
	public void dbCartDelete(int idx);
	
	//기존에 존재하는 주문테이블의 고유번호 + 1
	public DbCartVO getCartIdx(int parseInt);
	
	// 관리자가 만든 고유주문번호 ( 고유주문번호(idx) =  고유번호 + 1)
	public DbOrderVO getOrderMaxIdx();

	public void setDbBaesong(DbBaesongVO baesongVo);

	public void setMemberPointPlus(int point, String mid);

	public void setDbOrder(DbOrderVO vo);
	
	public void dbCartDeleteAll(int idx);

	public void setProductSellPlus(int sell, String productName);

	public List<DbBaesongVO> getOrderBaesong(String orderIdx);

	public List<DbProductVO> getMyOrderList(int startIndexNo, int pageSize, String mid);

	public List<DbBaesongVO> getMyOrderStatus(int startIndexNo, int pageSize, String mid, String startJumun,
			String endJumun, String conditionOrderStatus);
	
	// 주소록을 위한 배송db 땡겨오기
	public ArrayList<DbBaesongVO> getDbBaesongList(String mid);
	
	// 숍공지사항 페이징처리
	public List<DbShopNoticeVO> getdbShopNoticeList(int startIndexNo, int pageSize, String part);

	// 숍공지사항 작성
	public void setDbShopList(DbShopNoticeVO vo);
	
	// 숍공지사항 내용 꺼내기
	public DbShopNoticeVO getShopNoticeContent(int idx);
	
	// 숍공지사항 삭제
	public void setdbShopNoticeDeleteOk(int idx);
	
	// 숍공지사항 수정
	public void setBoardUpdateOk(DbShopNoticeVO vo);
	
	// 리뷰 작성하기
	public void setReviewInput(MultipartHttpServletRequest file, ReviewVO vo);
	
	// 리뷰 작성했는지 체크하기
	public int getReviewCheck(String mid, String orderIdx, int productIdx);
	
	// 리뷰가 작성 되었으면 order의 status 바꾸기
	public void setReviewStatusChange(String mid, String orderIdx, int productIdx);
	
	public void setdbOrderReviewStatusChange(String mid, String orderIdx, int productIdx);

	// 리뷰 리스트
	public List<ReviewVO> getReviewList(int productIdx);
	
	// 리뷰좋아요체크
	public void setReviewGoodPlus(int idx);
	
	//상품에 따른 리뷰 개수 구하기
	public List<ReviewVO> getReivewCnt(int productIdx);
	
	// 쿠폰등록하기
	public void couponInput(CouponIssueVO vo);
	
	// 쿠폰 조회
	public List<CouponIssueVO> getCouponList();
	
	//쿠폰 다운
	public void setCouponDown(CouponDownVO couponDownVo);
	
	//쿠폰 다운받았었는지 확인
	public int getCouponDownCheck(String mid, int idx);
	
	//주문에서 내가 가지고있는 쿠폰 확인
	public ArrayList<CouponDownVO> getCouponDownList(String mid);
	
	//리플알림
	public int getReplyCnt(String mid);
	
	//위시리스트 저장
	public void setWishListInput(WishListVO wishListVo);
	
	//위시리스트 중복체크
	public int getWishListCheck(String mid, int idx);

	public List<DbProductVO> getWishList(String mid);

	public void wishDelete(int idx);





	
	
	
	
}
