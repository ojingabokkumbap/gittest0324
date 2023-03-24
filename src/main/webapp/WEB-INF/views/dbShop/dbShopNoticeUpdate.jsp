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
	margin-top : 10%;
}
		
* {
	margin:0;
	padding:0;
	box-sizing:border-box;
	-webkit-box-sizing:border-box;
	-moz-box-sizing:border-box;
	-webkit-font-smoothing:antialiased;
	-moz-font-smoothing:antialiased;
	-o-font-smoothing:antialiased;
	font-smoothing:antialiased;
	text-rendering:optimizeLegibility;
}


.container {
	max-width:1000px;
	max-height:900px;
	width:100%;
  border: solid 1px lightgray;
  box-shadow: 15px 15px 11px -5px;
  border-radius: 15px;
  margin: o;
  margin-top: 10%;
  margin-bottom: 5%;
	padding : 50px;
}


#contact h3 {
	color: #888888;
	display: block;
	font-size: 30px;
	font-weight: 400;
}

#contact h4 {
	margin:5px 0 15px;
	display:block;
	font-size:13px;
}

fieldset {
	border: medium none !important;
	margin: 0 0 10px;
	min-width: 100%;
	padding: 0;
	width: 100%;
}

#contact input[type="text"], #contact input[type="email"], #contact input[type="tel"], #contact input[type="url"], #contact textarea {
	width:100%;
	border:1px solid #CCC;
	background:#FFF;
	margin:0 0 5px;
	padding:10px;
}

#contact input[type="text"]:hover, #contact input[type="email"]:hover, #contact input[type="tel"]:hover, #contact input[type="url"]:hover, #contact textarea:hover {
	-webkit-transition:border-color 0.3s ease-in-out;
	-moz-transition:border-color 0.3s ease-in-out;
	transition:border-color 0.3s ease-in-out;
	border:1px solid #AAA;
}

#contact textarea {
	height:350px;
	max-width:100%;
  resize:none;
}

#contact button[type="submit"] {
    cursor: pointer;
    width: 100px;
    border: none;
    background: #6c757d;
    color: #FFF;
    margin: 0 0 5px;
    padding: 10px;
    font-size: 15px;
}

#contact button[type="submit"]:hover {
	background:#09C;
	-webkit-transition:background 0.3s ease-in-out;
	-moz-transition:background 0.3s ease-in-out;
	transition:background-color 0.3s ease-in-out;
}

#contact button[type="submit"]:active { box-shadow:inset 0 1px 3px rgba(0, 0, 0, 0.5); }

#contact input:focus, #contact textarea:focus {
	outline:0;
	border:1px solid #999;
}
::-webkit-input-placeholder {
 color:#888;
}
:-moz-placeholder {
 color:#888;
}
::-moz-placeholder {
 color:#888;
}
:-ms-input-placeholder {
 color:#888;
}

select {
    width: 6em;
    word-wrap: normal;
    background-color: #fffff;
    height: 30px;
}

#contact button[type="submit"] {
    cursor: pointer;
    width: 100px;
    border: none;
    background: #25ab61;
    color: #FFF;
    margin: 0px 3px 0px;
    border-radius: 3px;
    padding: 9px;
    font-size: 15px;
}
	
.container{

}

.zRVNb6dB4r {
    padding-bottom: 15px;
    border-bottom: 2px solid #000;
    font-size: 30px;
    line-height: 25px;
    color: #000;
}

</style>
<jsp:include page="/WEB-INF/views/include/shopNav.jsp"></jsp:include>
<script>
'use strict';
function fCheck(){
	let part = myform.part.value;
	let title = myform.title.value;
	let content = myform.content.value;
	
	if(part.trim() == "" || title.trim() == "" || content.trim() == ""){
		alert("칸을 모두 입력해야 합니다.");
		return false;
	}
	else {
		myform.submit();
	}
}

// 대분류 등록
</script>
<body>
<section>
	<div class="container">  
		<h1 class="zRVNb6dB4r"><b>공지사항</b></h1>
		<br>
	  <form id="contact" name="myform" method="post" >
	    <fieldset>
	  		<select name="part" class="custom-select">
			    <option value="배송지연">배송지연</option>
			    <option value="기타" selected>기타</option>
			    <option value="이벤트">이벤트</option>
			    <option value="상품">상품</option>
		  	</select>
	    </fieldset>
	    <br>
	    <fieldset>
	       <input placeholder="제목" value="${vo.title}" name="title" id="title" type="text" tabindex="2">
	    </fieldset>
	    <fieldset>
	      <textarea name="content" id="content" placeholder="내용을 입력하세요." class="mt-3" tabindex="5">${vo.content}</textarea>
	    </fieldset>
	    <br>
      <input type="button" value="수정" onclick="fCheck()" class="btn btn-primary btn-block" />
       <input type="hidden" name="pag" value="${pag}"/>
    	<input type="hidden" name="pageSize" value="${pageSize}"/>
    </form>
	</div>
</section>
<footer class="w3-center w3-padding-64" style="background-color:#0b141e;padding: 30px; text-align:center;">
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</footer>
</body>
</html>
