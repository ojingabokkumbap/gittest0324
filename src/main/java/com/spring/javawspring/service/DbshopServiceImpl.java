package com.spring.javawspring.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.javawspring.dao.DbShopDAO;
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

@Service
public class DbshopServiceImpl implements DbshopService {

	@Autowired
	DbShopDAO dbShopDAO;

	@Override
	public DbProductVO getCategoryMainOne(String categoryMainCode, String categoryMainName) {
		return dbShopDAO.getCategoryMainOne(categoryMainCode, categoryMainName);
	}

	@Override
	public void setCategoryMainInput(DbProductVO vo) {
		dbShopDAO.setCategoryMainInput(vo);
	}
	
	@Override
	public List<DbProductVO> getCategorySubOne(DbProductVO vo) {
		return dbShopDAO.getCategorySubOne(vo);
	}

	@Override
	public void setCategorySubInput(DbProductVO vo) {
		dbShopDAO.setCategorySubInput(vo);
	}

	@Override
	public List<DbProductVO> getCategoryMain() {
		return dbShopDAO.getCategoryMain();
	}

	@Override
	public List<DbProductVO> getCategorySub() {
		return dbShopDAO.getCategorySub();
	}

	@Override
	public List<DbProductVO> getCategorySubName(String categoryMainCode) {
		return dbShopDAO.getCategorySubName(categoryMainCode);
	}

