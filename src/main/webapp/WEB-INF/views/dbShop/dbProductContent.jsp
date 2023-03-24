<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,500,1,0" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,500,0,0" />
<head>
  <meta charset="UTF-8">
  <title>dbProductContent.jsp(상품정보 상세보기)</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
  	'use strict';
  	
  	$(document).ready(function($) {

        $(".scroll_move").click(function(event){         

                event.preventDefault();

                $('html,body').animate({scrollTop:$(this.hash).offset().top}, 1000);

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
	    		str += '<div style="margin: 0 10px;">';
	    		str += '<div class="col" id="optionName'+idx+'" style="text-align: left;margin-bottom: 0.5em;padding: 0;">'+optionName+'</div><div class="layer row" id="layer'+idx+'" style="border-bottom: solid 1px #0001; margin-bottom: 1em;margin-left: 0px;justify-content: space-between; align-items: center;flex-wrap: nowrap;width: 100%;" >';
	    		str += '<div class="input-group product_qty" style="width:120px;">';
	    		str += '<span class="input-group-btn">';
	    		str += '<button class="btn-white btn-minus'+idx+' btn" type="button" style="border-radius: 0;">';
	    		str += '<i class="fa fa-minus" aria-hidden="true"></i>';
	    		str += '</button>';
	    		str += '</span>';
	    		str += '<input type="number" class="form-control no-padding add-color text-center height-25"  id="numBox'+idx+'" name="optionNum"  min="1" maxlength="2" value="1" />';
	    		str += '<span class="input-group-btn">';
	    		str += '<button class="btn-red btn-plus'+idx+' btn" type="button"  style="border-radius: 0;">';
	    		str += '<i class="fa fa-plus" aria-hidden="true"></i>';
	    		str += '</button>';
	    		str += '</span>';
	    		str += '</div>';
	    		//str += '<input type="number" class="text-center numBox" id="numBox'+idx+'" name="optionNum" onchange="numChange('+idx+')" value="1" min="1"/> &nbsp;';
	    		str += '<div style="white-space: nowrap;">';
	    		str += '<input type="text" id="imsiPrice'+idx+'" class="price" value="'+commaPrice+'원" style="border: none;text-align: right;width: 9em;" readonly />';
	    		str += '<input type="hidden" id="price'+idx+'" value="'+optionPrice+'"/>';			/* 변동되는 가격을 재계산하기위해 price+idx 아이디를 사용하고 있다. */
	    		str += '<input type="button" onclick="remove('+idx+')" value="X" style="border: none;	 background: none;"/>';
	    		str += '</div>';
	    		str += '</div>';
	    		str += '<input type="hidden" name="statePrice" id="statePrice'+idx+'" value="'+optionPrice+'"/>';		/* 현재상태에서의 변경된 상품(옵션)의 가격이다. */
	    		str += '<input type="hidden" name="optionIdx" value="'+idx+'"/>';
	    		str += '<input type="hidden" name="optionName" value="'+optionName+'"/>';
	    		str += '<input type="hidden" name="optionPrice" value="'+optionPrice+'"/>';
	    		str += '</div>';
	    		$("#product1").append(str);
	    		onTotal();
	    		
	    		let regex = /[^0-9]/g;
		  	     $('.btn-minus'+idx).click(function(){    
		  		  	if(regex.test(parseInt($(this).parent().siblings('input').val()))){
		  		  		$(this).parent().siblings('input').val(0);
		  		  	}
		  		  	else if(parseInt($(this).parent().siblings('input').val())  > 1){
		  		   	  $(this).parent().siblings('input').val(parseInt($(this).parent().siblings('input').val()) - 1)
		  		   	}
		  		  	numPM(idx);
		  	   	});
		  	   	$('.btn-plus'+idx).click(function(){ 
		  	   		if(regex.test(parseInt($(this).parent().siblings('input').val()))){
		  	   			$(this).parent().siblings('input').val(0);
		  	   		}
		  	   		else{
		  	   	 	 	$(this).parent().siblings('input').val(parseInt($(this).parent().siblings('input').val()) + 1)
		  	   		}
		  	   		numPM(idx);
		  	   	});  
	    		
			}
			else {
			  alert("이미 선택한 옵션입니다.");
			  $("#selectOption").val('').prop("selected", true);
			}
    	});
    });
    
    // 수량 변경시 처리하는 함수
    function numPM(idx) {
    	let price = parseInt(document.getElementById("statePrice"+idx).value) * parseInt(document.getElementById("numBox"+idx).value);
    	document.getElementById("imsiPrice"+idx).value = numberWithCommas(price)+"원";
    	document.getElementById("price"+idx).value = price;
    	onTotal();
    }
    
    // 등록(추가)시킨 옵션 상품 삭제하기
    function remove(idx) {
  	  $("div").remove("#layer"+idx);
  	  $("div").remove("#optionName"+idx);
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
    
    function wishList(idx){
   	    var productName  = myform.productName.value;
   	    var productIdx  = myform.productIdx.value;
   	    var mainPrice  = myform.mainPrice.value;
   	    var mid  = myform.mid.value;
   	    var thumbImg  = myform.thumbImg.value;
   	    var totalPrice  = myform.totalPrice.value;
   	    
   	   	$.ajax({
   	   		type:"post",
   	   		url : "${ctp}/dbShop/wishListInput",
   	   		data: {productName : productName,
				   	   	 productIdx : productIdx,   	   			
				   	   	 mainPrice : mainPrice,
				   	   	 idx : idx,
				   	     mid : mid,   	   			
				   	     thumbImg : thumbImg,   	   			
				   	     totalPrice : totalPrice   	   			
   	   		},
   	   		success:function(res) {
   	   			if (res == "1"){
   	   			alert("상품을 찜 목록에 추가했습니다.")
   	   			}
   	   			else {
   	   				alert("이미 찜한 상품입니다.")
   	   			}
   	   		},
   	   		error:function() {
   	   			alert("전송오류!");
   	   		}
   	   	});
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
    
    // 파트별 리스트 출력하기
    function partCheck() {
    	let part = partForm.part.value;
    	location.href = "${ctp}/dbShop/dbProductContent?part="+part+"&scroll=scrollPart";
    }    

    
    // 좋아요버튼 클릭시 하트그림 빨강색처리(세션처리)...(세션이 끈어지면 다시 하트그림이 원래색으로 돌아가게 된다.)
    function goodCheck(idx) {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/dbShop/reviewGood",
    		data  : {idx : idx},
    		success:function(res) {
    			if(res == "0") alert("이미 추천한 글은 추천할 수 없습니다.");
    			else location.reload();
    		},
    		error : function() {
    			alert("전송 오류~~");
    		}
    	});
    }
  
    

  </script>
  <style>

