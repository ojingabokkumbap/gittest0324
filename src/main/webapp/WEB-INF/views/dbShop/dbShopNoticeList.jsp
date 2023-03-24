<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>title</title>
    <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
</head>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
<style>

.container{
	max-width:85%;
}
.zRVNb6dB4r {
    padding-bottom: 15px;
    border-bottom: 2px solid #000;
    font-size: 22px;
    line-height: 25px;
    color: #000;
}

#memberBenefit .section .coupon_list li .coupon_box {
    display: table;
    width: 100%;
    height: 150px;
    background: url(//static.wconcept.co.kr/web/images/common/bg_coupon_150.png) center no-repeat;
    background-size: contain;
}

#memberBenefit .section .coupon_list li .coupon_box .text {
    padding: 0 26px 0 30px;
    width: 85%;
}
#memberBenefit .section .coupon_list li .coupon_box>div {
    display: table-cell;
    vertical-align: middle;
}

#memberBenefit .section .coupon_list li .coupon_box .button_wrap {
    width: 15%;
    text-align: center;
    position: relative;
}
#memberBenefit .section .coupon_list li .coupon_box>div {
    display: table-cell;
    vertical-align: middle;
}

#memberBenefit .section .coupon_list li .coupon_box .button_wrap button {
    text-indent: -9999px;
    overflow: hidden;
    width: 100%;
    height: 150px;
    position: relative;
}

#memberBenefit .section .coupon_list li .coupon_box .button_wrap button:after {
    display: block;
    content: "";
    width: 20px;
    height: 24px;
    background: url(//static.wconcept.co.kr/web/images/common/ico_coupon_download_on.png) no-repeat;
    background-size: 100%;
    position: absolute;
    top: 50%;
    left: 50%;
    margin: -12px 0 0 -10px;
}
#memberBenefit .section .coupon_list li .coupon_box .text h4 {
    font-family: "ProximaNova-Semibold","NotoSansKR-Medium";
    font-size: 28px;
    line-height: 44px;
    margin-bottom: 10px;
    color: #fa5500;
}

#memberBenefit .section .coupon_list li .coupon_box .text .tit {
    font-family: "ProximaNova-Semibold","NotoSansKR-Medium";
    font-size: 16px;
    line-height: 21px;
    letter-spacing: -.32px;
    margin-bottom: 6px;
    color: #333;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    width: 267px;
}

#memberBenefit .section .coupon_list li .coupon_box .text .desc {
    font-family: "ProximaNova-Regular","Noto Sans KR";
    font-size: 14px;
    line-height: 18px;
    color: #777;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    width: 267px;
}

#memberBenefit .section {
    padding: 80px 0 100px;
    text-align: center;
}

#memberBenefit .section .coupon_list {
    padding: 0 5px;
    display: inline-block;
}

#memberBenefit .section .coupon_list {
    padding: 0 5px;
    display: inline-block;
}

#memberBenefit .section .coupon_list li {
    float: left;
    padding: 0 15px;
    margin-top: 40px;
    text-align: left;
}
li, dl {
    margin: 0;
    padding: 0;
    list-style: none;
}

#memberBenefit .section .coupon_notice p {
    font-family: "ProximaNova-Regular","Noto Sans KR";
    font-size: 14px;
    line-height: 24px;
    color: #aaa;
    padding-left: 12px;
    position: relative;
}


</style>
<script>
'use strict';
// 파트별 리스트 출력하기
function partCheck() {
	let part = partForm.part.value;
	location.href = "${ctp}/dbShop/dbShopNoticeList?part="+part;
} 

function couponDown(idx) {
	  $("#myform"+idx).submit();
}

