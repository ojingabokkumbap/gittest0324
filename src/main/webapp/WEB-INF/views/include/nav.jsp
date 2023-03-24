<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!-- Navbar (sit on top) -->
<style>
/* Full height image header */
.bgimg-1 {
  background-position: center;
  background-size: cover;
  background-image: url("/w3images/mac.jpg");
  min-height: 100%;
}

.w3-bar .w3-button {
  padding: 16px;
}
.w3-dropdown-content {
    cursor: auto;
    color: #000;
    background-color: #fff;
    display: none;
    position: absolute;
    min-width: 160px;
    margin-top: 60px;
    padding: 0;
}

.w3-white {
    color: #fff!important;
    background-color: #111!important;
}

.mainimg {
  position: absolute;
  width: 100%;
  top: 64%;
  left: 65%;
  transform: translate(-50%,-50%);
}



.w3-bar .w3-button {
    padding: 16px;
    margin-top: 12px;
    font-weight: bold;
    font-size: 13px;
}

#boarditems{
		outline: solid 1px darkgrey;
    padding: 10px;
    margin: 77px;
    border-top-left-radius: 75px;
    border-bottom-right-radius: 75px;
}

.w3-button:hover {
    color: #888!important;
    background-color: #111!important;
}
h6 {
    font-size: 13px;
}

</style>
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar" >
    <!-- Right-sided navbar links -->
    <a href="${ctp}/"><img src="${ctp}/images/mainlogo.png" style="width:230px; float:left;"></a>
    <!-- 
    <div class="w3-left w3-hide-small"> 
      <a href="#about" class="w3-bar-item w3-button">게임 정보</a>
      <a href="#team" class="w3-bar-item w3-button"></i>챔피언</a>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-bar-item w3-button" title="More">새소식
      <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4" style="background-color:#333333; color:lightgrey;">
        <a href="#" class="w3-bar-item w3-button">Merchandise</a>
        <a href="#" class="w3-bar-item w3-button">Extras</a>
        <a href="#" class="w3-bar-item w3-button">Media</a>
      </div>
    </div>
      <a href="#work" class="w3-bar-item w3-button">패치노트</a>
      <a href="#pricing" class="w3-bar-item w3-button">다운로드</a>
       -->
      <a href="${ctp}/dbShop/dbMyOrder" class="w3-bar-item w3-button">마이페이지</a>
      <a href="${ctp}/dbShop/dbShopNoticeList" class="w3-bar-item w3-button">쇼핑 스토리</a>
      <a href="${ctp}/qna/qnaList" class="w3-bar-item w3-button">묻고 답하기</a>
      <a href="${ctp}/dbShop/dbShopMain" class="w3-bar-item w3-button">라이엇 스토어</a>
      <c:if test="${sLevel == 0}">
      <a href="${ctp}/admin/adminMain" class="w3-bar-item w3-button">관리자</a>
      </c:if>
      <c:if test="${empty sLevel}">
      <div style="margin-left:1700px; margin-top: 13px;">
      	<a href="${ctp}/member/memberLogin"><img src="${ctp}/images/loginbtn.png" width="90px" ></a>
      	<a href="${ctp}/member/memberJoin"><img src="${ctp}/images/joinbtn.png" width="100px"></a>
      </div>
      </c:if>
      <c:if test="${!empty sLevel}">
      <div style="margin-left: 1450px; ">
				<div class="w3-dropdown-hover" style="float:right;">
      <button class="w3-bar-item w3-button" style="margin-top: 0px; background-color:#111;  title="More ">
      <h4><span class="badge badge-dark"> ${sNickName} &nbsp;
      <font color="grey"><i class="fa fa-caret-down"></i></font></button></span></h4>
      <div class="w3-dropdown-content w3-bar-block w3-card-4" style="background-color:#333333;  color:lightgrey;">
        <a href="${ctp}/member/memberMain" class="w3-bar-item ">계정 관리</a>
        <a href="${ctp}/member/memberPwdUpdate" class="w3-bar-item ">비밀번호 변경</a>
        <a href="${ctp}/member/memberLogout" class="w3-bar-item ">로그아웃</a>
      </div>
    </div>
				</div>     	
			</div>
      </c:if>
    </div>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close ×</a>
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">ABOUT</a>
  <a href="#team" onclick="w3_close()" class="w3-bar-item w3-button">TEAM</a>
  <a href="#work" onclick="w3_close()" class="w3-bar-item w3-button">WORK</a>
  <a href="#pricing" onclick="w3_close()" class="w3-bar-item w3-button">PRICING</a>
  <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button">CONTACT</a>
</nav>

