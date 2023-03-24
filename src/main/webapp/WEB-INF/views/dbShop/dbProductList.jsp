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
.content{
    width: 75%;
    margin: auto;
    margin-bottom: 10%;
    margin-top: 10%;
}
</style>
<jsp:include page="/WEB-INF/views/include/shopNav.jsp"></jsp:include>
<script>
'use strict';
// 대분류 등록
</script>
<body>
<div class="content">
    <h3>&nbsp;&nbsp;<b><br>
    	<c:if test="${part == '의류'}">의류</c:if>
    	<c:if test="${part == '전체'}">전체상품</c:if>
    	<c:if test="${part == '인형'}">인형</c:if>
    	<c:if test="${part == 'ETC'}">ETC</c:if>
    	<c:if test="${part == '스태츄'}">스태츄</c:if>
    	<c:if test="${part == '액세서리'}">액세서리</c:if>
    	<c:if test="${part == '피규어'}">피규어</c:if>
    </b></h3>
  <hr style="    border: 0;    border-top: 3px solid #0a0a0a;    margin: 20px 0;">
  <br>
 <c:set var="cnt" value="0"/>
  <div class="row mt-3 ml-4">
    <c:forEach var="vo" items="${productVos}">
      <div class="col-md-3" id="product">
        <div>
          <a href="${ctp}/dbShop/dbProductContent?idx=${vo.idx}">
            <img src="${ctp}/data/dbShop/product/${vo.FSName}" width="300px" height="350px" style="border: solid 1px #d3d3d359;"/>
            <br><br>
            <div><font size="3"><b>${vo.productName}</b></font></div>
         </a>
            <div><font size="2"><fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/>원</font></div>
            <div><font size="1" color="gray">후기 |  
            	${vo.reviewCount} 개
            </font></div>
        </div>
      </div>
      <c:set var="cnt" value="${cnt+1}"/>
      <c:if test="${cnt%4 == 0}">
        </div>
        <div class="row mt-5">
      </c:if>
    </c:forEach>
    <div class="container">
      <c:if test="${fn:length(productVos) == 0}"><h3>제품 준비 중입니다.</h3></c:if>
      
      
 <div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pageVo.pag > 1}">
      <li class="page-item"><a class="page-link text-secondary" href="dbProductList?part=${pageVo.part}&pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${pageVo.curBlock > 0}">
      <li class="page-item"><a class="page-link text-secondary" href="dbProductList?part=${pageVo.part}&pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(pageVo.curBlock)*pageVo.blockSize + 1}" end="${(pageVo.curBlock)*pageVo.blockSize + pageVo.blockSize}" varStatus="st">
      <c:if test="${i <= pageVo.totPage && i == pageVo.pag}">
    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="dbProductList?part=${pageVo.part}&pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= pageVo.totPage && i != pageVo.pag}">
    		<li class="page-item"><a class="page-link text-secondary" href="dbProductList?part=${pageVo.part}&pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
      <li class="page-item"><a class="page-link text-secondary" href="dbProductList?part=${pageVo.part}&pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pageVo.pag < pageVo.totPage}">
      <li class="page-item"><a class="page-link text-secondary" href="dbProductList?part=${pageVo.part}&pag=${pageVo.totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>


    </div>
  </div>
  </div>
</body>
 <footer class="w3-center w3-padding-64" style="background-color:#0b141e;padding: 30px; text-align:center;">
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</footer>
</html>
