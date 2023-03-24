package com.spring.javawspring.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

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

public interface DbShopDAO {

	public DbProductVO getCategoryMainOne(@Param("categoryMainCode") String categoryMainCode, @Param("categoryMainName") String categoryMainName);

	public void setCategoryMainInput(@Param("vo") DbProductVO vo);

	public List<DbProductVO> getCategorySubOne(@Param("vo") DbProductVO vo);

	public void setCategorySubInput(@Param("vo") DbProductVO vo);

	public List<DbProductVO> getCategoryMain();

	public List<DbProductVO> getCategorySub();

	public List<DbProductVO> getCategorySubName(@Param("categoryMainCode") String categoryMainCode);

	public DbProductVO getProductMaxIdx();

	public void setDbProductInput(@Param("vo") DbProductVO vo);

	public List<DbProductVO> getCategoryProductName(@Param("categoryMainCode") String categoryMainCode, @Param("categorySubCode") String categorySubCode);

	public DbProductVO getProductInfor(String productName);

	public List<DbProductVO> getSubTitle();

	public List<DbProductVO> getDbShopList(@Param("startIndexNo") int startIndexNo, @Param("pageSize")int pageSize, @Param("part") String part);

	public DbProductVO getDBShopProduct(@Param("idx") int idx);

	public List<DbOptionVO> getOptionList(int productIdx);

	public int getOptionSame(@Param("productIdx") int productIdx, @Param("optionName") String optionName);

	public void setDbOptionInput(@Param("vo") DbOptionVO vo);

	public List<DbOptionVO> getDbShopOption(int productIdx);

	public List<DbProductVO> getDbShopListDate(@Param("part") String part);

	public List<DbCartVO> getDbCartList(@Param("mid")String mid);

	public DbCartVO getDbCartProductOptionSearch(@Param("productName") String productName, @Param("optionName")String optionName, @Param("mid")String mid);

	public void dbShopCartUpdate(@Param("vo")  DbCartVO vo);

	public void dbShopCartInput(@Param("vo") DbCartVO vo);

	public void dbCartDelete(@Param("idx") int idx);
	
	public DbOrderVO getOrderMaxIdx();

	public DbCartVO getCartIdx(int idx);

	public void setDbBaesong( @Param("baesongVo") DbBaesongVO baesongVo);

	public void setMemberPointPlus(@Param("point") int point, @Param("mid")  String mid);

	public void setDbOrder(@Param("vo")  DbOrderVO vo);

	public void dbCartDeleteAll(@Param("idx")  int idx);

	public void setProductSellPlus(@Param("sell") int sell, @Param("productName") String productName);

	public List<DbBaesongVO> getOrderBaesong(@Param("orderIdx")String orderIdx);

	public List<DbProductVO> getMyOrderList(@Param("startIndexNo") int startIndexNo, @Param("pageSize")int pageSize,@Param("mid") String mid);

	public List<DbBaesongVO> getMyOrderStatus(@Param("startIndexNo")  int startIndexNo, @Param("pageSize") int pageSize, @Param("mid") String mid, @Param("startJumun") String startJumun,@Param("endJumun") String endJumun, @Param("conditionOrderStatus") String conditionOrderStatus);

	public int totRecCnt(@Param("mid")String mid);

	public int totRecCntMyOrderStatus(@Param("mid") String mid, @Param("startJumun") String startJumun, @Param("endJumun") String endJumun, @Param("conditionOrderStatus") String conditionOrderStatus);

	public int totRecCntAdminStatus(@Param("startJumun") String startJumun, @Param("endJumun") String endJumun, @Param("orderStatus") String orderStatus);

	public ArrayList<DbBaesongVO> getDbBaesongList(@Param("mid") String mid);

	public int dbShopNoticetotRecCnt(@Param("part") String part);

	public List<DbShopNoticeVO> getdbShopNoticeList(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("part")String part);

	public void setDbShopList(@Param("vo") DbShopNoticeVO vo);

	public DbShopNoticeVO getShopNoticeContent(@Param("idx") int idx);

	public void setdbShopNoticeDeleteOk(@Param("idx") int idx);

	public void setBoardUpdateOk(@Param("vo")  DbShopNoticeVO vo);

	public int getReviewCheck(@Param("mid") String mid, @Param("orderIdx") String orderIdx, @Param("productIdx") int productIdx);

	public void setReviewInput(@Param("vo") ReviewVO vo);

	public void setReviewStatusChange(@Param("mid") String mid, @Param("orderIdx") String orderIdx, @Param("productIdx") int productIdx);

	public void setdbOrderReviewStatusChange(@Param("mid") String mid, @Param("orderIdx") String orderIdx, @Param("productIdx")  int productIdx);

	public List<ReviewVO> getReviewList(@Param("productIdx") int productIdx);

	public void setReviewGoodPlus(@Param("idx") int idx);

	public List<ReviewVO> getReivewCnt(@Param("productIdx") int productIdx);

	public void couponInput(@Param("vo")CouponIssueVO vo);

	public List<CouponIssueVO> getCouponList();

	public void setCouponDown(@Param("couponDownVo") CouponDownVO couponDownVo);

	public int getCouponDownCheck(@Param("mid") String mid,@Param("idx") int idx);

	public ArrayList<CouponDownVO> getCouponDownList(@Param("mid") String mid);

	public int getReplyCnt(@Param("mid") String mid);

	public void setWishListInput(@Param("wishListVo") WishListVO wishListVo);

	public int getWishListCheck(@Param("mid") String mid, @Param("idx") int idx);

	public List<DbProductVO> getWishList(@Param("mid") String mid);

	public void wishDelete(int idx);

	public int totProductListRecCnt(String part);



}
