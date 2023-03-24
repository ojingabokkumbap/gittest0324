<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en" style="overflow-x:hidden">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap');


* {
 
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  border:0px solid silver;
}

img {
  width: 100px; 
}

body {
  min-width: 420px;
  color: #000;
  font-size: 1rem;
  line-height: 2rem;
}

a:link {
  text-decoration: none;
}

a:visited {

}

li, p, small{
  font-family:'Noto Sans KR', sans-serif;
}

h1,h2, h3, a{
}

button{
  width: 180px;
  height: 40px;
  padding: 5px 10px;
  transition: 0.7s;
  transition-timing-function: ease-in-out;
  cursor: pointer;
  text-transform: uppercase;
  background: none;
  border: 1px solid #999;
  color: #999;
}

button:hover{
  background: white;
  color: black;
}

[data-trigger]{
	opacity:0;
	position:relative;
	top:30px;
	transition:1.5s ease-out;
}

[data-trigger].visible{
	opacity:1;
	top:0;
}

/* start */
/*header*/
header{
  padding:10px 20px;
}

header img{
  width: 100px;
  padding-top: 10px;
}

header> :nth-child(2){
  float:right;
}

header> :nth-child(3){
  width: 25px;
  float: right;
  cursor: pointer;
}

#sidebar {
  position: absolute;
  width: 100%;
  height:100vh;
  background: #fff;
  left: -100%;
  transition: .4s;
  z-index: 99;
  padding-top: 50px;
}

#sidebar.active {
  left: 0;
}

#sidebar ul li{
  list-style: none;
}

#sidebar ul li a {
  display: flex;
  color:#2e3c50;
  font-size: 1.5rem;
  padding: 30px 60px;
  cursor: pointer;
  text-decoration: none;
  transition: .5s;
}

#sidebar ul li a:hover{
  padding-left: 85px;
}

.menu-trigger,
.menu-trigger span {
  display: inline-block;
  transition: all 0.4s;
  box-sizing: border-box;
}

.menu-trigger {
  position: relative;
  width: 40px;
  height: 34px;
  margin: 10px;
}

.menu-trigger span {
  position: absolute;
  width: 30px;
  height: 3px;
  background-color: #000;
  border-radius: 4px;
}

.menu-trigger span:nth-of-type(1) {
  top: 0;
}

.menu-trigger span:nth-of-type(2) {
  top: 10px;
}

.menu-trigger span:nth-of-type(3) {
  top:20px;
}

header> :last-child{
  display: none;
}



/*main*/
main{
  height:700px;
}

main .swiper-container {
  width: 100%;
  height: 120%;
}

main .swiper-slide {
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}

main .swiper-slide div{
  position: absolute;
  width: 80%;
  height: 200px;
  top: 50px;
  left: 0;
  padding: 20px 0 0 30px;
}

main .swiper-slide div h3{
  font-weight: lighter;
  padding: 10px 0;
}

main .swiper-slide div h1{
  color:#441e20;
  font-size: 1.85rem;
  line-height: 3rem;
}

main .swiper-slide img {
  display: block;
  width: 100%;
  object-fit: cover;
}

main .swiper-pagination{
  display: none;
}


