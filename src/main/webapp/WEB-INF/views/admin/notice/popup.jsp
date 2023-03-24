<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
.modal-content {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    width: 100%;
    pointer-events: auto;
    background-color: #fff;
    background-clip: padding-box;
    border: 0px;
    border-radius: .3rem;
    outline: 0;
}
  </style>
  <title>공지사항</title>
  <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
  <script>
    function closePopup() {
    	if(document.getElementById("check").value) {
    		setCookie("popupYN${vo.idx}","N",1);
    		self.close();
    	}
    }
    
    // 유효시간 1일 : todayDate.setTime(todayDate.getTim() + (expiredays * 24 * 60 * 60 * 1000))
    // 유효시간 1분 : todayDate.setMinutes(todayDate.getMinutes() + expiredays)
    // setCookie(쿠키명, 쿠키값, 쿠키유효시간)
    function setCookie(name, value, expiredays) {
    	var date = new Date();
    	date.setDate(date.getDate() + expiredays);
    	document.cookie = escape(name) + "=" + escape(value) + "; expires="+date.toUTCString()+"; path=${ctp}";
    }
    
    //공지사항 전체 보기
    function notifyView() {
    	opener.location.href = "${ctp}/dbShop/dbShopNoticeList";
    	window.close();
    }
  </script>
</head>
<body>
<div class="modal-dialog modal-dialog-centered">
  <div class="modal-content" style="border:none;">
    <!-- Modal body -->
    <div class="modal-body" style="padding:0 ;">
    <a href="javascript:notifyView()">
    	<img src="${ctp}/data/notice/${vo.FSName}" style="width: 370px;    height: 540px;"/>
      ${vo.content}
    </a>
    </div>
    <!-- Modal footer -->
    <div class="modal-footer">
      <input type="checkbox" id="check" onclick="closePopup()">
      <font size="3"><b>하루에 한번만 보기</b></font>
    </div>
  </div>
</div>
</body>
</html>