	@Override
	public void imgCheckProductInput(MultipartFile file, DbProductVO vo) {
		// 먼저 기본(메인)그림파일은 'dbShop/product'폴더에 복사 시켜준다.
		try {
			String originalFilename = file.getOriginalFilename();
			if(originalFilename != null && originalFilename != "") {
				// 상품 메인사진을 업로드처리하기위해 중복파일명처리와 업로드처리
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			  String saveFileName = sdf.format(date) + "_" + originalFilename;
				writeFile(file, saveFileName);	  // 메일 이미지를 서버에 업로드 시켜주는 메소드 호출
				vo.setFSName(saveFileName);				// 서버에 저장된 파일명을 vo에 set시켜준다.
			}
			else {
				return;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//             0         1         2         3         4         5
		//             012345678901234567890123456789012345678901234567890
		// <img alt="" src="//data/dbShop/211229124318_4.jpg"
		// <img alt="" src="/green2209s_02/data/dbShop/product/211229124318_4.jpg"
		
		// ckeditor을 이용해서 담은 상품의 상세설명내역에 그림이 포함되어 있으면 그림을 dbShop/product폴더로 복사작업처리 시켜준다.
		String content = vo.getContent();
		if(content.indexOf("src=\"/") == -1) return;		// content박스의 내용중 그림이 없으면 돌아간다.
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		// String uploadPath = request.getRealPath("/resources/data/dbShop/");
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/dbShop/");
		
		int position = 30;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;
		
		while(sw) {
			String imgFile = nextImg.substring(0,nextImg.indexOf("\""));
			String copyFilePath = "";
			String oriFilePath = uploadPath + imgFile;	// 원본 그림이 들어있는 '경로명+파일명'
			
			copyFilePath = uploadPath + "product/" + imgFile;	// 복사가 될 '경로명+파일명'
			
			fileCopyCheck(oriFilePath, copyFilePath);	// 원본그림이 복사될 위치로 복사작업처리하는 메소드
			
			if(nextImg.indexOf("src=\"/") == -1) sw = false;
			else nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
		}
		// 이미지 복사작업이 종료되면 실제로 저장된 'dbShop/product'폴더명을 vo에 set시켜줘야 한다.
		vo.setContent(vo.getContent().replace("/data/dbShop/", "/data/dbShop/product/"));

		// 파일 복사작업이 모두 끝나면 vo에 담긴내용을 상품의 내역을 DB에 저장한다.
		// 먼저 productCode를 만들어주기 위해 지금까지 작업된 dbProduct테이블의 idx필드중 최대값을 읽어온다. 없으면 0으로 처리한다.
		int maxIdx = 1;
		DbProductVO maxVo = dbShopDAO.getProductMaxIdx();
		if(maxVo != null) {
			maxIdx = maxVo.getIdx() + 1;
			vo.setIdx(maxIdx);
		}
		vo.setProductCode(vo.getCategoryMainCode()+vo.getCategorySubCode()+maxIdx);
		dbShopDAO.setDbProductInput(vo);
	}
	
  // 실제 파일(dbShop폴더)을 'dbShop/product'폴더로 복사처리하는곳
	private void fileCopyCheck(String oriFilePath, String copyFilePath) {
		File oriFile = new File(oriFilePath);
		File copyFile = new File(copyFilePath);
		
		try {
			FileInputStream  fis = new FileInputStream(oriFile);
			FileOutputStream fos = new FileOutputStream(copyFile);
			
			byte[] buffer = new byte[2048];
			int count = 0;
			while((count = fis.read(buffer)) != -1) {
				fos.write(buffer, 0, count);
			}
			fos.flush();
			fos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//메인 상품 이미지 서버에 저장하기
	private void writeFile(MultipartFile fName, String saveFileName) throws IOException {
		byte[] data = fName.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/data/dbShop/product/");
		
		FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
		fos.write(data);
		fos.close();
	}

	@Override
	public List<DbProductVO> getCategoryProductName(String categoryMainCode, String categorySubCode) {
		return dbShopDAO.getCategoryProductName(categoryMainCode,categorySubCode);
	}

	@Override
	public DbProductVO getProductInfor(String productName) {
		return dbShopDAO.getProductInfor(productName);
	}

	@Override
	public List<DbProductVO> getSubTitle() {
		return dbShopDAO.getSubTitle();
	}

	@Override
	public List<DbProductVO> getDbShopList(int startIndexNo, int pageSize, String part) {
		return dbShopDAO.getDbShopList(startIndexNo,pageSize,part);
	}

	@Override
	public DbProductVO getDBShopProduct(int idx) {
		return dbShopDAO.getDBShopProduct(idx);
	}

	@Override
	public List<DbOptionVO> getOptionList(int productIdx) {
		return dbShopDAO.getOptionList(productIdx);
	}

	@Override
	public int getOptionSame(int productIdx, String optionName) {
		return dbShopDAO.getOptionSame(productIdx,optionName);
	}

	@Override
	public void setDbOptionInput(DbOptionVO vo) {
		dbShopDAO.setDbOptionInput(vo);
	}

	@Override
	public List<DbOptionVO> getDbShopOption(int productIdx) {
		return dbShopDAO.getDbShopOption(productIdx);
	}

	@Override
	public List<DbProductVO> getDbShopListDate(String part) {
		return dbShopDAO.getDbShopListDate(part);
	}

	@Override
	public List<DbCartVO> getDbCartList(String mid) {
		return dbShopDAO.getDbCartList(mid);
	}

	@Override
	public DbCartVO getDbCartProductOptionSearch(String productName, String optionName, String mid) {
		return dbShopDAO.getDbCartProductOptionSearch(productName, optionName, mid);
	}

	@Override
	public void dbShopCartUpdate(DbCartVO vo) {
		dbShopDAO.dbShopCartUpdate(vo);
	}

	@Override
	public void dbShopCartInput(DbCartVO vo) {
		dbShopDAO.dbShopCartInput(vo);
	}

	@Override
	public void dbCartDelete(int idx) {
		dbShopDAO.dbCartDelete(idx);
	}

	@Override
	public DbOrderVO getOrderMaxIdx() {
		return dbShopDAO.getOrderMaxIdx();
	}

	@Override
	public DbCartVO getCartIdx(int idx) {
		return dbShopDAO.getCartIdx(idx);
	}

	
	@Override
	public void setDbBaesong(DbBaesongVO baesongVo) {
		dbShopDAO.setDbBaesong(baesongVo);
	}

	@Override
	public void setMemberPointPlus(int point, String mid) {
		dbShopDAO.setMemberPointPlus(point, mid);
	}
	
	@Override
	public void setDbOrder(DbOrderVO vo) {
		dbShopDAO.setDbOrder(vo);
	}
	
	@Override
	public void dbCartDeleteAll(int idx) {
		dbShopDAO.dbCartDeleteAll(idx);
	}

	@Override
	public void setProductSellPlus(int sell, String productName) {
		dbShopDAO.setProductSellPlus(sell,productName);
	}

	@Override
	public List<DbBaesongVO> getOrderBaesong(String orderIdx) {
		return dbShopDAO.getOrderBaesong(orderIdx);
	}

	@Override
	public List<DbProductVO> getMyOrderList(int startIndexNo, int pageSize, String mid) {
		return dbShopDAO.getMyOrderList(startIndexNo, pageSize, mid);
	}

	@Override
	public List<DbBaesongVO> getMyOrderStatus(int startIndexNo, int pageSize, String mid, String startJumun,
			String endJumun, String conditionOrderStatus) {
		return dbShopDAO.getMyOrderStatus(startIndexNo, pageSize, mid, startJumun, endJumun, conditionOrderStatus);
	}

	@Override
	public ArrayList<DbBaesongVO> getDbBaesongList(String mid) {
		return  dbShopDAO.getDbBaesongList(mid);
	}

	@Override
	public List<DbShopNoticeVO> getdbShopNoticeList(int startIndexNo, int pageSize, String part) {
		return dbShopDAO.getdbShopNoticeList(startIndexNo, pageSize, part);
	}

	@Override
	public void setDbShopList(DbShopNoticeVO vo) {
		dbShopDAO.setDbShopList(vo);
	}

	@Override
	public DbShopNoticeVO getShopNoticeContent(int idx) {
		return dbShopDAO.getShopNoticeContent(idx);
	}

	@Override
	public void setdbShopNoticeDeleteOk(int idx) {
		dbShopDAO.setdbShopNoticeDeleteOk(idx);
	}

	@Override
	public void setBoardUpdateOk(DbShopNoticeVO vo) {
		dbShopDAO.setBoardUpdateOk(vo);
		
	}

	
	@Override
	public void setReviewInput(MultipartHttpServletRequest mFile, ReviewVO vo) {
		try {
			List<MultipartFile> fileList = mFile.getFiles("file");
			String oFileNames = "";
			String sFileNames = "";
			int fileSizes = 0;
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);
				
				// 파일 업로드 메소드 호출
				writeFileR(file, sFileName);
				
				oFileNames += oFileName + "/";
				sFileNames += sFileName + "/";
				fileSizes += file.getSize();
			}
			vo.setFName(oFileNames);
			vo.setFSName(sFileNames);
			vo.setFSize(fileSizes);
			
			dbShopDAO.setReviewInput(vo);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	// 실제로 파일을 서버에 저장한다.
		private void writeFileR(MultipartFile file, String sFileName) throws IOException {
			byte[] data = file.getBytes();
			
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String realPath = request.getSession().getServletContext().getRealPath("/resources/data/review/");
			
			FileOutputStream fos = new FileOutputStream(realPath + sFileName);
			fos.write(data);
			fos.close();
		}

		// 실제 서버에 저장되는 파일명 중복방지를 위한 파일명설정
		private String saveFileName(String oFileName) {
			String fileName = "";
			
			Calendar cal = Calendar.getInstance();
			fileName += cal.get(Calendar.YEAR);
			fileName += cal.get(Calendar.MONTH);
			fileName += cal.get(Calendar.DATE);
			fileName += cal.get(Calendar.HOUR);
			fileName += cal.get(Calendar.MINUTE);
			fileName += cal.get(Calendar.SECOND);
			fileName += cal.get(Calendar.MILLISECOND);
			fileName += "_" + oFileName;
			
			return fileName;
	}
	
	
	

	@Override
	public void setReviewStatusChange(String mid, String orderIdx, int productIdx) {
		dbShopDAO.setReviewStatusChange(mid,orderIdx, productIdx);
	}

	@Override
	public int getReviewCheck(String mid, String orderIdx, int productIdx) {
		return dbShopDAO.getReviewCheck(mid,orderIdx, productIdx);
	}

	@Override
	public void setdbOrderReviewStatusChange(String mid, String orderIdx, int productIdx) {
		dbShopDAO.setdbOrderReviewStatusChange(mid,orderIdx, productIdx);
	}

	@Override
	public List<ReviewVO> getReviewList(int productIdx) {
		return dbShopDAO.getReviewList(productIdx);
	}

	@Override
	public void setReviewGoodPlus(int idx) {
		dbShopDAO.setReviewGoodPlus(idx);
	}

	@Override
	public List<ReviewVO> getReivewCnt(int productIdx) {
		return dbShopDAO.getReivewCnt(productIdx);
	}

	@Override
	public void couponInput(CouponIssueVO vo) {
		dbShopDAO.couponInput(vo);
	}

	@Override
	public List<CouponIssueVO> getCouponList() {
		return dbShopDAO.getCouponList();
	}

	@Override
	public void setCouponDown(CouponDownVO couponDownVo) {
		dbShopDAO.setCouponDown(couponDownVo);
	}

	@Override
	public int getCouponDownCheck(String mid, int idx) {
		return dbShopDAO.getCouponDownCheck(mid, idx);
	}

	@Override
	public ArrayList<CouponDownVO> getCouponDownList(String mid) {
		return dbShopDAO.getCouponDownList(mid);
	}

	@Override
	public int getReplyCnt(String mid) {
		return dbShopDAO.getReplyCnt(mid);
	}


	@Override
	public void setWishListInput(WishListVO wishListVo) {
		dbShopDAO.setWishListInput(wishListVo);
	}

	@Override
	public int getWishListCheck(String mid, int idx) {
		return dbShopDAO.getWishListCheck(mid, idx);
	}

	@Override
	public List<DbProductVO> getWishList(String mid) {
		return dbShopDAO.getWishList(mid);
	}

	@Override
	public void wishDelete(int idx) {
		dbShopDAO.wishDelete(idx);
	}

}
