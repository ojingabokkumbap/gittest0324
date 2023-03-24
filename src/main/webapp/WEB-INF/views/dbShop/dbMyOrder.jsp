<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <meta charset="UTF-8">
  <title>마이 페이지</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script src="${ctp}/ckeditor/ckeditor.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script>
    // 배송지 정보보기
    function nWin(orderIdx) {
    	var url = "${ctp}/dbShop/dbOrderBaesong?orderIdx="+orderIdx;
    	window.open(url,"dbOrderBaesong","width=390px,height=430px");
    }
    
    $(document).ready(function() {
    	// 주문 상태별 조회 : 전체/결제완료/배송중~~
    	$("#orderStatus").change(function() {
	    	var orderStatus = $(this).val();
	    	location.href="${ctp}/dbShop/orderStatus?orderStatus="+orderStatus+"&pag=${pageVo.pag}";
    	});
    });
    
    // 날짜별 주문 조건 조회(오늘/일주일이내/보름이내~~)
    function orderCondition(conditionDate) {
    	location.href="${ctp}/dbShop/orderCondition?conditionDate="+conditionDate+"&pag=${pageVo.pag}";
    }
    
    // 날찌기간에 따른 조건검색
    function myOrderStatus() {
    	var startDateJumun = new Date(document.getElementById("startJumun").value);
    	var endDateJumun = new Date(document.getElementById("endJumun").value);
    	var conditionOrderStatus = document.getElementById("conditionOrderStatus").value;
    	
    	if((startDateJumun - endDateJumun) > 0) {
    		alert("주문일자를 확인하세요!");
    		return false;
    	}
    	
    	startJumun = moment(startDateJumun).format("YYYY-MM-DD");
    	endJumun = moment(endDateJumun).format("YYYY-MM-DD");
    	location.href="${ctp}/dbShop/myOrderStatus?startJumun="+startJumun+"&endJumun="+endJumun+"&conditionOrderStatus="+conditionOrderStatus+"&pag=${pageVo.pag}";
    }
    
	   function setThumbnail(event,idx) {
		   for(var image of event.target.files){
	       var reader = new FileReader();

	       reader.onload = function(event) {
	         var img = document.createElement("img");
	         img.setAttribute("src", event.target.result);
	         //img.setAttribute("class", "col-lg-6");
	         img.setAttribute("height",250);
	         img.setAttribute("width",250);
	         img.setAttribute("style","margin:10px;");
	         document.querySelector("div#image_container"+idx).appendChild(img);
	       };
	       reader.readAsDataURL(image);
	    }
	   }
	   
	  function ReviewInput(idx) {
			  $("#myform"+idx).submit();
		  }
		  
		  
		// 장바구니에서 구매한 상품에 대한 '삭제'처리...
	    function wishDelete(idx){
	      let ans = confirm("선택하신 상품을 찜목록에서 제거하시겠습니까?");
	      if(!ans) return false;
	      
	      $.ajax({
	        type : "post",
	        url  : "${ctp}/dbShop/wishDelete",
	        data : {idx : idx},
	        success:function() {
	        	ans = alert("찜목록에서 제거되었습니다.")
	        	location.reload();
	        },
	        error : function() {
	        	alert("전송에러!");
	        }
	      });
	    }
		
  </script>
</head>
<style>


.container{
    margin-top: 10%;
    margin-bottom: 10%;
    max-width: 85%;
}
.nav-tabs {
  border-bottom:none;
}

.zRVNb6dB4r {
    padding-bottom: 15px;
    border-bottom: 2px solid #000;
    font-size: 30px;
    line-height: 25px;
    color: #000;
    margin:3%;
}

.nav-tabs .nav-link.active {
    background-color: #8a8a8a;
    color: white;
    font-weight: bold;
}
.tab-pane.active .tab-pane-header {
  padding:2rem;
  background-color:white;
  border-top-right-radius: .5rem;
  border-top-left-radius: .5rem;
  margin-bottom:1rem;
  min-height: 70%;
  max-height: 88%;
  height:100%;
}

.tab-pane:first-child .tab-pane-header {
  border-top-left-radius: 0;
}

body{
	background:antiquewhite;
}

.wishList{
    float: left;
    border-radius: 10px;
    border: solid 1px #cdcdcd;
    padding: 20px;
    margin: 15px;
    max-width: 275px;
    min-height:520px;
}
}


