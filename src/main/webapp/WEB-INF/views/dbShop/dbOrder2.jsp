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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	  <script src="${ctp}/js/woo.js"></script>
<script>
var cardDrop = document.getElementById('card-dropdown');
var activeDropdown;
cardDrop.addEventListener('click',function(){
  var node;
  for (var i = 0; i < this.childNodes.length-1; i++)
    node = this.childNodes[i];
    if (node.className === 'dropdown-select') {
      node.classList.add('visible');
       activeDropdown = node; 
    };
})

window.onclick = function(e) {
  console.log(e.target.tagName)
  console.log('dropdown');
  console.log(activeDropdown)
  if (e.target.tagName === 'LI' && activeDropdown){
    if (e.target.innerHTML === 'Master Card') {
      document.getElementById('credit-card-image').src = 'https://dl.dropboxusercontent.com/s/2vbqk5lcpi7hjoc/MasterCard_Logo.svg.png';
          activeDropdown.classList.remove('visible');
      activeDropdown = null;
      e.target.innerHTML = document.getElementById('current-card').innerHTML;
      document.getElementById('current-card').innerHTML = 'Master Card';
    }
    else if (e.target.innerHTML === 'American Express') {
         document.getElementById('credit-card-image').src = 'https://dl.dropboxusercontent.com/s/f5hyn6u05ktql8d/amex-icon-6902.png';
          activeDropdown.classList.remove('visible');
      activeDropdown = null;
      e.target.innerHTML = document.getElementById('current-card').innerHTML;
      document.getElementById('current-card').innerHTML = 'American Express';      
    }
    else if (e.target.innerHTML === 'Visa') {
         document.getElementById('credit-card-image').src = 'https://dl.dropboxusercontent.com/s/ubamyu6mzov5c80/visa_logo%20%281%29.png';
          activeDropdown.classList.remove('visible');
      activeDropdown = null;
      e.target.innerHTML = document.getElementById('current-card').innerHTML;
      document.getElementById('current-card').innerHTML = 'Visa';
    }
  }
  else if (e.target.className !== 'dropdown-btn' && activeDropdown) {
    activeDropdown.classList.remove('visible');
    activeDropdown = null;
  }
}

</script>
<style>