/*article1*/
.best{
  padding: 50px 0;
  margin-top: 130px;
  background: linear-gradient( #e1e1e1ad  50%, #fff 50% );
}

.best h1{
  text-align: center;
  line-height: 5rem;
  text-transform: uppercase;
}

.best .swiper-slide{
  height: 700px;
  position: relative;
}

.best .swiper-slide img{
  width: 80%;
  display: block;
  object-fit: cover;
  margin: auto;
}

.best .swiper-slide img:hover{
  transform:rotate(-5deg);
  transition: .4s;
}

.best .swiper-slide div{
  width: 100%;
  height: 300px;
  padding: 50px 10px;
  text-align: center;
}

.best .swiper-slide div p{
  font-weight: lighter;
  margin-top: 30px;
  font-size: 0.9rem;
}



/*banner*/
.banner{
  padding: 20px;
}

.banner section{
  height: 650px;
}

.banner section h3{
  transform: rotate(270deg);
  display: block;
  float: left;
  font-size: 1rem;
  text-transform: uppercase;
  margin-top: 40px;
}

.banner section div{
  width: 85%;
  float: right;
}

.banner section div img{
  display: block;
  width:100%;
  object-fit: cover;
}

.banner section div :nth-child(2){
  margin-top: 10px;
  line-height: 2.5rem;
}

.banner section div :nth-child(3){
  color:#777;
}


.banner2{
  padding: 20px;
  margin-top: 50px;
}

.banner2 section{
  height: 650px;
  margin-bottom: 50px;
}

.banner2 section h3{
  transform: rotate(270deg);
  display: block;
  float: left;
  font-size: 1rem;
  text-transform: uppercase;
  margin-top: 40px;
}

.banner2 section div{
  width: 85%;
  float: right;
}

.banner2 section div img{
  display: block;
  width:100%;
  object-fit: cover;
}

.banner2 section div :nth-child(2){
  margin-top: 10px;
  line-height: 2.5rem;
}

.banner2 section div :nth-child(3){
  color:#777;
}

.banner2> :first-child{
  height: 400px;
}

/*article*/
.banner3{
  height: 500px;
  background: url('https://www.yunjac.com/images/ex/prd_detail_bg1.jpg') no-repeat;
  background-position:center;
  background-size:cover;
  margin-bottom: 100px;
  position: relative;
}

.banner3 div{
  position: absolute;
  top: 50%;
  left: 50%;
  transform:translate(-50%, -50%);
}

.banner3 h2{
  color: #fff;
  padding-bottom: 30px;
  letter-spacing: 3px;
}

.banner3 p{
  color: #fff;
  font-weight: lighter;
  margin-bottom: 40px;
}




/*insta*/
.insta{
  text-align: center;
  text-transform: uppercase;
  padding: 20px;
}

.insta> :nth-child(2){
  line-height: 2rem;
  margin-bottom: 30px;
}

.insta .swiper-slide{
  width: 200px;
  height: 200px;
}

.insta div img{
  display: block;
  width:100%;
  object-fit: cover;
}

.insta button{
  margin: 30px 0;
}


@media screen and (min-width:800px){
  header{
    padding: 10px 80px;
    position: fixed;
    width: 100%;
    z-index: 99;
    background: #fff0;
  }

  header > :nth-child(3){
    float: right;
  }

  #sidebar{
    display: none;
  }

  .menu-trigger{
    display: none;
  }

  header> :last-child{
    display: block;
  }

  #navbar{
    position: fixed;
    top: 0;
    display: block;
    transition: top 0.8s;
    line-height: 4rem;
    padding: 0 0 0 10%;
  	 text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
}
  }

  #navbar a{
    float: left;
    display: block;
    color:white;
    text-decoration: none;
    margin: 0 40px 0 0;
  }

  main .swiper-slide div{
    padding: 100px 0 0 200px;
  }

  main .swiper-slide div h3{
    padding: 50px 0;
  }

  main .swiper-slide div h1{
    font-size: 2rem;
  }

  .best{
    margin-bottom: 300px;
  }

  .banner{
    width: 1200px;
    margin: 0 auto;
    padding: 0;
    display: flex;
    margin-bottom: 100px;
  }

  .banner section{
    width: 400px;
  }

  .banner section img{
    width: 300px;
    height: 500px;
  }

  .banner section:hover{
    top:-20px;
    transition: .4s;
  }

  .banner> :last-child h3{
    font-size: 0.9rem;
  }

  .banner2{
    width: 1200px;
    height: 1500px;
    margin: 0 auto;
    padding: 0;
    margin-bottom: 200px;
  }

  .banner2> :first-child{
    width: 50%;
    height: 500px;
    float: left;
  }

  .banner2> :first-child h3{
    margin-left: 10px;
  }

  .banner2> :nth-child(2){
    width: 40%;
    float: right;
  }

  .banner2> :nth-child(2) h3{
    margin-left: 10px;
  }

  .banner2> :nth-child(3){
    clear: both;
    width: 50%;
    height: 800px;
    margin-left: 70px;
  }

  .banner2 section{
    margin-bottom: 0;
  }

  .banner2 section:hover{
    top:-20px;
    transition: .4s;
  }

  .banner3{
    margin-bottom: 200px;
  }

  .insta{
    width: 1200px;
    margin: 0 auto;
    margin-bottom: 100px;
  }

  .insta .swiper-slide{
    width: 250px;
    height: 250px;
  }
	.w3-button:hover {
    color: #000!important;
    background-color:white;
    text-decoration:none;
	}
	
	html,
