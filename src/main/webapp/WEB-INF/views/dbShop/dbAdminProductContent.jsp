<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/include/adminLeft.jsp" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,0,-25" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,200,0,-25" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
 <head>
    <meta charset="UTF-8">
    <title>title</title>
    <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
</head>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500&display=swap');

html{
	overflow-y : auto;
	overflow-x : hidden;
	margin-left : 16.5%; 
}
body{
	    background: lavender;
}
:root{
  --main-color: #11101d;
  --color-dark: #1D2231;
  --text-grey:  #8390A2;
}

*{
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  font-family: 'Poppins' ,sans-serif;
}

#nav-toggle:checked ~ .main-content {
  margin-left: 70px;

}
#nav-toggle:checked ~ .main-content  header{
  width: calc(100% - 70px);
  left:70px;

}
.main-content{
  transition: margin-left 300ms;
  margin-left: 345px;
}
header{
  background: #fff;
  display: flex;
  justify-content: space-between;
  padding: 1rem 1.5rem;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
  position: fixed;
  left: 345px;
  top:0;
  z-index: 100; 
  width: calc(100% - 345px);
  transition: left 300ms;
  }

#nav-toggle{
  display: none;
}
header h2{
  color: #222;
}
header label span{
  font-size: 1.7rem;
  padding-right: 1rem;
}
.search-wrapper {
  border: solid 1px #ccc;
  border-radius: 30px;
  height: 50px;
  display: flex;
  align-items: center;
  overflow-x: hidden;
}
.search-wrapper span{
  display: inline-block;
  padding: 0rem 1rem;
  font-size: 1.5rem;
}
.search-wrapper input{
  height: 100%;
  padding: .5rem;
  border: none;
  outline: none;

}
.user-wrapper{
  display: flex;
  align-items: center;
}
.user-wrapper img{
  border-radius: 50%;
  margin-right: .5rem;
}

.user-wrapper small{
  display: inline-block;
  color: var(--text-grey);
  margin-top: -1px !important;

}

main {
    width: 180%;
}

.cards{
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-gap: 2rem;
  margin-top: 1rem;
  
  
  
}
.card-single{
  display: flex;
  justify-content: space-between;
  background: #fff;
  padding: 2rem;
   box-shadow: 0 5px 10px rgba(154,160,185,.05), 0 15px 40px rgba(166,173,201,.2);
}
.card-single div:last-child span{
  color: var(--main-color);
  font-size: 3rem;

}
.card-single div:first-child span{
  color: var(--text-grey);
}

.card-header:first-child {
    margin-top: -20px;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    width: 100%;
    background-image: url(https://shop-phinf.pstatic.net/20220714_253/1657778564627XFBOw_JPEG/C1DFBED3-BAEAB7A3B5E5BCD2B0B3_PC.jpg);
}

.card-single:last-child{
  background: var(--main-color);
}
.card-single:last-child h1,
.card-single:last-child div:first-child span,
.card-single:last-child div:last-child span
{
  color: #fff;
}


td .status{
  display: inline-block;
  height: 10px;
  width: 10px;
  border-radius: 50%;
  margin-right: 1rem; 
}
.status.purple {
  background: rebeccapurple;
}
.status.pink{
  background: deeppink;
}
.status.orange{
  background: red;
}
.customer{
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: .5rem .7rem;
}
.info{
  display: flex;
  align-items: center;
}
.info img{
  border-radius: 50%;
  margin-right: 1rem;
}
.info h4{
  font-size: .8rem;
  font-weight: 700;
  color: #222;
}
.info small{
  font-weight: 600;
  color: var(--text-grey);
  
}
.contact span{
  font-size: 1.2rem;
  display: inline-block;
  margin-left: .5rem;
  color:  var(--main-color);

}

@media only screen and (max-width: 1200px){

  
  .main-content {
  margin-left: 70px;

  }
  .main-content  header{
    width: calc(100% - 70px);
    left:70px;

  }
}

@media only screen and (max-width: 960px){
  .cards{
    grid-template-columns: repeat(3, 1fr);
  }
  .recent-grid{
    grid-template-columns: 60% 40%;
  }
}

@media only screen and (max-width: 768px){
  .cards{
    grid-template-columns: repeat(2, 1fr);
  }
  .recent-grid{
    grid-template-columns: 100%;
  }
  .search-wrapper{
    display: none;
  }


  .main-content{
    width: 100%;
    margin-left: 0rem;
  }
  #nav-toggle:checked + .sidebar{
    left: 0 !important;
    z-index: 100;
    width: 345px;
  }
  
  #nav-toggle:checked .sidebar .sidebar-brand,
  #nav-toggle:checked + .sidebar li 
  {
    padding-left: 2rem;
    text-align: left;
  }

  #nav-toggle:checked + .sidebar li a
  {
    padding-left: 1rem;
  }
  #nav-toggle:checked  + .sidebar .sidebar-brand h1 span:last-child,
  #nav-toggle:checked + .sidebar li a span:last-child{
    display: inline;

  }
  #nav-toggle:checked ~ .main-content{
    margin-left: 0rem !important;
  }
}
@media only screen and (max-width: 560px){
  .cards{
    grid-template-columns: 100%;
  }
}


