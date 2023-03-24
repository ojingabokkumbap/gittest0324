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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
function onTotal(){
    let total = 0;
    let maxIdx = document.getElementById("maxIdx").value;
    for(let i=1;i<=maxIdx;i++){
      if($("#totalPrice"+i).length != 0 && document.getElementById("idx"+i).checked){  
        total = total + parseInt(document.getElementById("totalPrice"+i).value); 
      }
    }
    document.getElementById("total").value=numberWithCommas(total);
    
    if(total>=50000||total==0){
      document.getElementById("baesong").value=0;
    } else {
      document.getElementById("baesong").value=3000;
    }
    let lastPrice=parseInt(document.getElementById("baesong").value)+total;
    document.getElementById("lastPrice").value = numberWithCommas(lastPrice);
    document.getElementById("orderTotalPrice").value = numberWithCommas(lastPrice);
  }

		//상품 체크박스에 체크 했을 때 처리하는 함수
  function onCheck(){
    let maxIdx = document.getElementById("maxIdx").value;				// 출력되어있는 상품중에서 가장 큰 idx값이 maxIdx변수에 저장된다.

    let cnt=0;
    for(let i=1;i<=maxIdx;i++){
      if($("#idx"+i).length != 0 && document.getElementById("idx"+i).checked==false){
        cnt++;
        break;
      }
    }
    if(cnt!=0){
      document.getElementById("allcheck").checked=false;
    } 
    else {
      document.getElementById("allcheck").checked=true;
    }
    onTotal();  //체크박스의 사용 후에는 항상 재계산해야 한다.
  }
  
		// 전체 체크 박스 체크/해제 할 때 수행하는 함수 
  function allCheck(){
    let maxIdx = document.getElementById("maxIdx").value;
    if(document.getElementById("allcheck").checked){
      for(let i=1;i<=maxIdx;i++){
        if($("#idx"+i).length != 0){
          document.getElementById("idx"+i).checked=true;
        }
      }
    }
    else {
      for(let i=1;i<=maxIdx;i++){
        if($("#idx"+i).length != 0){
          document.getElementById("idx"+i).checked=false;
        }
      }
    }
    onTotal(); //체크박스의 사용 후에는 항상 재계산해야 한다.
  }
  
		//장바구니 선택 삭제
  function cartDelete(idx){
    let ans = confirm("선택하신 현재상품을 장바구니에서 제거 하시겠습니까?");
    if(!ans) return false;
    
    $.ajax({
      type : "post",
      url  : "${ctp}/dbShop/dbCartDelete",
      data : {idx : idx},
      success:function() {
        location.reload();
      },
      error : function() {
      	alert("전송에러!");
      }
    });
  }
  
		//장바구니에서 선택한 상품만 주문
  function order(){
    let maxIdx = document.getElementById("maxIdx").value;
    for(let i=1;i<=maxIdx;i++){
      if($("#idx"+i).length != 0 && document.getElementById("idx"+i).checked){
        document.getElementById("checkItem"+i).value="1";
      }
    }

    document.myform.baesong.value=document.getElementById("baesong").value;
    
    if(document.getElementById("lastPrice").value==0){
      alert("장바구니에서 주문처리할 상품을 선택해주세요!");
      return false;
    } 
    else {
      document.myform.submit();
      
    }
  }
  
  function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
</script>
<style>
body {
	background: #eee;
	margin: 0;
	padding: 0;
	overflow-x: hidden;
	margin-top:10%;
}

.clearfix {
  content: "";
  display: table;
  clear: both;	
}

#site-header, #site-footer {
	background: #fff;
}

#site-header {
	margin: 0 0 30px 0;
}

#site-header h1 {
	font-size: 31px;
	font-weight: 300;
	padding: 40px 0;
	position: relative;
	margin: 0;
}

a {
	color: #000;
	text-decoration: none;

	-webkit-transition: color .2s linear;
	-moz-transition: color .2s linear;
	-ms-transition: color .2s linear;
	-o-transition: color .2s linear;
	transition: color .2s linear;
}

a:hover {
	color: #53b5aa;
}

#site-header h1 span {
	color: #53b5aa;
}

#site-header h1 span.last-span {
	background: #fff;
	padding-right: 150px;
	position: absolute;
	left: 217px;

	-webkit-transition: all .2s linear;
	-moz-transition: all .2s linear;
	-ms-transition: all .2s linear;
	-o-transition: all .2s linear;
	transition: all .2s linear;
}

#site-header h1:hover span.last-span, #site-header h1 span.is-open {
	left: 363px;
}

#site-header h1 em {
	font-size: 16px;
	font-style: normal;
	vertical-align: middle;
}

