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


.zRVNb6dB4r {
    padding-bottom: 15px;
    border-bottom: 2px solid #000;
    font-size: 22px;
    line-height: 25px;
    color: #000;
}


.container {
		display: block;
    position: relative;
    z-index: 0;
    margin: 1rem auto 0;
    padding: 5rem 4rem 0 4rem;
    width: 100%;
    max-width: 1300px;
    min-height: 750px;
    margin-top : 10%;
    top: 40px;
    background-color: #f5f5f5c9;
/*     box-shadow: 5px 13px 48px -34px rgb(0 0 0 / 85%); */
} 

</style>
<script>
'use strict';

	
	function Delbtn() {
		let ans = confirm("현 게시글을 삭제하시겠습니까?");
		if(ans) location.href = "${ctp}/dbShop/dbShopNoticeDel?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}";
	}	
</script>
<body>
<jsp:include page="/WEB-INF/views/include/shopNav.jsp"></jsp:include>
<div class="container" style="margin-bottom: 80px;	border-radius:10px;">
<h3 class="zRVNb6dB4r"><b>공지사항</b></h3>
		<div class="content">
			<div class="item_text"><h4><b><font color="skyblue">[${vo.part}]</font>${vo.title}</b></h4></div>
			${fn:substring(vo.NDate,0,16)}
			<hr>
			<div class="text-center" style="height:450px;">
			${vo.content}
			</div>
			<div style="float:right">
				<input type="button" onclick="location.href='${ctp}/dbShop/dbShopNoticeUpdate?idx=${vo.idx}&pageSize=${pageSize}&pag=${pag}';" value="수정" class="btn btn-info">
				<input type="button" onclick="Delbtn()" value="삭제" class="btn btn-danger">
			</div>
		</div>
</div>
  <!-- 이전글/다음글 처리 -->
  <c:if test="${flag != 'search'}">
  <table class="table table-borderless">
  	<tr>
  	<td class = "text-left">
  	<c:if test="${preVO.preIdx != 0}">
  		<a href="${ctp}/No_Content.no?idx=${preVo.preIdx}&pageSize=${pageSize}&pag=${pag}"> <b>〈 이전글</b> <br> <font color="gray">${preVo.preTitle} </font></a>
  	</c:if>
  	</td>
  	<td class = "text-right">
  	<c:if test="${nextVO.nextIdx != 0}">
  		<a href="${ctp}/No_Content.no?idx=${nextVo.nextIdx}&pageSize=${pageSize}&pag=${pag}"> <b> 다음글 〉</b> <br> <font color="gray">${nextVo.nextTitle}</font></a>	
  	</c:if>
  	</td>
  	</tr>
  </table>
  </c:if>	
</body>
 <footer class="w3-center w3-padding-64" style="background-color:#0b141e;padding: 30px; text-align:center;">
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</footer>
</html>