.card-header {
    padding: 0.75rem 1.25rem;
    margin-bottom: 0;
    color: white;
    background-color: rgb(70 70 70);
}

.card {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    border : none;
    background-clip: border-box;
    border-radius: 0.25rem;
}
.card-body {
    background: #fcfdfe;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    box-shadow: 0 5px 10px rgb(154 160 185 / 5%), 0 15px 40px rgb(166 173 201 / 20%);
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    border-radius: -14px;
}

.table td, .table th {
    padding: 0.75rem;
    vertical-align: top;
    border: none;
}

.table-dark tbody+tbody, .table-dark td, .table-dark th, .table-dark thead th {
    background: peachpuff;
}

		
	.panel {
    margin-bottom: 30px;
    background-color: #FFF;
    width: 350px;
    /* border: 1px solid #b10000; */
    border-radius: 1px;
    -webkit-box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
    box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
    border:1px;
}


		
#profile-grid { overflow: auto; white-space: normal; }
#profile-grid .profile { padding-bottom: 40px; }
#profile-grid .panel { padding: 0 }
#profile-grid .panel-body { padding: 15px }
#profile-grid .thumbnail {margin-bottom:6px;}
#profile-grid .panel-thumbnail { overflow: hidden; }
#profile-grid .img-rounded { border-radius: 4px 4px 0 0;}
	
	
	#profile-grid {
    white-space: normal;
    margin-left: 10px;
}
.img{
    display: flex;
    justify-content: center;
    align-items: center;
}

.grid_container{
		display: grid;
    margin-left: 245px;
    margin-top: 20px;
	}
	
.container, .container-fluid, .container-lg, .container-md, .container-sm, .container-xl {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: 35px;
}


#product{
	width:300px;
	height:434px;
	}
	