</style>
<body>
<jsp:include page="/WEB-INF/views/include/shopNav.jsp"></jsp:include>
<div class="container">
  <ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab" aria-controls="home" aria-expanded="true">주문 조회</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#tab2" role="tab" aria-controls="profile">쿠폰</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#tab3" role="tab" aria-controls="profile">찜 목록</a>
    </li>
  </ul>
  <div class="tab-content" id="myTabContent">
    <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="1-tab">
      <div class="tab-pane-header">



<c:set var="conditionOrderStatus" value="${conditionOrderStatus}"/>
<c:set var="orderStatus" value="${orderStatus}"/>
<%-- <c:if test="${orderStatus eq ''}"><c:set var="orderStatus" value="전체"/></c:if> --%>
<div class="content">
  <table class="table table-borderless">
    <tr>
      <td style="text-align:left;">날짜기간 및 조건검색 :
        <c:if test="${startJumun == null}">
          <c:set var="startJumun" value="<%=new java.util.Date() %>"/>
	        <c:set var="startJumun"><fmt:formatDate value="${startJumun}" pattern="yyyy-MM-dd"/></c:set>
        </c:if>
        <c:if test="${endJumun == null}">
          <c:set var="endJumun" value="<%=new java.util.Date() %>"/>
	        <c:set var="endJumun"><fmt:formatDate value="${endJumun}" pattern="yyyy-MM-dd"/></c:set>
        </c:if>
        <input type="date" name="startJumun" id="startJumun" value="${startJumun}"/>~<input type="date" name="endJumun" id="endJumun" value="${endJumun}"/>
        <select name="conditionOrderStatus" id="conditionOrderStatus">
          <option value="전체" ${conditionOrderStatus == '전체' ? 'selected' : ''}>전체</option>
          <option value="결제완료" ${conditionOrderStatus == '결제완료' ? 'selected' : ''}>결제완료</option>
          <option value="배송중"  ${conditionOrderStatus == '배송중' ? 'selected' : ''}>배송중</option>
          <option value="배송완료"  ${conditionOrderStatus == '배송완료' ? 'selected' : ''}>배송완료</option>
          <option value="구매완료"  ${conditionOrderStatus == '구매완료' ? 'selected' : ''}>구매완료</option>
          <option value="반품처리"  ${conditionOrderStatus == '반품처리' ? 'selected' : ''}>반품처리</option>
        </select>
        <input type="button" value="조회하기" onclick="myOrderStatus()"/>
      </td>
    </tr>
  </table>
  <table class="table">
    <tr style="text-align:center;">
      <th>주문정보</th>
      <th>상품</th>
      <th>주문내역</th>
      <th>주문일시</th>
    </tr>
    <c:if test="${productVos.length == 0}">
    <tr>
    	<td colspan="4" class="text-center">오늘 구매하신 상품이 없습니다.</td>
    </tr>
    </c:if>
    <c:forEach var="vo" items="${vos}">
      <tr>
        <td style="text-align:center;">
          <p>주문번호 : ${vo.orderIdx}</p>
          <%-- <p>총 주문액 : <fmt:formatNumber value="vo.totalPrice"/>원</p> --%>
          <p>총 주문액 : <fmt:formatNumber value="${vo.totalPrice}"/>원</p>
          <p><input type="button" value="배송지정보" onclick="nWin('${vo.orderIdx}')"></p>
        </td>
        <td style="text-align:center;"><br/><img src="${ctp}/data/dbShop/product/${vo.thumbImg}" class="thumb" width="100px"/></td>
        <td align="left">
	        <p><br/>${vo.productName}<br/> &nbsp; &nbsp; <fmt:formatNumber value="${vo.mainPrice}"/>원</p><br/>
	        <c:set var="optionNames" value="${fn:split(vo.optionName,',')}"/>
	        <c:set var="optionPrices" value="${fn:split(vo.optionPrice,',')}"/>
	        <c:set var="optionNums" value="${fn:split(vo.optionNum,',')}"/>
	        <p>
	          - 주문 내역
	          <c:if test="${fn:length(optionNames) > 1}">(옵션 ${fn:length(optionNames)-1}개 포함)</c:if><br/>
	          <c:forEach var="i" begin="1" end="${fn:length(optionNames)}">
	            &nbsp; &nbsp; ㆍ ${optionNames[i-1]} / <fmt:formatNumber value="${optionPrices[i-1]}"/>원 / ${optionNums[i-1]}개<br/>
	          </c:forEach>
	        </p>
	      </td>
        <td style="text-align:center;"><br/>
          주문일자 : ${fn:substring(vo.orderDate,0,10)}<br/><br/>
          <font color="brown">${vo.orderStatus}</font><br/>
          <c:if test="${vo.orderStatus eq '결제완료'}">(배송준비중)</c:if>
          <c:if test="${vo.orderStatus eq '리뷰 작성 가능'}">
          <input type="button" class="btn btn-sm btn-info" value="리뷰쓰기" data-toggle="modal" data-target="#reviewModal${vo.idx}" >
					</c:if>
        </td>
      </tr>
      <tr><td colspan="4" class="p-0"></td></tr>
    </c:forEach>
  </table>

  <!-- 블록 페이징처리 시작(BS4 스타일적용) -->
	<div class="content">
		<ul class="pagination justify-content-center">
			<c:if test="${pageVo.totPage == 0}"><p style="text-align:center"><b>자료가 없습니다.</b></p></c:if>
			<c:if test="${pageVo.totPage != 0}">
			  <c:if test="${pageVo.pag != 1}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=1" title="첫페이지" class="page-link text-secondary">◁◁</a></li>
			  </c:if>
			  <c:if test="${pageVo.curBlock > 0}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}" title="이전블록" class="page-link text-secondary">◀</a></li>
			  </c:if>
			  <c:forEach var="i" begin="${(pageVo.curBlock*pageVo.blockSize)+1}" end="${(pageVo.curBlock*pageVo.blockSize)+pageVo.blockSize}">
			    <c:if test="${i == pageVo.pag && i <= pageVo.totPage}">
			      <li class="page-item active"><a href='${ctp}/dbShop/dbMyOrder?pag=${i}' class="page-link text-light bg-secondary border-secondary">${i}</a></li>
			    </c:if>
			    <c:if test="${i != pageVo.pag && i <= pageVo.totPage}">
			      <li class="page-item"><a href='${ctp}/dbShop/dbMyOrder?pag=${i}' class="page-link text-secondary">${i}</a></li>
			    </c:if>
			  </c:forEach>
			  <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}" title="다음블록" class="page-link text-secondary">▶</a>
			  </c:if>
			  <c:if test="${pageVo.pag != pageVo.totPage}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=${pageVo.totPage}" title="마지막페이지" class="page-link" style="color:#555">▷▷</a>
			  </c:if>
			</c:if>
		</ul>
	</div>
	<!-- 블록 페이징처리 끝 -->