.container {
	font-family: 'Open Sans', sans-serif;
	margin: 0 auto;
	width: 980px;
}

#cart {
	width: 100%;
}

#cart h1 {
	font-weight: 300;
}

#cart a {
	text-decoration: none;
	-webkit-transition: color .2s linear;
	-moz-transition: color .2s linear;
	-ms-transition: color .2s linear;
	-o-transition: color .2s linear;
	transition: color .2s linear;
}

#cart a:hover {
	color: #000;
}

.product.removed {
	margin-left: 980px !important;
	opacity: 0;
}

.product {
	border: 1px solid #eee;
	margin: 20px 0;
	width: 100%;
	height: 195px;
	position: relative;

	-webkit-transition: margin .2s linear, opacity .2s linear;
	-moz-transition: margin .2s linear, opacity .2s linear;
	-ms-transition: margin .2s linear, opacity .2s linear;
	-o-transition: margin .2s linear, opacity .2s linear;
	transition: margin .2s linear, opacity .2s linear;
}

.product img {
	width: 100%;
	height: 85%;
}

.product header, .product .content {
	background-color: #fff;
	border: 1px solid #ccc;
	border-style: none none solid none;
	float: left;
}

.product header {
	background: #000;
	margin: 0 1% 20px 0;
	overflow: hidden;
	padding: 0;
	position: relative;
	width: 24%;
	height: 195px;
}

.product header:hover img {
	opacity: .7;
}

.product header:hover h3 {
	bottom: 73px;
}

.product header h3 {
	background: #53b5aa;
	color: #fff;
	font-size: 22px;
	font-weight: 300;
	line-height: 49px;
	margin: 0;
	padding: 0 30px;
	position: absolute;
	bottom: -50px;
	right: 0;
	left: 0;

	-webkit-transition: bottom .2s linear;
	-moz-transition: bottom .2s linear;
	-ms-transition: bottom .2s linear;
	-o-transition: bottom .2s linear;
	transition: bottom .2s linear;
}

.remove {
	cursor: pointer;
}

.product .content {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 140px;
	padding: 0 20px;
	width: 75%;
}

.product h1 {
	color: #53b5aa;
	font-size: 25px;
	font-weight: 300;
	margin: 17px 0 20px 0;
}

.product footer.content {
	height: 50px;
	margin: 6px 0 0 0;
	padding: 0;
}

.product footer .price {
	background: #fcfcfc;
	color: #000;
	float: right;
	font-size: 15px;
	font-weight: 300;
	line-height: 49px;
	margin: 0;
	padding: 0 30px;
}

.product footer .full-price {
	background: #4f78ab;
	color: #fff;
	float: right;
	font-size: 22px;
	font-weight: 300;
	line-height: 49px;
	margin: 0;
	padding: 0 30px;

	-webkit-transition: margin .15s linear;
	-moz-transition: margin .15s linear;
	-ms-transition: margin .15s linear;
	-o-transition: margin .15s linear;
	transition: margin .15s linear;
}

.qt, .qt-plus, .qt-minus {
	display: block;
	float: left;
}

.qt {
	font-size: 19px;
	line-height: 50px;
	width: 70px;
	text-align: center;
}

.qt-plus, .qt-minus {
	background: #fcfcfc;
	border: none;
	font-size: 15px;
	font-weight: 300;
	height: 100%;
	padding: 0 20px;
	-webkit-transition: background .2s linear;
	-moz-transition: background .2s linear;
	-ms-transition: background .2s linear;
	-o-transition: background .2s linear;
	transition: background .2s linear;
}

.qt-plus:hover, .qt-minus:hover {
	background: #53b5aa;
	color: #fff;
	cursor: pointer;
}

.qt-plus {
	line-height: 50px;
}

.qt-minus {
	line-height: 47px;
}

#site-footer {
	margin: 30px 0 0 0;
}

#site-footer {
	padding: 40px;
}

#site-footer h1 {
	background: #fcfcfc;
	font-size: 24px;
	font-weight: 300;
	margin: 0 0 7px 0;
	padding: 14px 40px;
	margin-right: -160px;
	text-align: right;
}

#site-footer h2 {
	font-size: 24px;
	font-weight: 300;
	margin: 10px 0 0 0;
}

#site-footer h3 {
	font-size: 19px;
	font-weight: 300;
	margin: 15px 0;
}

.left {
	float: left;
}

.right {
	float: right;
}

.btn {
	background: #4f78ab;
	border: 1px solid #999;
	border-style: none none solid none;
	cursor: pointer;
	display: block;
	color: #fff;
	font-size: 20px;
	font-weight: 300;
	padding: 16px 0;
	width: 290px;
	text-align: center;

	-webkit-transition: all .2s linear;
	-moz-transition: all .2s linear;
	-ms-transition: all .2s linear;
	-o-transition: all .2s linear;
	transition: all .2s linear;
}