</style>
<script>
  	'use strict';
  	$(document).ready(function($) {

        $(".scroll_move").click(function(event){         

                event.preventDefault();

                $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);

        });

});	
  	let idxArray = new Array();		/* 배열의 개수 지정없이 동적배열로 설정하고있다. */
    
  	// 옵션박스에서, 옵션항목을 선택하였을때 처리하는 함수
    $(function(){
    	$("#selectOption").change(function(){
    		let selectOption = $(this).val();
    		let idx = selectOption.substring(0,selectOption.indexOf(":"));					// 현재 옵션의 고유번호
    		let optionName = selectOption.substring(selectOption.indexOf(":")+1,selectOption.indexOf("_"));	// 옵션명
    		let optionPrice = selectOption.substring(selectOption.indexOf("_")+1);	// 옵션가격
    		let commaPrice = numberWithCommas(optionPrice);			// 콤마붙인 가격
    		
    		// 선택박스의 내용을 한개라도 선택하게된다면 선택된 옵션의 '고유번호/옵션명/콤마붙인가격'을 화면에 출력처리해준다.
    		if($("#layer"+idx).length == 0 && selectOption != "") {		// 옵션이 하나라도 있으면 처리하게 된다.
    		  idxArray[idx] = idx;
    		  
	    		let str = '';
	    		str += '<div class="layer row" id="layer'+idx+'"><div class="col">'+optionName+'</div>';
	    		str += '<input type="number" class="text-center numBox" id="numBox'+idx+'" name="optionNum" onchange="numChange('+idx+')" value="1" min="1" max="10"/> &nbsp;';
	    		str += '<input type="text" id="imsiPrice'+idx+'" class="price" value="'+commaPrice+'" readonly />';
	    		str += '<input type="hidden" id="price'+idx+'" value="'+optionPrice+'"/> &nbsp;';			/* 변동되는 가격을 재계산하기위해 price+idx 아이디를 사용하고 있다. */
	    		str += '<input type="button" onclick="remove('+idx+')" value="X" style="  border: none;  	    background: none; 	    color: gray; 	"/>';
	    		str += '<input type="hidden" name="statePrice" id="statePrice'+idx+'" value="'+optionPrice+'"/>';		/* 현재상태에서의 변경된 상품(옵션)의 가격이다. */
	    		str += '<input type="hidden" name="optionIdx" value="'+idx+'"/>';
	    		str += '<input type="hidden" name="optionName" value="'+optionName+'"/>';
	    		str += '<input type="hidden" name="optionPrice" value="'+optionPrice+'"/>';
	    		str += '</div>';
	    		$("#product1").append(str);
	    		onTotal();
    	  }
    	  else {
    		  alert("이미 선택한 옵션입니다.");
    	  }
    	});
    });
    
    // 등록(추가)시킨 옵션 상품 삭제하기
    function remove(idx) {
  	  $("div").remove("#layer"+idx);
  	  onTotal();
    }
    
    // 상품의 총 금액 (재)계산하기
    function onTotal() {
  	  let total = 0;
  	  for(let i=0; i<idxArray.length; i++) {
  		  if($("#layer"+idxArray[i]).length != 0) {
  		  	total +=  parseInt(document.getElementById("price"+idxArray[i]).value);
  		  	document.getElementById("totalPriceResult").value = total;
  		  }
  	  }
  	  document.getElementById("totalPrice").value = numberWithCommas(total);
    }
    
    // 수량 변경시 처리하는 함수
    function numChange(idx) {
    	let price = document.getElementById("statePrice"+idx).value * document.getElementById("numBox"+idx).value;
    	document.getElementById("imsiPrice"+idx).value = numberWithCommas(price);
    	document.getElementById("price"+idx).value = price;
    	onTotal();
    }
    
    // 장바구니 호출시 수행함수
    function cart() {
    	if(document.getElementById("totalPrice").value==0) {
    		alert("옵션을 선택해주세요");
    		return false;
    	}
    	else {
    		document.myform.submit();
    	}
    }
    
    // 직접 주문하기
    function order() {
    	let totalPrice = document.getElementById("totalPrice").value;
    	if('${sMid}' == "") {
    		alert("로그인 후 이용 가능합니다.");
    		location.href = "${ctp}/member/memLogin";
    	}
    	else if(totalPrice=="" || totalPrice==0) {
    		alert("옵션을 선택해주세요");
    		return false;
    	}
    	else {
    		document.getElementById("flag").value = "order";
    		document.myform.submit();
    	}
    }
    
    // 천단위마다 콤마를 표시해 주는 함수
    function numberWithCommas(x) {
    	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
    }
  </script>
  <style>
    .layer  {
      border:0px;
      width:100%;
      padding:10px;
      margin-left:1px;
      background-color:#fffff;
    }
    .numBox {width:40px}
    .price  {
      width:160px;
      background-color:#fffff;
      text-align:right;
      font-size:1.2em;
      border:0px;
      outline: none;
    }
    .totalPrice {
      text-align:right;
      margin-right:10px;
      color:skyblue;
      font-size:1.5em;
      font-weight: bold;
      border:0px;
      outline: none;
    }
    
    p{
    margin-top:70px;
    }
    
	.grid-container {
	  display: grid;
	  grid-template-columns: auto auto auto;
	  padding: 10px;
	  
	}
	.grid-item {
    border: 0.5px solid lightgrey;
    font-size: 15px;
    margin: 3%;
    color: white;
    background: gray;
    text-align: center;
    padding-block: inherit;
	}
	table{
  border-collapse: collapse;
}