</div>
</div>
</div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="2-tab">
      <div class="tab-pane-header">
        <p class="lead">
          <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Illum vero magni suscipit, fuga repellat quaerat eius minima vel, distinctio dignissimos labore esse harum, consequatur rem explicabo molestias aliquid saepe autem?</div>
        </p>
        <a href="#tab2" target="_blank">Link directly to this tab</a>
      </div>
    </div>
    
    
    
    
    
    <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="3-tab">
      <div class="tab-pane-header">
				<h3 class="zRVNb6dB4r"><b>찜 목록</b></h3>	
        <p class="lead">
        	<c:forEach var="wishListVo" items="${wishListVos}" begin="0" end="4">
        	<div class="wishList">
	          <div class="thumbnail">
	          <div class="text-right"><input type="button" value="X" onclick="wishDelete(${wishListVo.idx})" style="color:gray; border:none; background:none;"></div>
	            <a href="/Product/301845912">
	                <img src="${ctp}/data/dbShop/product/${wishListVo.FSName}" width="235px" height="300px" style="border-radius: 10px;" />
	            </a>
	          </div>
          <div class="option">
	            <div class="text_wrap">
		                <h4><strong>${wishListVo.productName}</strong></h4>
		              <p  style="text-align:right;" class="ellipsis multiline">${fn:substring(wishListVo.FDate,0,10)}</p>
		            </div>
		            <p class="price" style="text-align:right; font-size:1.3rem;">
		              <span><fmt:formatNumber value="${wishListVo.mainPrice}"/>
		              </span> <!--판매가격-->
		            </p>
      	</div>
     	</div>
    </c:forEach>
  </div>
    <!-- 블록 페이징처리 시작(BS4 스타일적용) -->
		<ul class="pagination justify-content-center" style="margin-top:-100px">
			  <c:if test="${pageVo.pag != 1}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=1" title="첫페이지" class="page-link text-secondary">1</a></li>
			  </c:if>
			  <c:if test="${pageVo.curBlock > 0}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}" title="이전블록" class="page-link text-secondary">1</a></li>
			  </c:if>
			  <c:forEach var="i" begin="${(pageVo.curBlock*pageVo.blockSize)+1}" end="${(pageVo.curBlock*pageVo.blockSize)+pageVo.blockSize}">
			    <c:if test="${i == pageVo.pag && i <= pageVo.totPage}">
			      <li class="page-item active"><a href='${ctp}/dbShop/dbMyOrder?pag=${i}' class="page-link text-light bg-secondary border-secondary">${i}</a></li>
			    </c:if>
			    <c:if test="${i != pageVo.pag && i <= pageVo.totPage}">
			      <li class="page-item"><a href='${ctp}/dbShop/dbMyOrder?pag=${i}' class="page-link text-secondary">${i}</a></li>
			    </c:if>
			  </c:forEach>
			  <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}" title="다음블록" class="page-link text-secondary">▶</a>
			  </c:if>
			  <c:if test="${pageVo.pag != pageVo.totPage}">
			    <li class="page-item"><a href="${ctp}/dbShop/dbMyOrder?pag=${pageVo.totPage}" title="마지막페이지" class="page-link" style="color:#555">1</a>
			  </c:if>
		</ul>
	<!-- 블록 페이징처리 끝 -->