.btn:hover {
	color: #fff;
	background: #429188;
}

.type {
	background: #fcfcfc;
	font-size: 13px;
	padding: 10px 16px;
	left: 100%;
}

.type, .color {
	border: 1px solid #ccc;
	border-style: none none solid none;
	position: absolute;
}

.color {
	width: 40px;
	height: 40px;
	right: -40px;
}

.red {
	background: #cb5a5e;
}

.yellow {
	background: #f1c40f;
}

.blue {
	background: #3598dc;
}

.minused {
	margin: 0 50px 0 0 !important;
}

.added {
	margin: 0 -50px 0 0 !important;
}

input{
	border:none;
}

</style>
<jsp:include page="/WEB-INF/views/include/shopNav.jsp"></jsp:include>
<script>
function onTotal(){
    let total = 0;
    let maxIdx = document.getElementById("maxIdx").value;
    for(let i=1;i<=maxIdx;i++){
      if($("#totalPrice"+i).length != 0 && document.getElementById("idx"+i).checked){  
        total = total + parseInt(document.getElementById("totalPrice"+i).value); 
      }
    }
    document.getElementById("total").value=numberWithCommas(total);
    
    if(total>=50000||total==0){
      document.getElementById("baesong").value=0;
    } else {
      document.getElementById("baesong").value=3000;
    }
    let lastPrice=parseInt(document.getElementById("baesong").value)+total;
    document.getElementById("lastPrice").value = numberWithCommas(lastPrice);
    document.getElementById("orderTotalPrice").value = numberWithCommas(lastPrice);
  }

		//상품 체크박스에 체크 했을 때 처리하는 함수
  function onCheck(){
    let maxIdx = document.getElementById("maxIdx").value;				// 출력되어있는 상품중에서 가장 큰 idx값이 maxIdx변수에 저장된다.

    let cnt=0;
    for(let i=1;i<=maxIdx;i++){
      if($("#idx"+i).length != 0 && document.getElementById("idx"+i).checked==false){
        cnt++;
        break;
      }
    }
    if(cnt!=0){
      document.getElementById("allcheck").checked=false;
    } 
    else {
      document.getElementById("allcheck").checked=true;
    }
    onTotal();  //체크박스의 사용 후에는 항상 재계산해야 한다.
  }
  
		// 전체 체크 박스 체크/해제 할 때 수행하는 함수 
  function allCheck(){
    let maxIdx = document.getElementById("maxIdx").value;
    if(document.getElementById("allcheck").checked){
      for(let i=1;i<=maxIdx;i++){
        if($("#idx"+i).length != 0){
          document.getElementById("idx"+i).checked=true;
        }
      }
    }
    else {
      for(let i=1;i<=maxIdx;i++){
        if($("#idx"+i).length != 0){
          document.getElementById("idx"+i).checked=false;
        }
      }
    }
    onTotal(); //체크박스의 사용 후에는 항상 재계산해야 한다.
  }
  
		//장바구니 선택 삭제
  function cartDelete(idx){
    let ans = confirm("해당 상품을 장바구니에서 삭제하시겠습니까?");
    if(!ans) return false;
    
    $.ajax({
      type : "post",
      url  : "${ctp}/dbShop/dbCartDelete",
      data : {idx : idx},
      success:function() {
    	  if(ans) alert("해당 상품이 장바구니에서 삭제되었습니다.")
        location.reload();
      },
      error : function() {
      	alert("전송에러!");
      }
    });
  }
  
		//장바구니에서 선택한 상품만 주문
  function order(){
    let maxIdx = document.getElementById("maxIdx").value;
    for(let i=1;i<=maxIdx;i++){
      if($("#idx"+i).length != 0 && document.getElementById("idx"+i).checked){
        document.getElementById("checkItem"+i).value="1";
      }
    }

    document.myform.baesong.value=document.getElementById("baesong").value;
    
    if(document.getElementById("lastPrice").value==0){
      alert("장바구니에서 주문처리할 상품을 선택해주세요!");
      return false;
    } 
    else {
      document.myform.submit();
      
    }
  }
  
  function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
  }
  
  $(function(){
      $(".more").slice(0, 2).show(); // 초기갯수
      $("#load").click(function(e){ // 클릭시 more
          e.preventDefault();
          $(".more:hidden").slice(0, 2).show(); // 클릭시 more 갯수 지저정
          if($(".more:hidden").length == 0){ // 컨텐츠 남아있는지 확인
          }
      });
  });
  

  
