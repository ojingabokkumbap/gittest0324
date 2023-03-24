<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>리그 오브 레전드</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<style>

body, html {
  height: 100%;
  line-height: 1.8;
}

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

.w3-bar .w3-dropdown-hover, .w3-bar .w3-dropdown-click {
    position: static;
    float: right;
}


</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!-- Header with full-height image -->
<header class="w3-display-container w3-grayscale-min" id="home">
<div>
  	<video muted autoplay loop style="width:100%;margin-top: -365px;">
        <source src="${ctp}/images/hero-blurred.webm" type="video/webm">
     </video>
  <div class="w3-display-left w3-text-white" style="margin-left: 450px;">
  	<video muted autoplay loop style="width: 80%;height: 68%;margin-left: -4%;margin-top: 215px;border-radius: 15px;" >
        <source src="${ctp}/images/mainvideo.mp4" type="video/mp4">
     </video>
     <div class="mainimg" >
	   	<a><img src="${ctp}/images/LOLlogo.png"  width="40%;"></a>
	     <br/>
    	   <a><img src="${ctp}/images/play.png" width="12%" style="margin-left:190px;"></a>
    	</div>
  </div> 
  <div class="w3-display-bottomleft w3-text-grey w3-large" style="padding:24px 48px">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
  </div>
</div>
</header>
<!-- About Section -->
<div class="w3-container" style="padding:120px 10px"  id="about">
  <div class="w3-row-padding w3-center" style="margin-top:-60px;" >
    <div class="w3-quarter" id="boarditems" >
    <div  style="float:left;">
    	<img src="https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/bltf8874e4b9be8d14e/63cf0f5234241c3f91d088be/Lunar-Empress-Qiyana---Final.jpg?quality=90&crop=1%3A1&width=480" width="165px" height="200px" />  &nbsp;&nbsp;&nbsp;
     </div>
      <div style="text-align:left;">
     <p class="w3-small" style="margin-top: 0px; color:lightgrey; "><b>게임 업데이트</b></p>
     <p class="w3-large" style="margin-bottom: 0px; margin-top: 0px;"><b>13.1B 패치 상점소식</b></p>
      <h6 style="margin-top: 0px;">달빛 여왕, 황제, 수호자의 행차입니다.</h6>
      </div>
    </div>
    <div class="w3-quarter" id="boarditems">
         <div  style="float:left;">
    	<img src="https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt4f8032709ccb10a7/63bcc87708dfb21202a77951/LoL_LUNY23_YT_Cinematic-Thumbnail_V9-textless.jpg?quality=90&crop=1%3A1&width=480" width="165px" height="200px" />  &nbsp;&nbsp;&nbsp;
     </div>
      <div style="text-align:left;">
     <p class="w3-small" style="margin-top: 0px; color:lightgrey; "><b>미디어</b></p>
     <p class="w3-large" style="margin-bottom: 0px; margin-top: 0px;"><b>올라타세요!</b></p>
      <h6 style="margin-top: 0px;">모두 올라타셨나요? 이제 출발합니다! 마법 버스에 올라 인생 최고의 모험을 떠나보세요!</h6>
      </div>
    </div>
    <div class="w3-quarter" id="boarditems">
      <div  style="float:left;">
    	<img src="https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/bltda0dae89c3a77cbb/63bdf6b20f1613130873a349/Base_Ornn_Splash_opt.jpg?quality=90&crop=1%3A1&width=480" width="165px" height="200px" />  &nbsp;&nbsp;&nbsp;
     </div>
      <div style="text-align:left;">
     <p class="w3-small" style="margin-top: 0px; color:lightgrey; "><b>개발자 블로그</b></p>
     <p class="w3-large" style="margin-bottom: 0px; margin-top: 0px;"><b>2023년 1월 게임플레이에 대한 단상 - 신화급 탱커 아이템</b></p>
      <h6 style="margin-top: 0px;">기획자가 새로운 신화급 탱커 아이템이 협곡에 어떻게 자리를 잡았는지 말씀드립니다.</h6>
      </div>
    </div>
  </div>
</div>
 <%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}


// Toggle between showing and hiding the sidebar when clicking the menu icon
var mySidebar = document.getElementById("mySidebar");

function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
  } else {
    mySidebar.style.display = 'block';
  }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
}
</script>
</body>
</html>