thead tr{
  border-top: 1px solid #f0f0f0;
  border-bottom:2px solid #f0f0f0;

}
thead td{
  font-weight: 700;
}
td{
  padding: .5rem 1rem ;
  font-size: .9rem ;
  color: #222;
  
}

tr td:last-child{
  display: flex;
  align-items: center;


}
td .status{
  display: inline-block;
  height: 10px;
  width: 10px;
  border-radius: 50%;
  margin-right: 1rem; 
}
  </style>
<body>
<div class="container" > 
  <main>
 	<div class="recent-grid">
		<div class="projects">
	  	<div class="card" style="width: 74.5%;    background-color: #e4e5f9; margin-top: 40px; margin-bottom:30px; " >
	   		<div class="card-header">
	      	<h2>&nbsp;&nbsp;<b>상품 조회</b></h2>
	    	</div>
	    	<br>
					<div class="card-body">
				    <div class="product" style=" width:500px; float:left; margin-left: 11%; margin-top:40px">
						  <!-- 상품메인 이미지 -->
						  <div>
						    <img src="${ctp}/data/dbShop/product/${productVo.FSName}" width="500px" height="500px"/>
						  </div>
						</div>
		<div style="float:right;width: 500px;margin-right: 265px;padding: 25px;border: solid;border-color: #9999;border-width: 0.05px; ">
		  <!-- 상품 기본정보 -->
		  <div>
		    <h2 >${productVo.productName}</h2>
		    <h3 class="text-right"><font color="skyblue"><b><fmt:formatNumber value="${productVo.mainPrice}"/>원</b></font></h3>
		  </div>
		  <hr>
		  <div class="text-right">
		   <font color="darkgray">택배배송 | 3,000원(주문시 결제) <br> 50,000원 이상 구매 시 무료</font>
		  </div>
		  <hr>
		  <br>
		  <!-- 상품주문을 위한 옵션정보 출력 -->
		  <div class="form-group">
		    <form name="optionForm">  <!-- 옵션의 정보를 보여주기위한 form -->
		      <select size="1" class="form-control" id="selectOption">
		        <option value="" disabled selected>필수 선택</option>
		        <option value="0:기본품목_${productVo.mainPrice}">기본 품목</option>
		        <c:forEach var="vo" items="${optionVos}">
		          <option value="${vo.idx}:${vo.optionName}_${vo.optionPrice}">${vo.optionName}(+${vo.optionPrice})</option>
		        </c:forEach>
		      </select>
		    </form>
		  </div>
		  <br/>
		  <div>
			  <form name="myform" method="post">  <!-- 실제 상품의 정보를 넘겨주기 위한 form -->
			    <input type="hidden" name="mid" value="${sMid}"/>
			    <input type="hidden" name="productIdx" value="${productVo.idx}"/>
			    <input type="hidden" name="productName" value="${productVo.productName}"/>
			    <input type="hidden" name="mainPrice" value="${productVo.mainPrice}"/>
			    <input type="hidden" name="thumbImg" value="${productVo.FSName}"/>
			    <input type="hidden" name="totalPrice" id="totalPriceResult"/>
			    <input type="hidden" name="flag" id="flag"/>

			    <div id="product1"></div>
			  </form>
		  </div>
		  <!-- 상품의 총가격(옵션포함가격) 출력처리 -->
		  <div>
		    <div class="text-left"><font size="4" color="black">총 상품 금액</font></div>
		    <p class="text-right">
		    	<!-- 아래의 id와 class이름인 totalPrice는 출력용으로 보여주기위해서만 사용한것으로 값의 전송시와는 관계가 없다. -->
	        <b><input type="text" class="totalPrice text-right" id="totalPrice" value="<fmt:formatNumber value='0' />" readonly /><font color="skyblue" size="4em">원</font></b>
		    </p>
		  <div class="text-center">
		    <button class="btn btn-success" onclick="order()" style="width:450px; padding:15px; margin-bottom:10px; ">
		    구매하기
		    </button>
		    <br>
		    <button class="btn btn-outline-primary" onclick="cart()"  style="width:220px;  padding:10px;" >
				<span class="material-symbols-outlined">
				shopping_cart
				</span>장바구니 
				</button>&nbsp;
		    <button class="btn btn-outline-secondary" onclick="cart()"  style="width:220px;  padding:10px;" >
				<span class="material-symbols-outlined">
				heart_plus
				</span>찜하기
				</button>&nbsp;
		  </div>
		  </div>
		</div>
		  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<div class="scroll-moveBox flex flex-br-c" >
			<div class="grid-container" style=" width: 75%;  margin-left: 180px;">
			  <div class="grid-item"><a href="#content" id="scroll_move">상세 정보</a></div>
			  <div class="grid-item"><a href="#review" id="scroll_move">리뷰</a></div>
			  <div class="grid-item"><a href="#notice" id="scroll_move">공지사항</a></div>
			</div>
			</div>
				  <!-- 상품 상세설명 보여주기 -->
			<div id="content" class="text-center " >
				    <p>${productVo.content}</p>
			</div>
			<div id="review">div3</div>
			<div id="QnA">
					  <div class="table-responsive" >
                  <table width="90%">
                  <thead>
                    <tr>
				      <td>답변상태</td>
				      <td>제목</td>
				      <td>작성자</td>
				      <td>작성일</td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
			     <%--  <c:forEach var="vo" items="${vos}" varStatus="st"> --%>
			      <tr>
			        <td><a href="#">title</a></td>
			        <td>ㅎㅎㅎ</td>
			        <td>ㅎㅎㅎ</td>
			        <td>ㅎㅎㅎ</td>
			      </tr>
			      <tr>
			        <td><a href="#">title</a></td>
			        <td>ㅎㅎㅎ</td>
			        <td>ㅎㅎㅎ</td>
			        <td>ㅎㅎㅎ</td>
			      </tr>
			      </tbody>
			    <%-- </c:forEach> --%>
         </table>
			</div>

				</div>
				</div>
						  <br/>
						  <div>
							  <form name="myform" method="post">  <!-- 실제 상품의 정보를 넘겨주기 위한 form -->
							    <input type="hidden" name="mid" value="${sMid}"/>
							    <input type="hidden" name="productIdx" value="${productVo.idx}"/>
							    <input type="hidden" name="productName" value="${productVo.productName}"/>
							    <input type="hidden" name="mainPrice" value="${productVo.mainPrice}"/>
							    <input type="hidden" name="thumbImg" value="${productVo.FSName}"/>
							    <input type="hidden" name="totalPrice" id="totalPriceResult"/>
							    <input type="hidden" name="flag" id="flag"/>
							    <div id="product1"></div>
							  </form>
						  </div>
				</div>			
		  	</div>
  		</div>
  	</div>
	</main>
</div>
</body>
</html>