.content{
	width:85%;
	margin:8%;
}

.btn-success {
    border: none;
    color: #fff;
    background-color: #03c75a;
    border-color: #28a745;
}
._27jmWaPaKy ._1YrqjEd5tF {
    display: table;
    width: 80%;
    table-layout: fixed;
}
._27jmWaPaKy ._1k5R-niA93 {
    display: table-cell;
    vertical-align: top;
}
._27jmWaPaKy ._11xjFby3Le[aria-current=true] {
    background-color: #3d3d4f;
    color: #fff;
}
._27jmWaPaKy ._11xjFby3Le {
    display: block;
    position: relative;
    height: 42px;
    background-color: #f3f5f7;
    font-size: 13px;
    font-weight: 600;
    line-height: 43px;
    color: #333;
    text-align: center;
    border-bottom: outset 2px #7e7e95;
}
._27jmWaPaKy ._11xjFby3Le:before {
    position: absolute;
    top: 50%;
    left: 0;
    width: 1px;
    height: 18px;
    margin-top: -9px;
    background-color: #dbdddf;
    content: "";
}

.zRVNb6dB4r {
    padding-bottom: 15px;
    border-bottom: 2px solid #000;
    font-size: 22px;
    line-height: 25px;
    color: #000;
}

td{
	text-align : left;
}

