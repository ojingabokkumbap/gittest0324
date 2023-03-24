<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%@ include file="/WEB-INF/views/include/adminLeft.jsp" %>
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

img{
    border: solid;
    border-color: #f1f1f1;
    border-width: 0.1px;
}

#product{
	width:300px;
	height:434px;
	}
	
</style>
<script>
'use strict';
// 대분류 등록
</script>
<body>
<div class="container" > 
  <main>
 	<div class="recent-grid">
	<div class="projects">
  	<div class="card" style="width: 74.5%;   margin-top: 40px; margin-bottom:30px;" >
   	<div class="card-header">
      <h2>&nbsp;&nbsp;<b>상품 조회</b></h2>
    </div>
	<div class="card-body">
- <span>[<a href="${ctp}/dbShop/dbAdminProductList">전체</a></span> /
  <c:forEach var="subTitle" items="${subTitleVos}" varStatus="st">
  	<span>[<a href="${ctp}/dbShop/dbAdminProductList?part=${subTitle.categorySubName}">${subTitle.categorySubName}</a>]</span>
	  <c:if test="${!st.last}"> / </c:if>
  </c:forEach> 
  <hr/>
  <div class="row">
    <div class="col">
	    <h4>상품 리스트 : <font color="brown"><b>${part}</b></font></h4>
    </div>
    <div class="col text-right">
		  <button type="button" class="btn btn-primary" onclick="location.href='${ctp}/dbShop/dbCartList';">장바구니보러가기</button>
    </div>
  </div>
  <hr/>
 <c:set var="cnt" value="0"/>
  <div class="row mt-3 ml-4">
    <c:forEach var="vo" items="${productVos}">
      <div class="col-md-3" id="product">
        <div>
          <a href="${ctp}/dbShop/dbAdminProductContent?idx=${vo.idx}">
            <img src="${ctp}/data/dbShop/product/${vo.FSName}" width="294px" height="330px"/>
            <br><br>
            <div><font size="3"><b>${vo.productName}</b></font></div>
         </a>
            <div><font size="2"><fmt:formatNumber value="${vo.mainPrice}" pattern="#,###"/>원</font></div>
            <div><font size="1" color="gray">평점  &nbsp;&nbsp; |  &nbsp;후기</font></div>
        </div>
      </div>
      <c:set var="cnt" value="${cnt+1}"/>
      <c:if test="${cnt%4 == 0}">
        </div>
        <div class="row mt-5">
      </c:if>
    </c:forEach>
    <div class="container">
      <c:if test="${fn:length(productVos) == 0}"><h3>제품 준비 중입니다.</h3></c:if>
    </div>
  </div>
    </div>
	</div>
	</div>
	</div>
	</main>	
</div>
</body>
</html>