</script>
<body>
<jsp:include page="/WEB-INF/views/include/shopNav.jsp"></jsp:include>
<div class="container">
<div id="memberBenefit" style="margin-top:10%; margin-bottom:5%">
  <div class="sub_title_wrap">
    </div>
      <div id="pajx_container">
				<div class="content1 tab_content active">
        	<div class="section special_coupon_section" id="divSpecialCoupon" style="background: #f7e6da;  border-radius: 60px;">
            <h2 class="section_tit">SPECIAL EVENT</h2>
           	 <ul class="coupon_list">	
							<c:forEach var="vo" items="${CouponVos}" varStatus="status" begin="0" end="2">
              <li class="">
              	<form name ="myform${vo.idx}" id="myform${vo.idx}" method="post">
                <div class="coupon_box">
                 <div class="text">
                   <h4><span><b><fmt:formatNumber value="${vo.CPrice}"/></b></span>원</h4>
                     <p class="tit">${vo.CName}</p>
                     <p class="desc">${fn:substring(vo.CStartDate,0,10)}일 부터<br>
                    	  ~ ${fn:substring(vo.CEndDate,0,10)}일까지 사용 가능</p>
                  </div>
	               <div class="button_wrap">
							    <input type="hidden" name="mid" value="${sMid}"/>
							    <input type="hidden" name="cPrice" value="${vo.CPrice}"/>	      	
							    <input type="hidden" name="cName" value="${vo.CName}"/>	      	
							    <input type="hidden" name="idx" value="${vo.idx}"/>	      	
	                <button type="button" class="nomember" onclick="couponDown(${vo.idx})" style="border: 0;  padding: 0;   background: none;	font-weight: normal;">다운로드</button>
	               </div>
	               </div>
	               <div class="coupon_notice text-center">
                  <p>＊적용디바이스 : PC, APP, MOBILE</p>
              	</div>
	               </form>
              </li>
              </c:forEach>
           </ul>
    		</div>
			</div>
		</div>
	</div>
	<h3 class="zRVNb6dB4r"><b>쇼핑스토리</b>
			<form name="partForm" >
     	<select name="part" onchange="partCheck()" style="float: right;  margin-top: -20px; font-size : 1rem;">
     	  <option value="전체" ${pageVo.part == '전체' ? 'selected' : ''}>전체</option>
     	  <option value="배송지연" ${pageVo.part == '배송지연' ? 'selected' : ''}>배송지연</option>
     	  <option value="기타" ${pageVo.part == '기타' ? 'selected' : ''}>기타</option>
     	  <option value="이벤트" ${pageVo.part == '이벤트' ? 'selected' : ''}>이벤트</option>
     	  <option value="상품" ${pageVo.part == '상품' ? 'selected' : ''}>상품</option>
     	</select>
     </form>
				</h3>
		 <div class="table-responsive" >
  <table class="table text-left" style="margin-top: -10px;">
    <tr class="table" >
      <th>번호</th>
      <th>구분</th>
      <th>제목</th>
      <th style="text-align: center;">작성일</th>
    </tr>
    <c:set var="curScrStartNo" value="${pageVo.curScrStartNo}"/>
    <c:forEach var="vo" items="${noticeVos}">
      <tr>
        <td style=" text-align: left;">${vo.idx}</td>
        <td style=" text-align: left;">${vo.part}</td>
        <td style=" text-align: left;">
          <a href="${ctp}/dbShop/dbShopNoticeContent?idx=${vo.idx}&pageSize=${pageVo.pageSize}&pag=${pageVo.pag}">${vo.title}</a>
        </td>
        <td style="text-align:center;">
    	      ${fn:substring(vo.startDate,0,10)}
        </td>
      </tr>
      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
    </c:forEach>
    <tr><td colspan="7" class="p-0"></td></tr>
  </table>
</div>
<br><br>
<!-- 블록 페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pageVo.pag > 1}">
      <li class="page-item"><a class="page-link text-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${pageVo.curBlock > 0}">
      <li class="page-item"><a class="page-link text-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(pageVo.curBlock)*pageVo.blockSize + 1}" end="${(pageVo.curBlock)*pageVo.blockSize + pageVo.blockSize}" varStatus="st">
      <c:if test="${i <= pageVo.totPage && i == pageVo.pag}">
    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= pageVo.totPage && i != pageVo.pag}">
    		<li class="page-item"><a class="page-link text-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
      <li class="page-item"><a class="page-link text-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pageVo.pag < pageVo.totPage}">
      <li class="page-item"><a class="page-link text-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=${pageVo.totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
  <!-- 끝 -->
<br><br><br><br><br>
</div>
</div>
</body>
 <footer class="w3-center w3-padding-64" style="background-color:#0b141e;padding: 30px; text-align:center;">
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</footer>
</html>
