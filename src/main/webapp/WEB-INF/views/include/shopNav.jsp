<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<script>
</script>
<style>
.w3-card, .w3-card-2 {
    box-shadow: none;
}
</style>
<!-- Navbar -->
<div class="w3-top">
	<div style="background-color:white;     padding-top: 10px;    padding-bottom: 10px;">
	
    <a href="${ctp}/dbShop/dbShopMain"><img src="https://shop-phinf.pstatic.net/20220714_276/16577790356292Nv4r_PNG/Copy-of-NewRIOTSTORE_horizontal_80.png?type=m10000_10000" style="
    width: 200px;
    margin-left: 45%;
    margin-top: 20px;"></a>
	</div>
  <div class="w3-bar w3-white w3-card" style="  border-bottom: solid 1px lightgray;">
     <c:forEach var="subTitle" items="${subTitleVos}" varStatus="st">
     <div  style="margin-left:10.2%;" >
		<a href="${ctp}/dbShop/dbProductList?part=${subTitle.categorySubName}"class="w3-bar-item w3-button w3-padding-large w3-hide-small">${subTitle.categorySubName}</a>
			<c:if test="${!st.last}"> </c:if>
		</div>
 	</c:forEach>
	 		<a href="${ctp}/dbShop/dbProductList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">전체 상품</a>
     	<a href="${ctp}/dbShop/dbMyOrder" class="w3-bar-item w3-button w3-padding-large w3-hide-small">마이 페이지</a>
     	<a href="${ctp}/dbShop/dbShopNoticeList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">쇼핑스토리</a>
     	<a href="${ctp}/qna/qnaList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">묻고 답하기</a>
     <c:if test="${sLevel == 0}">
     <a href="${ctp}/admin/adminMain" class="w3-bar-item w3-button w3-padding-large w3-hide-small">관리자 전용</a>
     </c:if>
   	 <a href="${ctp}/dbShop/dbCart" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><span class="material-symbols-outlined">local_mall</span></a>
    <!-- <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a> -->
  </div>
</div>