</script>
<body>
<form name="myform" method="post">
 <c:set var="maxIdx" value="0"/>
 <input type="checkbox" id="allcheck" onClick="allCheck()" style=" margin-left: 25%;"/> &nbsp; <b>전체 선택</b>
<c:set var="maxIdx" value="0"/>
 <c:forEach var="listVo" items="${cartListVos}">
	<div class="container">
		<section id="cart"> 
			<article class="product">
				<header style="background-color:white">
				<input type="checkbox"  name="idxChecked" id="idx${listVo.idx}" value="${listVo.idx}" onClick="onCheck()" />
					<a href="${ctp}/dbShop/dbProductContent?idx=${listVo.productIdx}">
						<img src="${ctp}/data/dbShop/product/${listVo.thumbImg}" alt="">
					</a>
				</header>
				<div class="content">
					<h1>
					<a href="${ctp}/dbShop/dbProductContent?idx=${listVo.productIdx}">${listVo.productName}</a>
					</h1>
		        <c:set var="optionNames" value="${fn:split(listVo.optionName,',')}"/>
		        <c:set var="optionPrices" value="${fn:split(listVo.optionPrice,',')}"/>
		        <c:set var="optionNums" value="${fn:split(listVo.optionNum,',')}"/>					
							<br/>
		          <div class=text-right>
		       		<b>총 <fmt:formatNumber value="${listVo.totalPrice}" pattern='#,###원'/></b>
		       		<br>
			        <span style="color:#270;font-size:12px" class="buyFont">주문일자 : ${fn:substring(listVo.cartDate,0,10)}</span>
			        <input type="hidden" id="totalPrice${listVo.idx}" value="${listVo.totalPrice}"/>
			        </div>
					<div title="You have selected this product to be shipped in the color yellow." style="top: 0" class="color yellow">
					
					</div>
					<div style="top: 43px" class="type small">
					<a onclick="cartDelete(${listVo.idx})">X</a>
					</div>
				</div>
				<footer class="content">
					<span class="qt-minus">
							<c:forEach var="i" begin="0" end="${fn:length(optionNames)-1}">
		            ${optionNames[i]} / <fmt:formatNumber value="${optionPrices[i]}"/>원 / ${optionNums[i]}개
		          </c:forEach>					
					</span>

					<h2 class="full-price">
							<fmt:formatNumber value="${listVo.totalPrice}" pattern='#,###원'/>
					</h2>
				</footer>
			</article>
		</section>
		        <input type="hidden" name="checkItem" value="0" id="checkItem${listVo.idx}"/>	<!-- 구매체크가 되지 않은 품목은 '0'으로 체크된것은 '1'로 처리하고자 한다. -->
		        <input type="hidden" name="idx" value="${listVo.idx }"/>
		        <input type="hidden" name="thumbImg" value="${listVo.thumbImg}"/>
		        <input type="hidden" name="productName" value="${listVo.productName}"/>
		        <input type="hidden" name="mainPrice" value="${listVo.mainPrice}"/>
		        <input type="hidden" name="optionName" value="${optionNames}"/>
		        <input type="hidden" name="optionPrice" value="${optionPrices}"/>
		        <input type="hidden" name="optionNum" value="${optionNums}"/>
		        <input type="hidden" name="totalPrice" value="${listVo.totalPrice}"/>
		        <input type="hidden" name="mid" value="${sMid}"/>
		        <c:set var="maxIdx" value="${listVo.idx}"/>	<!-- 가장 마지막 품목의 idx값이 가장 크다. -->
	</div>
</c:forEach>
					  <input type="hidden" id="maxIdx" name="maxIdx" value="${maxIdx}"/>
					  <input type="hidden" name="orderTotalPrice" id="orderTotalPrice"/>
				    <input type="hidden" name="baesong"/>
  <p class="text-center">
    5만원 이상 구매 시 배송비 면제
  </p>
</form>
	<footer id="site-footer">
		<div class="container clearfix">
			<div class="left">
				<h2 class="subtotal">상품 금액 <span><input type="text" id="total" value="0" class="totSubBox" readonly/></span></h2>
				<h3 class="shipping">배송비 <span><input type="text" id="baesong" value="0" class="totSubBox" readonly/></span></h3>
			</div>

			<div class="right">
				<h1 class="total"><b>총 금액 <span><input type="text" id="lastPrice" value="0" class="totSubBox" readonly/></span></b></h1>
				<button class="btn btn-primary" style="float:right;" onClick="order()">주문하기</button>
			</div>

		</div>
	</footer>

</body>
 <footer class="w3-center w3-padding-64" style="background-color:#0b141e;padding: 30px; text-align:center;">
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</footer>
</html>