body {
	height: 100%;
}

.container {
	display: flex;
	height: 100%;
	justify-content: center;
	align-items: center;
}

.rectangle {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	positon: relative;
	width: 50px;
	height: 50px;
	background:#ffce28;
	transform: scale(0);
	border-radius: 50%;
	color: black;
	opacity: 0;
	overflow: hidden;
	animation: scale-in .3s ease-out forwards,
		expand .35s .25s ease-out forwards;
}

.notification-text {
	display: flex;
	align-items: center;
	padding: 0 16px;
	font-family: 'Roboto', sans-serif;
	font-size: 14px;
	animation: fade-in .65s ease-in forwards;
}

@keyframes scale-in {
	100% {
		transform: scale(1);
		opacity: 1;
	}
}

@keyframes expand {
	50% {
		width: 350px;
		border-radius: 6px;
	}
	100% {
		width: 300px;
		border-radius: 4px;
		box-shadow: 0px 1px 3px 0px rgba(0,0,0,.2),
								0px 1px 1px 0px rgba(0,0,0,.14),
								0px 3px 3px -1px rgba(0,0,0,.12);
	}
}

@keyframes fade-in {
	0% {
		opacity: 0;
	}
	100% {
		opacity: .8;
	}
}

.w3-bar .w3-bar-item {
    padding: 8px 16px;
    float: left;
    width: auto;
    border: none;
    display: block;
    outline: 0;
    color:white;
}
</style>
<script>

function popupCheck() {
	  <c:forEach var="popup" items="${popupVos}"> /* home컨트롤러에서 popupSw가 'Y'인 자료만 보내준다. */
	  	var url = "${ctp}/admin/popup?idx=${popup.idx}";
	  	openPopup(url,${popup.idx});
	  </c:forEach>
}

var xPos = 0;
function openPopup(url,idx) {		
	  xPos += 100;
	  var cookieCheck = getCookie("popupYN"+idx);
	  if(cookieCheck != "N") {
	  	window.open(url,"","width=400,height=600,left="+xPos+",top=5");
	  }
}


// 쿠키값으로 처리하려다가 popupSw가 'Y'인 자료만 출력했다.
function getCookie(name) {
	  var cookie = document.cookie;  // 클라이언트에 저장된 쿠키의 정보를 읽어(가져)온다.
	  if(cookie != "") {
		  var cookieArray = cookie.split("; ");
		  for(var index in cookieArray) {
			  var cookieName = cookieArray[index].split("=");
			  if(cookieName[0] == name) {
				  return cookieName[1];
			  }
		  }
	  }
	  return;
}

function show() {
// sidebar id 요소에 active 클래스를 넣었다 뺐다 하라.
  document.getElementById('sidebar').classList.toggle('active');
}

// classList - https://www.w3schools.com/jsref/prop_element_classlist.asp

</script>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
  <title>라이엇스토어</title>
  <link rel="stylesheet" href="style.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
  <script type="text/javascript" src="script.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollTrigger/1.0.5/ScrollTrigger.min.js"></script>
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>

<body onload="javascript:popupCheck()">
  <header>
  	<div>
  	 <!-- Navbar -->
<div class="w3-top" style="margin-right:10%;  color : white;">
	<div style="margin-left: -7.8%; padding-top: 10px;  padding-bottom: 10px;">
    <a href="${ctp}/h"><img src="https://shop-phinf.pstatic.net/20220714_15/1657779019733qylMX_PNG/rogo_2.png?type=m10000_10000" style="
    width: 200px;
    margin-left: 45%;
    margin-top: 10px;"></a>
	</div>
  <div class="w3-bar w3-white w3-card" style="box-shadow:none; margin-left: 6%; background-color: #fff0!important; ">
     <c:forEach var="subTitle" items="${subTitleVos}" varStatus="st">
		<a href="${ctp}/dbShop/dbProductList?part=${subTitle.categorySubName}" class="w3-bar-item w3-button w3-padding-large w3-hide-small">${subTitle.categorySubName}</a>
			<c:if test="${!st.last}"> </c:if>
 	</c:forEach>
 		<a href="${ctp}/dbShop/dbProductList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">전체 상품</a>
 		<a href="${ctp}/dbShop/dbShopNoticeList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">쇼핑 스토리</a>
     <a href="${ctp}/qna/qnaList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">묻고 답하기</a>
     <a href="${ctp}/dbShop/dbMyOrder" class="w3-bar-item w3-button w3-padding-large w3-hide-small">마이 페이지</a>     
     <a href="${ctp}/dbShop/dbCart" class="w3-bar-item w3-button w3-padding-large w3-hide-small">장바구니</a>
     <c:if test="${sLevel == 0}">
     <a href="${ctp}/admin/adminMain" class="w3-bar-item w3-button w3-padding-large w3-hide-small">
     <b>관리자 전용</b>
     </a>
     </c:if>
  </div>