</div>
</div>
</div>






<!-- 리뷰작성모달!! -->
 <c:forEach var="vo" items="${vos}">
<div class="modal fade" id="reviewModal${vo.idx}" >
  <div class="modal-dialog" style="padding-right: 0px; left: 4%; ">
    <div class="modal-content" style="width:600px; overflow-y:auto; overflow-x:hidden" >
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><b>&nbsp;&nbsp;리뷰쓰기</b></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body" style="width:570px;height:730px;">
	      <table>
	      <tr>
	      <td>
	        <img src="${ctp}/data/dbShop/product/${vo.thumbImg}" class="thumb" width="120px"/>
	      </td>
	      <td>
	           <b>주문 번호 : ${vo.orderIdx} <br>
	            상품명 : ${vo.productName}</b><br>
	           <font color="grey">${vo.optionName} / ${vo.mainPrice}원 / ${vo.optionName}</font>
	      </td>
	      </tr>
	      </table>
	      <hr>
	      <form name="myform${vo.idx}" id="myform${vo.idx}" method="post" enctype="multipart/form-data">
	      	<input type="text" name="nickname" value="${vo.mid}" readonly class="form-control mb-3" required />
	      	<input type="text" name="title" id="title" placeholder="제목을 입력해주세요." class="form-control mb-3" required />
	      	<textarea name="content" id="content" placeholder="최소 10자 이상 입력해주세요." class="form-control" style="min-height: 300px;"></textarea>
	      	<br>
	      	<input type="file" name="file" id="file${vo.idx}" multiple="multiple" onchange="setThumbnail(event,${vo.idx});" class="form-control-file border mb-2" accept=".jpg,.gif,.png,.zip,.ppt,.pptx,.hwp,.pdf,.txt"/>
	      	<div id="image_container${vo.idx}">
	      	</div>
	      	<br>
	      	<input type="button" value="등록" onclick="ReviewInput(${vo.idx})" id="btn(${vo.idx})" class="w3-button w3-blue-grey" style="width:500px; margin-left: 30px;"/>
			    <input type="hidden" name="mid" value="${sMid}"/>
			    <input type="hidden" name="nickName" value="${sNickName}"/>	      	
			    <input type="hidden" name="productIdx" value="${vo.productIdx}"/>	      	
			    <input type="hidden" name="orderIdx" value="${vo.orderIdx}"/>	      	
	      </form>
	      <br><br>
      </div>
    </div>
  </div>
</div>
</c:forEach>

</body>
</html>