<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/include/adminLeft.jsp" %>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>title</title>
    <jsp:include page="/WEB-INF/views/include/bs4.jsp"></jsp:include>
</head>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500&display=swap');

body{
	    background: lavender;
	    padding-right: 0 !important;
	    margin : 5%;
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
    background-color: #zfff;
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


</style>
<script>
'use strict';

function fCheck(){
	var cName = myform.cName.value;
	var cPrice = myform.cPrice.value;
	var cStartDate = myform.cStartDate.value;
	var cEndDate = myform.cEndDate.value;
		
		if(cName.trim() == "" || cPrice.trim() == ""){
		 alert("빈 칸을 입력해주세요.")
			}
			else if(cStartDate > cEndDate) {
					alert("쿠폰 유효기간 마지막일을 시작일 이후로 선택해주세요.");
					return false;
			}
			else{
					myform.submit();
			}
		}
		
	function couponDel(){
				$.ajax({
					type : "post",
					url  : "${ctp}/dbShop/couponDel",
					data : {
						cName : cName,
						cPrice : cStartDate,
						cEndDate : cEndDate
					},
					success:function(res) {
						alert("쿠폰이 삭제되었습니다.")
					},
					error : function() {
						alert("전송오류!");
				}
			});
		}

	
    // 이미지 1장 미리보기
	function photoView(photo) {
		if (photo.files && photo.files[0]) {
			let reader = new FileReader();
			reader.onload = function(e) {		// 이미지가 로드된 경우에 실행한다.
				document.getElementById('demo').src = e.target.result;	// demo의 src속성에 이미지파일을 넣는다.
			}
			reader.readAsDataURL(photo.files[0]);	// reader가 이미지를 읽도록 한다.
		}
		else {
			document.getElementById('demo').src = "";
		}
	}
</script>
<body>
<!-- 상품 등록 -->
<div class="container" > 
  <main>
 	<div class="recent-grid">
	<div class="projects">
  	<div class="card" style="width: 74.5%;   margin-left: -40px; margin-bottom:30px;" >
   	<div class="card-header">
      <h2>&nbsp;&nbsp;<b>쿠폰 등록</b></h2>
      &nbsp;&nbsp;&nbsp;<font color="gray">쿠폰을 등록하세요.</font>
    </div>
    <br>
		<div class="card-body">
	<form name="myform" method="post" enctype="multipart/form-data">
    <div class="form-group">
    	 ※ 쿠폰명
      <input type="text" class="form-control" name="cName" id="cName" placeholder="쿠폰 이름" autofocus/>
    </div>
    <div class="form-group">
    	※ 할인 금액
      <input type="number" class="form-control" id="cPrice" placeholder="쿠폰 가격" name="cPrice" />
    </div>
    <div class="form-group">
      <label for="cStartDate">※ 사용 기간</label><br>
      <input type="date" name="cStartDate" value="<%=java.time.LocalDate.now() %>" />      
       ~ 
      <input type="date" name="cEndDate" value="<%=java.time.LocalDate.now() %>"/>    
    </div>
		<div class='text-center'>
		<input type="button" value="쿠폰 등록" onclick="fCheck()" class="btn btn-primary"/>
		</div>
		<div id="qrShow">
		</div>
  </form>
	<br><br>
	  <table class="table table-bordered">
    <thead class="thead-dark">
      <tr>
        <th>등록날짜</th>
        <th>쿠폰명</th>
        <th>사용 기간</th>
        <th>금액</th>
        <th width="150px">기능</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="vo" items="${CouponVos}">
      <tr>
        <td>${fn:substring(vo.CDate,0,10)}</td>
        <td>${vo.CName}</td>
        <td>${fn:substring(vo.CStartDate,0,10)} ~ ${fn:substring(vo.CEndDate,0,10)}</td>
        <td><fmt:formatNumber value="${vo.CPrice}"/>원</td>
        <td>
        <input type="button" value="수정" onclick="couponUpdate()" class="btn btn-sm btn-info">
        <input type="button" value="삭제" onclick="couponDel()" class="btn btn-sm btn-danger">
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
	</div>
	</main>	
</div>
</body>
</html>