.good{
    width: 60px;
    display: flex;
    padding: 5px;
    margin-top: -9%;
    float: right;
}
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/shopNav.jsp"/>
<div class="content">
	<div class="product" style=" width:500px; float:left; margin-left: 11%;">
						  <!-- 상품메인 이미지 -->
						  <div>
						    <img src="${ctp}/data/dbShop/product/${productVo.FSName}" width="500px" height="600px"/>
						  </div>
						</div>
		<div style="float:right;width: 520px;margin-right: 265px;padding: 25px;border: solid;border-color: #9999;border-width: 0.05px; ">
		  <!-- 상품 기본정보 -->
		  <div>
		    <h2>&nbsp;&nbsp;<b>${productVo.productName}</b></h2>
		    <br>
		    <h3 class="text-right"><font color="#6b90dc"><b><fmt:formatNumber value="${productVo.mainPrice}"/>원</b></font></h3>
		  </div>
		  <br>
		  <hr>
		  <!-- 상품주문을 위한 옵션정보 출력 -->
		  <div class="form-group">
		    <form name="optionForm">  <!-- 옵션의 정보를 보여주기위한 form -->
		      <select size="1" class="form-control" id="selectOption">
		        <option value="" disabled selected>필수 선택</option>
		        <option value="0:기본품목_${productVo.mainPrice}">기본 품목</option>
		        <c:forEach var="vo" items="${optionVos}">
		          <option value="${vo.idx}:${vo.optionName}_${vo.optionPrice}">${vo.optionName}(+${vo.optionPrice-productVo.mainPrice}원)</option>
		        </c:forEach>
		      </select>
		    </form>
		  </div>
		  <br/>
		  <div>
			<form name="myform" id="myform(${productVo.idx})"method="post">  <!-- 실제 상품의 정보를 넘겨주기 위한 form -->
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
	        <b><font color="#6b90dc" size="4em"><input type="text" class="totalPrice text-right" id="totalPrice" style="border:none;" value="<fmt:formatNumber value='0' />" readonly />원</font></b>
		    </p>
		  <div class="text-right">
		   <font color="darkgray">택배배송 | 3,000원(주문 시 결제) <br> 50,000원 이상 구매 시 무료</font>
		  </div>
		  <hr>
		  <div class="text-center">
		    <button class="btn btn-success" onclick="order()" style="width:450px; padding:15px; margin-bottom:10px; ">
		    <font size="4rem">구매하기</font>
		    </button>
		    <br>
		    <button class="btn btn-outline-primary" onclick="cart()"  style="width:220px;  padding:10px;" >
				<span class="material-symbols-outlined">
				shopping_cart
				</span>
				<font size="4rem">장바구니</font> 
				</button>&nbsp;
		    <button class="btn btn-outline-secondary" onclick="wishList(${productVo.idx})"  style="width:220px;  padding:10px;" >
				<span class="material-symbols-outlined">
				heart_plus
				</span>
				<font size="4rem">찜하기</font>
				</button>&nbsp;
				
				
		  </div>
		  </div>
		</div>
		  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
      <div class="_27jmWaPaKy" style="margin-top: 40px; margin-bottom: 29px; margin-left:12%;">
      <ul class="_1YrqjEd5tF" role="menubar"><li class="_1k5R-niA93" role="presentation">
      <a href="#content" class="_11xjFby3Le N=a:tab.detail" role="menuitem" aria-current="true">상세정보</a></li>
      <li class="_1k5R-niA93" role="presentation"><a href="#review" class="_11xjFby3Le N=a:tab.review" role="menuitem" aria-current="false">리뷰<span class="_3HJHJjSrNK"></span></a></li>
      <li class="_1k5R-niA93" role="presentation"><a href="#notice" id="scrollPart" class="_11xjFby3Le N=a:tab.qna" role="menuitem" aria-current="false">공지사항<span class="_3HJHJjSrNK"></span></a></li>
      </ul>
      </div>		
      </div>		
      
	    <div id="review" style="height:150px; "></div>
	   	<div  id="review" style="width: 70%;   margin: auto; height:300px;" >
				<h3 class="zRVNb6dB4r"><b>상품리뷰</b></h3>
			 <div class="table-responsive">
		    <c:forEach var="vo" items="${reviewVos}">
		    <div class="" style="float:left; padding-right: 5%;  width: 85%; padding:15px;">
		        <b>${fn:substring(vo.mid,0,fn:length(vo.mid)-4)}***${fn:substring(vo.mid,fn:length(vo.mid)-1,fn:length(vo.mid))}</b> /  ${fn:substring(vo.RDate,0,10)}<br><br>
		        ${vo.content}
			    </div>
		    	<div style="border-bottom: 1px solid lightgray; padding: 15px;">
		        <img src="${ctp}/data/review/${fn:split(vo.FSName,'/')[0]}" class="thumb" width="125px" height="125px"/><br>
		        <c:set var="photoCnt" value="${fn:split(vo.FSName,'/')}"/>
		        <c:if test="${fn:length(photoCnt) gt 1}"> 
		        <a href="#imgModal${vo.idx}" data-toggle="modal"  data-target="#imgModal${vo.idx}"><font color="darkgray" class="text-center">사진 더보기</font></a>
		        </c:if>
		     	</div>
			    <div class="good" >
			    &nbsp;
		    	<a href="javascript:goodCheck(${vo.idx})">
				     <font color="red"><span class="material-symbols-outlined">thumb_up</span></font>
		  		 </a>
		       ${vo.good}
		      </div>
	    </c:forEach>
	</div>
	</div>
			<!-- 상품 상세설명 보여주기 -->
			<div class="text-center" style="margin-top:20%;" >
				 <a>${productVo.content}</a>
			</div>
		  <div id="notice" style="height:300px;"></div>	
			<div style="width: 70%;   margin: auto;">
			<h3 class="zRVNb6dB4r"><b>공지사항</b>
			 <form name="partForm" >
     	<select name="part" onchange="partCheck()" style="float: right;  margin-top: -20px; font-size : 1rem;">
     	  <option value="전체" ${pageVo.part == '전체' ? 'selected' : ''}>전체</option>
     	  <option value="배송지연" ${pageVo.part == '배송지연' ? 'selected' : ''}>배송지연</option>
     	  <option value="기타" ${pageVo.part == '기타' ? 'selected' : ''}>기타</option>
     	  <option value="이벤트" ${pageVo.part == '이벤트' ? 'selected' : ''}>이벤트</option>
     	  <option value="상품" ${pageVo.part == '상품' ? 'selected' : ''}>상품</option>
     	</select>
     </form>
				</h3>
		 <div class="table-responsive" >
  <table class="table text-left" style="margin-top: -10px;">
    <tr class="table" >
      <th>번호</th>
      <th>구분</th>
      <th>제목</th>
      <th>작성일</th>
    </tr>
    <c:set var="curScrStartNo" value="${pageVo.curScrStartNo}"/>
    <c:forEach var="vo" items="${noticeVos}">
      <tr>
        <td>${vo.idx}</td>
        <td>${vo.part}</td>
        <td>
          <a href="${ctp}/dbShop.pds?idx=${vo.idx}&pag=${pag}&part=${part}">${vo.title}</a>
        </td>
        <td style="display:flex;     flex-direction: column-reverse;">
    	      ${fn:substring(vo.startDate,0,10)}
        </td>
      </tr>
      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
    </c:forEach>
  </table>
