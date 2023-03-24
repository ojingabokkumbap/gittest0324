<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
 <head>
    <meta charset="UTF-8">
    <title>title</title>
    <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
</head>
<script>

$(document).ready(function () {

	  $('.menu').niceScroll({
	    cursorcolor: '#999999', // Changing the scrollbar color
	    cursorwidth: 4, // Changing the scrollbar width
	    cursorborder: 'none', // Rempving the scrollbar border
	  });

	  // when opening the sidebar
	  $('.nav-icon').on('click', function () {
	    // open sidebar
	    $('.menu').toggleClass('open');
	  });

	  // if dismiss or overlay was clicked
	  $('#dismiss').on('click', function () {
	    $('#sidenav').removeClass('open');
	  });
	});


</script>
<style>
	@import url("https://fonts.googleapis.com/css?family=Lato:400,300,700,900,400italic");
  @import url("https://fonts.googleapis.com/earlyaccess/jejugothic.css");
body {
  font-size: 14px;
  font-family: Lato, "Helvetica Neue", Helvetica, Arial, sans-serif;
  color: #666;
  background: #f2f2f2;
  /*-webkit-text-size-adjust: 100%;*/
  -moz-osx-font-smoothing: grayscale;
  /*-webkit-font-smoothing: antialiased;*/ }

a {
  text-decoration: none; }
  a:hover {
    text-decoration: none; }

/* ------------ Sidenav CSS ------------- */
#sidenav {
  position: fixed;
  width: 300px;
  height: auto;
  top: 0;
  bottom: 0;
  left: 0;
  z-index: 99999;
  background: #101010; }
  #sidenav.open {
    left: -300px; }
  #sidenav .logo {
    width: 100%;
    padding: 20px 50px;
    background: #101010;
    display: block; }
    #sidenav .logo a {
      color: #dadada;
      font-size: 30px; }
      #sidenav .logo a.nav-icon {
        display: none; }
  #sidenav .menu {
    position: static; }
    #sidenav .menu ul {
      list-style: none;
      background: #101010;
      padding: 10% 0;
      margin: 0; }
      #sidenav .menu ul li {
        padding: 6px 14%; }
        #sidenav .menu ul li.active {
          border-left: solid 4px red; }
        #sidenav .menu ul li a {
          font-size: 22px;
          color: rgba(255, 255, 255, 0.7);
          font-weight: 300;
          display: block; }
          #sidenav .menu ul li a:hover {
            color: rgba(255, 255, 255, 0.5); }
          #sidenav .menu ul li a.logout:hover {
            color: red; }
        #sidenav .menu ul li ul {
          list-style: none;
          margin: 10px auto 0;
          padding: 10px 15px;
          border-top: solid 1px rgba(255, 255, 255, 0.08);
          border-bottom: solid 1px rgba(255, 255, 255, 0.08); }
          #sidenav .menu ul li ul li {
            padding: 6px 3px; }
            #sidenav .menu ul li ul li a {
              font-size: 18px;
              color: rgba(255, 255, 255, 0.7); }

@media (max-width: 768px) {
  #sidenav {
    width: 100%;
    height: 60px;
    background: none; }
    #sidenav .logo {
      padding: 10px 20px; }
      #sidenav .logo a {
        font-size: 20px; }
        #sidenav .logo a.nav-icon {
          display: inline; }
    #sidenav .menu {
      display: none; }
      #sidenav .menu.open {
        position: fixed;
        top: 0;
        bottom: 0;
        right: 0;
        left: 0;
        z-index: -1;
        display: block !important; }
      #sidenav .menu ul {
        border-top: solid 1px #333; }
        #sidenav .menu ul li {
          padding: 6px 5%; } }

/*# sourceMappingURL=app.main.css.map */
</style>
<body>
	  <div class="app">
    <div id="sidenav">
      <div class="wrapper">
        <div class="logo">
          <img style="margin-top:5%; width:180px; border:none" src="${ctp}/resources/images/LOLlogo.png"/>
      	</div>
        </div>
        <div class="menu">
          <ul>
            <li class="active"><a href="${ctp}/">홈</a></li>
            <li><a href="${ctp}/admin/adminMain"><b>리포트</b></a></li>
            <li><a href="${ctp}/admin/member/adminMemberList"><b>회원 관리</b></a></li>
            <!-- If login as admin -->
            <li>
              <a href="#">스토어 관리</a>
                <ul>
                  <li><a href="${ctp}/dbShop/dbCategory">상품 등록</a></li>
                  <li><a href="${ctp}/dbShop/dbAdminProductList">상품 조회</a></li>
                  <li><a href="${ctp}/admin/member/adminMemberList">주문 관리</a></li>
                  <li><a href="${ctp}/dbShop/couponInput">쿠폰 등록</a></li>
                </ul>
            </li>
            <!-- End If login as admin -->
            <li>
              <a href="#">게시판 관리</a>
                <ul>
                  <li><a href="${ctp}/admin/notice/adNoticeList">공지사항</a></li>
                  <li><a href="${ctp}/admin/qna/adQnaList">묻고 답하기</a></li>
                </ul>
            </li>
            <li><a href="#">Contact Us</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
