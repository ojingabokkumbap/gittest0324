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
    margin-top : 7%;
    top: 40px;
    background-color: #f5f5f5c9;
/*     box-shadow: 5px 13px 48px -34px rgb(0 0 0 / 85%); */
} 

</style>
<script>
'use strict';

	function qnaReply() {
		var qnaIdx = "${vo.idx}";
		var reContent = replyForm.reContent.value;
		if(reContent == "") {
			alert("글을 입력하세요.");
			replyForm.reContent.focus();
			return false;
		}
		var query = {
				qnaIdx : qnaIdx,
				reContent : reContent
		}
		$.ajax({
			url : "${ctp}/admin/QnaReplyInput",
			type : "post",
			data : query,
			success : function(data) {
				location.reload();
			}
		});
	}
	
</script>
<body>
<jsp:include page="/WEB-INF/views/include/shopNav.jsp"></jsp:include>
<div class="container" style="margin-bottom: 80px;	border-radius:10px;">
<h3 class="zRVNb6dB4r"><b>공지사항</b></h3>
<div class="content">
	<table class="table">
		<!-- 관리자가 답변을 달았을때는 현재글을 수정/삭제 처리 못하도록 하고 있다. -->
		<tr>
			<th class="table-dark" style="width:15%;">제목</th>
			<td >${vo.title}</td>
		</tr>
		<tr>
			<th style="width:15%;" class="table-dark">상태</th>
			<td colspan="3">
				<c:if test="${vo.reply=='미답변'}">
					<font color="red">${vo.reply}</font>						
				</c:if>
				<c:if test="${vo.reply=='답변완료'}">
					<font color="blue">${vo.reply}</font>			
				</c:if>
			</td>
		</tr>
		<tr>
			<th style="width:15%;" class="table-dark">작성일</th>
			<td>${fn:substring(vo.WDate,0,10)}</td>
		</tr>
		<tr>
			<td colspan="4">
			<br>
	      <c:if test="${!empty vo.FSName}"><img src="${ctp}/data/qna/${vo.FSName}" width="400px"/><br/></c:if>
	      <br/>
	      <p>${fn:replace(vo.content,newLine,"<br/>")}<br/></p>
			</td>
		</tr>
	</table>

	
	<hr/>
	<!-- 관리자가 답변을 달았을때 보여주는 구역 -->
	<c:if test="${!empty reVO.reContent}">
		<form name="replyForm">
			<textarea name="reContent" rows="5"  id="reContent" readonly="readonly" class="form-control">관리자 : ${reVO.reContent}</textarea>
		</form>
	</c:if>
	<br><br>
</div>
</div>

</body>
 <footer class="w3-center w3-padding-64" style="background-color:#0b141e;padding: 30px; text-align:center;">
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</footer>
</html>