@import url(https://fonts.googleapis.com/css?family=Lato:400,300,700);
body,html {
  height:100%;
  margin:0;
  font-family:lato;
}

h2 {
  margin-bottom:0px;
  margin-top:25px;
  text-align:center;
  font-weight:200;
  font-size:19px;
  font-size:1.2rem;
  
}
.container {
	position:sticky;
  height:100%;
  -webkit-box-pack:center;
  -webkit-justify-content:center;
      -ms-flex-pack:center;
          justify-content:center;
  -webkit-box-align:center;
  -webkit-align-items:center;
      -ms-flex-align:center;
          align-items:center;
  display:-webkit-box;
  display:-webkit-flex;
  display:-ms-flexbox;
  display:flex;
}
.dropdown-select.visible {
  display:block;
}
.dropdown {
  position:relative;
}
ul {
  margin:0;
  padding:0;
}
ul li {
  list-style:none;
  padding-left:10px;
  cursor:pointer;
}
ul li:hover {
  background:rgba(255,255,255,0.1);
}
.dropdown-select {
  position:absolute;
  background:#77aaee;
  text-align:left;
  box-shadow:0px 3px 5px 0px rgba(0,0,0,0.1);
  border-bottom-right-radius:5px;
  border-bottom-left-radius:5px;
  width:90%;
  left:2px;
  line-height:2em;
  margin-top:2px;
  box-sizing:border-box;
}
.thin {
  font-weight:400;
}
.small {
  font-size:12px;
  font-size:.8rem;
}
.half-input-table {
  border-collapse:collapse;
  width:100%;
}
.half-input-table td:first-of-type {
  border-right:10px solid #4488dd;
  width:50%;
}
.window {
  height:auto;
  width:800px;
  background:#fff;
  display:-webkit-box;
  display:-webkit-flex;
  display:-ms-flexbox;
  display:flex;
  box-shadow: 0px 15px 50px 10px rgba(0, 0, 0, 0.2);
  border-radius:30px;
  z-index:10;
}
.order-info {
  height:100%;
  width:50%;
  padding-left:25px;
  padding-right:25px;
  box-sizing:border-box;
  display:-webkit-box;
  display:-webkit-flex;
  display:-ms-flexbox;
  display:flex;
  -webkit-box-pack:center;
  -webkit-justify-content:center;
      -ms-flex-pack:center;
          justify-content:center;
  position:relative;
}
.price {
  bottom:0px;
  position:absolute;
  right:0px;
  color:#4488dd;
}
.order-table td:first-of-type {
  width:25%;
}
.order-table {
    position:relative;
}
.line {
  height:1px;
  width:100%;
  margin-top:10px;
  margin-bottom:10px;
  background:#ddd;
}
.order-table td:last-of-type {
  vertical-align:top;
  padding-left:25px;
}
.order-info-content {
  table-layout:fixed;

}

.full-width {
  width:100%;
}
.pay-btn {
  border:none;
  background:#22b877;
  line-height:2em;
  border-radius:10px;
  font-size:19px;
  font-size:1.2rem;
  color:#fff;
  cursor:pointer;
  position:absolute;
  bottom:25px;
  width:calc(100% - 50px);
  -webkit-transition:all .2s ease;
          transition:all .2s ease;
}
.pay-btn:hover {
  background:#22a877;
    color:#eee;
  -webkit-transition:all .2s ease;
          transition:all .2s ease;
}

.total {
  margin-top:25px;
  font-size:20px;
  font-size:1.3rem;
  bottom:30px;
  right:27px;
  left:35px;
}
.dense {
  line-height:1.2em;
  font-size:16px;
  font-size:1rem;
}
.input-field {
  background:rgba(255,255,255,0.1);
  margin-bottom:10px;
  margin-top:3px;
  line-height:1.5em;
  font-size:20px;
  font-size:1.3rem;
  border:none;
  padding:5px 10px 5px 10px;
  color:#fff;
  box-sizing:border-box;
  width:100%;
  margin-left:auto;
  margin-right:auto;
}
.credit-info {
  background:#4488dd;
  height:auto;
  width:50%;
  color:#eee;
  -webkit-box-pack:center;
  -webkit-justify-content:center;
      -ms-flex-pack:center;
          justify-content:center;
  font-size:14px;
  font-size:.9rem;
  display:-webkit-box;
  display:-webkit-flex;
  display:-ms-flexbox;
  display:flex;
  box-sizing:border-box;
  padding-left:25px;
  padding-right:25px;
  border-top-right-radius:30px;
  border-bottom-right-radius:30px;
  position:relative;
}
.dropdown-btn {
  background:rgba(255,255,255,0.1);
  width:100%;
  border-radius:5px;
  text-align:center;
  line-height:1.5em;
  cursor:pointer;
  position:relative;
  -webkit-transition:background .2s ease;
          transition:background .2s ease;
}
.dropdown-btn:after {
  content: '\25BE';
  right:8px;
  position:absolute;
}
.dropdown-btn:hover {
  background:rgba(255,255,255,0.2);
  -webkit-transition:background .2s ease;
          transition:background .2s ease;
}
.dropdown-select {
  display:none;
}
.credit-card-image {
  display:block;
  max-height:80px;
  margin-left:auto;
  margin-right:auto;
  margin-top:35px;
  margin-bottom:15px;
}
.credit-info-content {
  margin-top:25px;
  -webkit-flex-flow:column;
      -ms-flex-flow:column;
          flex-flow:column;
  display:-webkit-box;
  display:-webkit-flex;
  display:-ms-flexbox;
  display:flex;
  width:100%;
}
@media (max-width: 600px) {
  .window {
    width: 100%;
    height: 100%;
    display:block;
    border-radius:0px;
  }
  .order-info {
    width:100%;
    height:auto;
    padding-bottom:100px;
    border-radius:0px;
  }
  .credit-info {
    width:100%;
    height:auto;
    padding-bottom:100px;
    border-radius:0px;
  }
  .pay-btn {
    border-radius:0px;
  }
}

.content{
	width:85%;
	margin:8%;
}

   
   body{
    background-color: #0001;
   }
   
</style>
<script>
$(document).ready(function(){
	  $(".nav-tabs a").click(function(){
	    $(this).tab('show');
	  });
	  $('.nav-tabs a').on('shown.bs.tab', function(event){
	    var x = $(event.target).text();         // active tab
	    var y = $(event.relatedTarget).text();  // previous tab
	  });
	});


//회원가입폼 체크후 서버로 전송(submit)
function order() {
			let buyer_addr = myform.buyer_addr.value;
			buyer_addr = buyer_addr + myform.buyer_postcode.value;
			
			var ans = confirm("결제를 진행하시겠습니까?");
			
			if(ans) {
	    	myform.action = "${ctp}/dbShop/payment";
	    	myform.submit();
			}
			else{
				alert("결제가 취소되었습니다.")
			}
	}


function jusorokView() {
	$("#myModal").on("show.bs.modal", function(e){
		$(".modal-header #cnt").html(${cnt});
		let jusorok = '';
		jusorok += '<table class="table">';
		jusorok += '<tr>';
		jusorok += '<th class="text-center">주소</th><th class="text-center">연락처</th><th class="text-center">선택</th>';
		jusorok += '</tr>';
		jusorok += '<c:forEach var="vo" items="${vos}" varStatus="st">';
		jusorok += '<tr onclick="location.href=\'${ctp}/dbShop/dbOrder?address=${vo.address}&name=${vo.name}&tel=${tel}\';" class="text-center">';
		jusorok += '<td class="text-left">${vo.address}</td>';
		jusorok += '<td>${vo.tel}</td>';
		jusorok += '<td><input type="button" value="삭제하기" onclick="BaesongDelete()" class="btn btn-outline-danger"></td>';
		jusorok += '</tr>';
		jusorok += '</c:forEach>';
		jusorok += '';
		jusorok += '</table>';
		$(".modal-body #jusorok").html(jusorok);
	});
}

/* 쿠폰리스트뿌리기 */
function couponView() {
	$("#myCouponModal").on("show.bs.modal", function(e){
		$(".modal-header #cnt").html(${CouponCnt});
		let coupon = '';
		coupon += '<table class="table">';
		coupon += '<tr>';
		coupon += '<th>번호</th><th>쿠폰 이름</th><th >할인 가격</th><th>유효 기간</th><th></th>';
		coupon += '</tr>';
		coupon += '<c:forEach var="vo" items="${couponDownVo}" varStatus="st">';
		coupon += '<td>${st.count}</td>';
		coupon += '<td>${vo.CName}</td>';
		coupon += '<td><fmt:formatNumber value="${vo.CPrice}"/>원</td>';
		coupon += '<td>${fn:substring(vo.CUseDate,0,10)}</td>';
		coupon += '<td><input type="button" class="checkBtn" onclick="couponApply(${vo.idx})" value="적용" class="btn btn-secondary"></td>';
		coupon += '</c:forEach>';
		coupon += '';
		coupon += '</table>';
		$(".modal-body #coupon").html(coupon);
	});
}
	function couponApply(idx){
		$('#coupon').val("${CPrice}");
	}

	function BaesongDelete(){
		let res = confirm("배송지를 삭제하시겠습니까?");
		if(res){
			ajax()
			alert("배송지가 삭제되었습니다.");			
		}
		else{
			return false;			
		}
	}
	

    // 버튼 클릭시 Row 값 가져오기
    $(".checkBtn").click(function(){ 
        
        var str = ""
        var tdArr = new Array();    // 배열 선언
        var checkBtn = $(this);
        
        // checkBtn.parent() : checkBtn의 부모는 <td>이다.
        // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
        var tr = checkBtn.parent().parent();
        var td = tr.children();
        
        console.log("클릭한 Row의 모든 데이터 : "+tr.text());
        
        var cPrice = td.eq(0).text();
        var cName = td.eq(1).text();
        
        
        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        td.each(function(i){    
            tdArr.push(td.eq(i).text());
        });
        
        console.log("배열에 담긴 값 : "+tdArr);
        

        str +=    " * 클릭된 Row의 td값 = No. : <font color='red'>" + no + "</font>" +
                ", 아이디 : <font color='red'>" + userid + "</font>" +
                ", 이름 : <font color='red'>" + name + "</font>" +
                ", 이메일 : <font color='red'>" + email + "</font>";        
        
        $("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());        
        $("#ex2_Result2").html(str);    
    });

	 
</script>
<jsp:include page="/WEB-INF/views/include/shopNav.jsp"></jsp:include>
<body>
	<div class="content">
	<div style="margin-left:5%;">
	<div class='container'>
  <div class='window'> 
    <div class='order-info'>
      <div class='order-info-content'>
        <h2>주문 목록</h2>
        <div class='line'></div>
		    <c:set var="orderTotalPrice" value="0"/>
			  <c:forEach var="vo" items="${sOrderVos}">  <!-- 세션에 담아놓은 sOrderVos의 품목내역들을 화면에 각각 보여주는 작업처리 -->
        <table class='order-table'>
          <tbody>
            <tr>
              <td><img src="${ctp}/data/dbShop/product/${vo.thumbImg}" class='full-width'></img>
              </td>
              <td>
                <br> <span class='thin'>주문번호 : ${vo.orderIdx}</span>
                <br><b>${vo.productName}</b><br>
                 <span class='thin small'>
                 <c:set var="optionNames" value="${fn:split(vo.optionName,',')}"/>
				         <c:set var="optionPrices" value="${fn:split(vo.optionPrice,',')}"/>
				         <c:set var="optionNums" value="${fn:split(vo.optionNum,',')}"/>
				         </span>
	          <c:forEach var="i" begin="1" end="${fn:length(optionNames)}">
				          ${optionNames[i-1]}
				         <br>
	           <font color="#0db6d1" style="float: right;"><fmt:formatNumber value="${vo.totalPrice}"/>원 / ${optionNums[i-1]}개</font><br/>
	          </c:forEach> 	
              </td>
            </tr>
            <tr>
               <c:set var="orderTotalPrice" value="${orderTotalPrice + vo.totalPrice}"/>
            </tr>
          </tbody>
	        </table>
	    		<div class='line'></div>
         </c:forEach>
             <div class='total'>
		          <span style='float:left;'>
		            <div class='thin dense'>상품가격</div>
		            <div class='thin dense'>배송비</div>
		            총
		          </span>
		          <span style='float:right; text-align:right;'>
		            <div class='thin dense'><fmt:formatNumber value="${orderTotalPrice}" pattern='#,###원'/></div>
		            <div class='thin dense'><fmt:formatNumber value="${sOrderVos[0].baesong}" pattern='#,###원'/></div>
		            <b><fmt:formatNumber value="${orderTotalPrice + sOrderVos[0].baesong}" pattern='#,###'/></b>원
		          </span>
		 				</div>
		          <br><br><br><br>
</div>
</div>
        <div class='credit-info'>
          <div class='credit-info-content'>
            <table class='half-input-table'>
            </table>
            <img src='https://dl.dropboxusercontent.com/s/ubamyu6mzov5c80/visa_logo%20%281%29.png' height='80' class='credit-card-image' id='credit-card-image'></img>
            <form name="myform" method="post">
				    <div class="form-group">
				    	구매자
				    	<input type="text" name="buyer_name"  value="${name}" class="form-control"/>
				    	<br>
				      <label for="address">배송지</label>
				      <span class="badge badge-pill badge-warning"><a onclick="jusorokView()" data-toggle="modal" data-target="#myModal">배송지 목록</a></span>
				      <c:set var="addr" value="${fn:split(address,'/')}"/>
							<div class="input-group mb-1">
								<input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" class="form-control">
								<div class="input-group-append">
									<input type="button" onclick="sample6_execDaumPostcode()" value="검색" class="btn btn-secondary">
								</div>
							</div>
							<input type="text" name="buyer_postcode" id="sample6_address" placeholder="주소" class="form-control mb-1">
							<div class="input-group">
								<input type="text" name="buyer_addr" value="${address}" style="width: inherit;" id="sample6_extraAddress" class="form-control">&nbsp;&nbsp;
						    </div>      
							</div>
	          전화번호
				  	<input type="text" name="buyer_tel"  value="${tel}"  class="form-control"/><br>
				  	이메일  
					<div class="input-group mb-3">
					  <input type="text"name="buyer_email"  class="form-control" placeholder="Email을 입력하세요." id="email" name="email" required />
		  		</div>
		  			배송요청사항
		  			<input type="text" name="message" class="form-control" placeholder="배송 시 요청사항(선택)"/>
		  			<br>
		  			쿠폰&nbsp;
		  			<span class="badge badge-pill badge-warning"><a onclick="couponView()" data-toggle="modal" data-target="#myCouponModal">쿠폰 조회</a></span>
							<div class="input-group mb-1">
								<div class="input-group-append">
					  			<input type="text" name="coupon" id="coupon" class="form-control" placeholder="0원" onclick="couponView()" style=" width: 300px;"/>
									<input type="button" onclick="couponChoice(${CPirce})" value="사용" class="btn btn-secondary">
								</div>
							</div>			  			
		  			<br>
		  			총 결제금액
		  			<input type="text" name="amount" value="10" class="form-control" autofocus readonly />
		  			<br><br>
						<button type="button" class="btn btn-success form-control" onClick="order()" >결제하기</button>
						<br><br>
						<input type="hidden" name="orderVos" value="${orderVos}"/>
					  <input type="hidden" name="orderIdx" value="${orderIdx}"/>  							<!-- 주문번호 -->
					  <input type="hidden" name="orderTotalPrice" value="${orderTotalPrice}"/>	<!-- 최종 구매(결제)금액 -->
					  <input type="hidden" name="optionNums" value="${optionNums}"/>	<!-- 최종 구매(결제)금액 -->
					  <input type="hidden" name="mid" value="${sMid}"/>
					  <input type="hidden" name="name" value="${memberVo.mid}"/>	<!-- 결재창으로 넘겨줄 모델명 -->			
		  			</form>
          </div>
        </div>
      </div>
    </div>
    </div>
    
    <!-- 주소록을 Modal로 출력하기 -->
<div class="modal fade" id="myModal" >
	<div class="modal-dialog">
	  <div class="modal-content" style="width:600px">
	  	<div class="modal-header" style="width:598px; background:lightblue;" >
	  		<h4 class="modal-title">배송지 목록</h4>
	  		<button type="button" class="close" data-dismiss="modal">&times;</button>
	  	</div>
	  	<div class="modal-body" style="width:600px;height:800px;overflow:auto;">
	  		<span id="jusorok"></span>
	  	</div>
	  	</div>
	  </div>
	</div>
</div>






<!-- 보유 쿠폰을 Modal로 출력하기 -->
<div class="modal fade" id="myCouponModal">
	<div class="modal-dialog">
	  <div class="modal-content" style="width:600px">
	  	<div class="modal-header" style="width:598px; background:lightpink;" >
	  		<h4 class="modal-title"><b>보유 쿠폰</b>(<span id="cnt"></span>)</h4>
	  		<button type="button" class="close" data-dismiss="modal">&times;</button>
	  	</div>
	  	<div class="modal-body" style="width:600px;height:800px;overflow:auto;">
	  		<span id="coupon"></span>
	  	</div>
	  	</div>
	  </div>
</div>
</body>
 <footer class="w3-center w3-padding-64" style="background-color:#0b141e;padding: 30px; text-align:center;">
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</footer>
</html>
