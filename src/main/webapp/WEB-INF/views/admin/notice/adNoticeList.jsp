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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
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
    min-height: 650px;
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
    background: none;
    color:black;
    border-bottom: solid 2px lightgray;
    border-top: solid 2px lightgray;    
}


</style>
<script>
'use strict';

function partCheck() {
	let part = partForm.part.value;
	location.href = "${ctp}/admin/adNoticeList?part="+part;
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
	      <h2>&nbsp;&nbsp;<b>공지사항</b></h2>
	    	</div>
	    	<br>
				<div class="card-body">
				<c:if test="${sLevel == 0}">
        <a href="${ctp}/admin/adNoticeInput" class="btn btn-sm btn-outline-secondary">작성</a>
      </c:if>  
			<form name="partForm" >
     	<select name="part" onchange="partCheck()" style="float: right;  margin-top: -20px; font-size : 1rem;">
     	  <option value="전체" ${pageVo.part == '전체' ? 'selected' : ''}>전체</option>
     	  <option value="배송지연" ${pageVo.part == '배송지연' ? 'selected' : ''}>배송지연</option>
     	  <option value="기타" ${pageVo.part == '기타' ? 'selected' : ''}>기타</option>
     	  <option value="이벤트" ${pageVo.part == '이벤트' ? 'selected' : ''}>이벤트</option>
     	  <option value="상품" ${pageVo.part == '상품' ? 'selected' : ''}>상품</option>
     	</select>
     </form>
		 <div class="table-responsive" >
  <table class="table text-left" style="margin-top: -10px;">
    <tr class="table table-dark" >
      <th>번호</th>
      <th>구분</th>
      <th>제목</th>
      <th style="text-align: center;">게시기간</th>
    </tr>
    <c:set var="curScrStartNo" value="${pageVo.curScrStartNo}"/>
    <c:forEach var="vo" items="${noticeVos}">
      <tr>
        <td style=" text-align: left;">${vo.idx}</td>
        <td style=" text-align: left;">${vo.part}</td>
        <td style=" text-align: left;">
          <a href="${ctp}/dbShop/dbShopNoticeContent?idx=${vo.idx}&pageSize=${pageVo.pageSize}&pag=${pageVo.pag}">${vo.title}</a>
        </td>
        <td style="text-align:center;">
    	      ${fn:substring(vo.startDate,0,10)}~${fn:substring(vo.endDate,0,10)}
        </td>
      </tr>
      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
    </c:forEach>
    <tr><td colspan="7" class="p-0"></td></tr>
  </table>
</div>
<br><br>
<!-- 블록 페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pageVo.pag > 1}">
      <li class="page-item"><a class="page-link text-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${pageVo.curBlock > 0}">
      <li class="page-item"><a class="page-link text-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=${(pageVo.curBlock-1)*pageVo.blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(pageVo.curBlock)*pageVo.blockSize + 1}" end="${(pageVo.curBlock)*pageVo.blockSize + pageVo.blockSize}" varStatus="st">
      <c:if test="${i <= pageVo.totPage && i == pageVo.pag}">
    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= pageVo.totPage && i != pageVo.pag}">
    		<li class="page-item"><a class="page-link text-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${pageVo.curBlock < pageVo.lastBlock}">
      <li class="page-item"><a class="page-link text-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=${(pageVo.curBlock+1)*pageVo.blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pageVo.pag < pageVo.totPage}">
      <li class="page-item"><a class="page-link text-secondary" href="dbShopNoticeList?part=${pageVo.part}&pag=${pageVo.totPage}">마지막페이지</a></li>
    </c:if>
  </ul>			
  </div>
				</div>
			</div>
		</div>
	</div>
</main>	
</div>
</body>
</html>
