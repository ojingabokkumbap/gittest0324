<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
 <head>
    <meta charset="UTF-8">
    <title>title</title>
    <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
</head>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
<style>

.container{
    margin-top: 13%;
    margin-bottom: 13%;
    max-width: 70%;
}
.zRVNb6dB4r {
    padding-bottom: 15px;
    border-bottom: 2px solid #000;
    font-size: 22px;
    line-height: 25px;
    color: #000;
}


</style>
<script>
'use strict';
// 파트별 리스트 출력하기
    function sChange() {
    	searchForm.searchString.focus();
    }
    
    function sCheck() {
    	var searchString = searchForm.searchString.value;
    	if(searchString == "") {
    		alert("검색어를 입력하세요");
    		searchForm.searchString.focus();
    	}
    	else {
    		searchForm.submit();
    	}
    }

</script>
<body>
<jsp:include page="/WEB-INF/views/include/shopNav.jsp"></jsp:include>
<div class="container">
<div id="memberBenefit" style="margin-top:10%; margin-bottom:5%">
  <div class="sub_title_wrap">
    </div>
	</div>
	<h3 class="zRVNb6dB4r"><b>묻고 답하기</b>
			<input type="button" value="작성" onclick="location.href='qnaInput';" class="btn btn-sm btn-primary" style="float:right">
			<!-- <input type="button" value="글올리기" onclick="location.href='qnaInput?qnaSw=q';" class="btn btn-secondary"/> -->
	</h3>
		 <div class="table-responsive" >
  <table class="table text-left" style="margin-top: -10px;">
    <tr class="table" >
      <th style="width: 100px;">답변상태</th>
      <th style="width: 50px;"></th>
      <th>제목</th>
      <th style="width: 150px;">작성자</th>
      <th style="width: 150px;">작성일</th>
    </tr>
		<c:if test="${empty vos}">
				<tr>
					<td colspan="4" style="text-align: center">
						글이 존재하지 않습니다.
					</td>
				</tr>
			</c:if>
			<c:set var="curScrStartNo" value="${pageVO.curScrStartNo}"/>
	    <c:set var="cnt" value="0"/>
	    <c:set var="tempSw" value="0"/>
		    <c:forEach var="vo" items="${vos}">
		      <c:set var="tempPreName" value="${vos[cnt-1].nickName}"/>
		      <c:if test="${cnt != 0}"><c:set var="tempPreQnaIdx" value="${fn:substring(vos[cnt-1].qnaIdx,0,fn:indexOf(vo.qnaIdx,'_'))}"/></c:if>
		      <c:if test="${cnt == 0}"><c:set var="tempPreQnaIdx" value="${fn:substring(vo.qnaIdx,0,fn:indexOf(vo.qnaIdx,'_'))}"/></c:if>
		      <c:set var="tempQnaIdx" value="${fn:substring(vo.qnaIdx,0,fn:indexOf(vo.qnaIdx,'_'))}"/>
			    <tr>
						<td>
							<c:if test="${vo.reply=='미답변'}">
								<font color="red">${vo.reply}</font>						
							</c:if>
							<c:if test="${vo.reply=='답변완료'}">
								${vo.reply}						
							</c:if>
						</td>
						<td>
			        <c:if test="${!empty vo.FSName}"><img src="${ctp}/data/qna/${vo.FSName}" width="75px"/><br/></c:if>
						</td>
			      <td style="text-align:left;">
			        <c:if test="${vo.pwd != '' && vo.nickName != sNickName }">비밀글 입니다.</c:if>
			        <c:if test="${vo.pwd == ''}"><a href="qnaContent?pag=${pageVO.pag}&idx=${vo.idx}&title=${vo.title}">${vo.title}</a></c:if> <!-- 비밀글이 아니면 모두가 볼 수 있다. -->
			        <c:if test="${vo.pwd != '' && (vo.nickName==sNickName || sLevel == 0)}"> <!-- 비밀글이면 '나'와 '관리자'만 볼 수 있다 -->
			          <a href="qnaContent?pag=${pageVO.pag}&idx=${vo.idx}&title=${vo.title}">${vo.title}</a>
			          <c:set var="tempName" value="${vo.nickName}"/>
			          <c:set var="tempSw" value="1"/>
			        </c:if>
			        <c:if test="${!empty vo.pwd}"><i class="fas fa-lock"></i></c:if>
			        <c:if test="${vo.diffTime <= 24}"><font color="orange" style="font-style: italic;"><b>NEW</b></font></c:if>
			      </td>
			      <td>${vo.nickName}</td>
			      <td>
			        ${fn:substring(vo.WDate,0,10)}
			      </td>
			    </tr>
			    <c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
			    <c:set var="cnt" value="${cnt+1}"/>
	        <c:set var="tempSw" value="0"/>
	        <c:set var="tempPreName" value=""/>
		    </c:forEach>
				<tr><td colspan="7" class="p-0"></td></tr>
  </table>
</div>
<!-- 블록페이징처리 시작 -->
<div  style="text-align:center;">
<c:if test="${pageVO.totPage != 0}">
  <ul class="pagination justify-content-center">
	  <c:set var="startPageNum" value="${pageVO.pag - (pageVO.pag-1)%pageVO.blockSize}"/>
	  <c:if test="${pageVO.pag != 1}">
	    <li class="page-item"><a href="qnaList?pag=1&pageSize=${pageVO.pageSize}" class="page-link" style="color:#666">◁◁</a></li>
	    <li class="page-item"><a href="qnaList?pag=${pageVO.pag-1}&pageSize=${pageVO.pageSize}" class="page-link" style="color:#666">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="0" end="${pageVO.blockSize-1}">
	    <c:if test="${(startPageNum+i) <= pageVO.totPage}">
		  	<c:if test="${pageVO.pag == (startPageNum+i)}">
		  	  <li class="page-item active"><a href="qnaList?pag=${startPageNum+i}&pageSize=${pageVO.pageSize}" class="page-link btn btn-secondary active" style="color:#666"><font color="#fff">${startPageNum+i}</font></a></li>
		  	</c:if>
		  	<c:if test="${pageVO.pag != (startPageNum+i)}">
		  	  <li class="page-item"><a href="qnaList?pag=${startPageNum+i}&pageSize=${pageVO.pageSize}" class="page-link" style="color:#666">${startPageNum+i}</a></li>
		  	</c:if>
	  	</c:if>
	  </c:forEach>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="qnaList?pag=${pageVO.pag+1}&pageSize=${pageVO.pageSize}" class="page-link" style="color:#666">▶</a></li>
	    <li class="page-item"><a href="qnaList?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}" class="page-link" style="color:#666">▷▷</a></li>
	  </c:if>
  </ul>
</c:if>
</div>
<!-- 블록페이징처리 끝 -->
<br><br>
<!-- 검색기 처리 시작 -->
<div  style="text-align:center">
  <form name="searchForm" method="get" action="qnaSearch">
    <select name="search" onchange="sChange()">
    	<option value="title" selected>글제목</option>
    	<option value="nickName">글쓴이</option>
    	<option value="content">글내용</option>
    </select>
    <input type="text" name="searchString" />
    <button type="button" class="btn btn-dark" onclick="sCheck()">검색</button>
    <input type="hidden" name="pag" value="${pageVO.pag}"/>
    <input type="hidden" name="pageSize" value="${pageVO.pageSize}"/>
  </form>
</div>
<!-- 검색기 처리 끝 -->


</div>
</body>
 <footer class="w3-center w3-padding-64" style="background-color:#0b141e;padding: 30px; text-align:center;">
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</footer>
</html>