</div>
<br><br>
<!-- 블록 페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pageVo.pag > 1}">
      <li class="page-item"><a class="page-link text-secondary" href="dbProductContent?part=${pageVo.part}&pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${pageVo.curBlock > 0}">
      <li class="page-item"><a class="page-link text-secondary" href="dbProductContent?part=${pageVo.part}&pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(pageVo.curBlock)*pageVo.blockSize + 1}" end="${(pageVo.curBlock)*pageVo.blockSize + pageVo.blockSize}" varStatus="st">
      <c:if test="${i <= pageVo.totPage && i == pageVo.pag}">
    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="dbProductContent?part=${pageVo.part}&pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= pageVo.totPage && i != pageVo.pag}">
    		<li class="page-item"><a class="page-link text-secondary" href="dbProductContent?part=${pageVo.part}&pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
      <li class="page-item"><a class="page-link text-secondary" href="dbProductContent?part=${pageVo.part}&pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pageVo.pag < pageVo.totPage}">
      <li class="page-item"><a class="page-link text-secondary" href="dbProductContent?part=${pageVo.part}&pag=${pageVo.totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>
</div>
 <br/>
 <div>
 </div>
 
 <!-- 이미지 더보기 모달 -->
<c:forEach var="vo" items="${reviewVos}">
<div class="modal fade" id="imgModal${vo.idx}" >
  <div class="modal-dialog" style="padding-right: 0px; left: 4%; ">
    <div class="modal-content" style="width:600px; overflow-y:auto; overflow-x:hidden" >
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><b>&nbsp;&nbsp;사진 더보기</b></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body" style="width:570px;height:730px;">
	      <div class="text-center">
					<c:forEach var="FSName" items="${fn:split(vo.FSName,'/')}">
						<img src="${ctp}/data/review/${FSName}" class="thumb" width="450px" height="450px"/>
					</c:forEach>
				</div>
				<br>
      </div>
    </div>
  </div>
</div>
</c:forEach>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>