</div>
	</div>
    <a class="menu-trigger" href="#" onclick="show()">
      <span></span>
      <span></span>
      <span></span>
    </a>
    <nav id="sidebar">
      <ul>
        <li><a href="#">의류</a></li>
        <li><a href="#">인형</a></li>
        <li><a href="#">스태츄</a></li>
        <li><a href="#">액세서리</a></li>
      </ul>
    </nav>

 </header>


  <main>
      <div class="swiper-container mySwiper">
        <div class="swiper-wrapper">

          <div class="swiper-slide" style="background:url(https://shop-phinf.pstatic.net/20230228_197/1677564154504vGJvv_JPEG/01_Ash_naver_main_1920x860.jpg?type=m10000_10000); background-size:cover;background-position:center;">
          </div>
          <div class="swiper-slide" style="background:url(https://shop-phinf.pstatic.net/20230228_125/16775642266173bemr_JPEG/02_Irelia_naver_main_1920x860.jpg?type=m10000_10000); background-size:cover;background-position:center;">
          </div>
          <div class="swiper-slide" style="background:url(https://shop-phinf.pstatic.net/20230228_41/1677564344346gDURp_JPEG/04_Key_naver_main_1920x860.jpg?type=m10000_10000); background-size:cover;background-position:center;">
          </div>
          <div class="swiper-slide" style="background:url(https://shop-phinf.pstatic.net/20230215_111/1676446515744mCauT_JPEG/03_Poro_naver_main_1920x860.jpg?type=m10000_10000); background-size:cover;background-position:center;">
          </div>
          <div class="swiper-slide" style="background:url(https://shop-phinf.pstatic.net/20230208_11/16757831520390fWbq_JPEG/01_Yuumi_naver_main_1920x860.jpg?type=m10000_10000); background-size:cover;background-position:center;">
          </div>
          <div class="swiper-slide" style="background:url(https://shop-phinf.pstatic.net/20230215_97/1676446552491pnN1O_JPEG/04_TFT_naver_main_1920x860.jpg?type=m10000_10000); background-size:cover;background-position:center;">
          </div>
          <div class="swiper-slide" style="background:url(https://shop-phinf.pstatic.net/20230208_173/1675783211629UiAFq_JPEG/02_Tibber_naver_main_1920x860.jpg?type=m10000_10000); background-size:cover;background-position:right bottom;">
          </div>
        </div>
        <div class="swiper-pagination"></div>
      </div>

      <!-- Swiper JS -->
      <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

      <!-- Initialize Swiper -->
      <script>
        var swiper = new Swiper(".mySwiper", {
          spaceBetween: 0,
          centeredSlides: true,
          autoplay: {
            delay: 2000,
            disableOnInteraction: false,
          },
          pagination: {
            el: ".swiper-pagination",
            clickable: true,
          },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
        });
      </script>
    </main>
    <article class="best">
					<c:if test="${reply != 0 && sLevel == 0}">
    				<div class="container" style="margin-right: -20%;   float: right;">
			<div class="rectangle" style="    position: fixed;    top: 2em;    z-index: 100;">
				<div class="notification-text">
					<i class="material-icons">info</i>
					<span onclick="location.href='${ctp}/admin/qna/adQnaList'" style="cursor:pointer;">
					&nbsp;&nbsp;<b>답변하지 않은 문의글이 있습니다!</b>
					</span>
				</div>
			</div>
		</div>
					</c:if>
      <h1 style="font-size:2rem;"><b>베스트 상품</b></h1>
      <div class="swiper-container mySwiper2">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="../resources/images/1.png" alt="">

          <div>
            <h2>펭구 깃털기사 컬렉션 인형</h2>
            <p>전설적인 깃털기사가 펭구를 이끌고 전투에 참전합니다.</p>
          </div>
        </div>

        <div class="swiper-slide">
          <img src="../resources/images/2.png" alt="">

          <div>
            <h2>2016 월드 챔피언십 후드티</h2>
            <p>플레이어님을 승리로 이끕니다.</p>
          </div>
        </div>

        <div class="swiper-slide">
          <img src="../resources/images/3.png" alt="">

          <div>
            <h2>징크스 1/7 스태츄</h2>
            <p>난폭한 말괄량이 징크스와 함께 필트오버를 파괴하세요.</p>
          </div>
        </div>

        <div class="swiper-slide">
          <img src="https://www.yunjac.com/public/batch/prods/111200021.png" alt="">

          <div>
            <h2>발로란트 전략가 곰 인형</h2>
            <p>맵 이스터에그부터 총기 장식까지 전략가 곰은 무엇이든 될 수 있습니다.</p>
          </div>
        </div>

        <div class="swiper-slide">
          <img src="https://www.yunjac.com/public/batch/prods/111200005.png" alt="">

          <div>
            <h2>전초 에센셜 토너</h2>
            <p>즉각적 보습과 풍부한 에센스 성분으로 피부를 벨벳처럼 매끈하게 정돈하고 다음 단계 스킨 케어의 흡수와 효과를 상승시키는 데일리 토너</p>
          </div>
        </div>

      </div>
    </div>

    <script>
      var swiper = new Swiper(".mySwiper2", {
        watchSlidesProgress: true,
        watchSlidesVisibility: true,

        breakpoints: {
          400: {
            slidesPerView: 1, spaceBetween: 0
          },
          1000: {
             slidesPerView: 3, spaceBetween: 0
           } }
      });
    </script>
    </article>


    <article class="banner">

      <section data-trigger>
        <h3>Event</h3>

        <div>
          <img src="https://shop-phinf.pstatic.net/20221104_82/16675472384932Txit_JPEG/%EC%87%BC%ED%95%91%EC%8A%A4%ED%86%A0%EB%A6%AC_%EB%9D%BC%EC%9D%B4%EC%97%87%EC%8A%A4%ED%86%A0%EC%96%B401.jpg?type=w640" alt="">
          <p>네이버 쇼핑 X 라이엇 스토어 플레이 & 레저 페스타</p>
          <p>취미,레저인들이 기다려온 바로 그 시간!</p>
        </div>
      </section>

      <section data-trigger>
        <div>
          <img src="https://shop-phinf.pstatic.net/20220914_108/1663129794223fs9u8_JPEG/%EC%87%BC%ED%95%91%EC%8A%A4%ED%86%A0%EB%A6%AC_%EB%9D%BC%EC%9D%B4%EC%97%87%EC%8A%A4%ED%86%A0%EC%96%B4_01.jpg?type=w640" alt="">

          <p>별 수호자의 특별한 컬렉션들을 만나보세요!</p>
          <p>아름답고 강력한 별 수호자들은 놀라운 힘으로 은하의 공포를 물리치는 살아있는 초신성입니다.</p>
        </div>

      </section>

      <section data-trigger>
        <div>
          <img src="https://shop-phinf.pstatic.net/20220714_158/16577828125258l0hG_JPEG/01_%EC%8B%A0%EC%83%81WEEK_900-&#40;2&#41;_01.jpg?type=w640" alt="">
          <p>월드 챔피언십 컬렉션 프로모션</p>
          <p>기존 월드챔피언십 컬렉션들을 한 번에 한나보세요.</p>
        </div>
      </section>
    </article>


    <footer class="w3-center w3-padding-64" style="background-color:#0b141e;padding: 50px; text-align:center;">
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	</footer>
  <script>
const trigger = new ScrollTrigger.default({
  trigger: {
    once: false,
     offset: {
            element: {
                x: 0,
                y: 0.2
            },

        }

  }
});

trigger.add('[data-trigger]')
</script>


</body>
</html>

