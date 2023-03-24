<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
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
</style>
<script>
'use strict';
// 대분류 등록
    function categoryMainCheck() {
    	let categoryMainCode = categoryMainForm.categoryMainCode.value.toUpperCase();
    	let categoryMainName = categoryMainForm.categoryMainName.value;
    	if(categoryMainCode.trim() == "" || categoryMainName.trim() == "") {
    		alert("대분류명을 입력해주세요.");
    		categoryMainForm.categoryMainName.focus();
    		return false;
    	}
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/dbShop/categoryMainInput",
    		data : {
    			categoryMainCode : categoryMainCode,
    			categoryMainName : categoryMainName
    		},
    		success:function(res) {
    			if(res == "0") alert("이미 등록된 상품입니다.\n다시 입력해주세요.");
    			else {
    				alert("대분류가 등록되었습니다.");
    				location.reload();
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
    //대분류 삭제하기
    
    
    //소분류 등록하기
     function categorySubCheck() {
    	let categoryMainCode = categorySubForm.categoryMainCode.value;
    	let categorySubCode = categorySubForm.categorySubCode.value;
    	let categorySubName = categorySubForm.categorySubName.value;
    	if(categoryMainCode == "" || categorySubCode.trim() == "" || categorySubName.trim() == "") {
    		alert("소분류명을 확인해주세요.");
    		return false;
    	}
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/dbShop/categorySubInput",
    		data : {
    			categoryMainCode : categoryMainCode,
    			categorySubCode : categorySubCode,
    			categorySubName : categorySubName
    		},
    		success:function(res) {
    			if(res == "0") alert("이미 등록된 상품입니다.\n다시 입력해주세요.");
    			else {
    				alert("소분류가 등록되었습니다.");
    				location.reload();
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
     // 옵션 입력창에서 대분류 선택(onChange)시 소분류를 가져와서 소분류 선택박스에 뿌리기
     function categoryMainChange1() {
     	var categoryMainCode = myform1.categoryMainCode.value;
     	
 			$.ajax({
 				type : "post",
 				url  : "${ctp}/dbShop/categorySubName",
 				data : {categoryMainCode : categoryMainCode},
 				success:function(data) {
 					var str = "";
 					str += "<option value=''>소분류</option>";
 					for(var i=0; i<data.length; i++) {
 						str += "<option value='"+data[i].categorySubCode+"'>"+data[i].categorySubName+"</option>";
 					}
 					$("#categorySubCode").html(str);
 				},
 				error : function() {
 					alert("전송오류!");
 				}
 			});
   	}
     
     
     // 상품 입력창에서 소분류 선택(Change)시 해당 상품들을 가져와서 품목 선택박스에 뿌리기
     function categorySubChange() {
     	var categoryMainCode = myform1.categoryMainCode.value;
     	var categorySubCode = myform1.categorySubCode.value;
     	
 			$.ajax({
 				type : "post",
 				url  : "${ctp}/dbShop/categoryProductName",
 				data : {
 					categoryMainCode : categoryMainCode,
 					categorySubCode : categorySubCode
 				},
 				success:function(data) {
 					var str = "";
 					str += "<option value=''>상품선택</option>";
 					for(var i=0; i<data.length; i++) {
 						str += "<option value='"+data[i].productName+"'>"+data[i].productName+"</option>";
 					}
 					$("#productName1").html(str);
 				},
 				error : function() {
 					alert("전송오류!");
 				}
 			});
   	}
     
     // 상품 등록창에서 대분류 선택(onChange)시 소분류를 가져와서 소분류 선택박스에 뿌리기
     function categoryMainChange2() {
     	var categoryMainCode = myform2.categoryMainCode.value;
     	
 			$.ajax({
 				type : "post",
 				url  : "${ctp}/dbShop/categorySubName",
 				data : {categoryMainCode : categoryMainCode},
 				success:function(data) {
 					var str = "";
 					str += "<option value=''>소분류</option>";
 					for(var i=0; i<data.length; i++) {
 						str += "<option value='"+data[i].categorySubCode+"'>"+data[i].categorySubName+"</option>";
 					}
 					$("#categorySubCode2").html(str);
 				},
 				error : function() {
 					alert("전송오류!");
 				}
 			});
   	}
     

     
     // 상품 등록하기전에 체크후 전송...
   function ProductInput() {
    	let categoryMainCode = myform2.categoryMainCode.value;
    	let categorySubCode = myform2.categorySubCode.value;
    	let productName = myform2.productName.value;
			let mainPrice = myform2.mainPrice.value;
			let file = myform2.file.value;	
			let ext = file.substring(file.lastIndexOf(".")+1);
			let uExt = ext.toUpperCase();
			let regExpPrice = /^[0-9|_]*$/;
			
			if(categorySubCode == "") {
				alert("상품 소분류(세분류)를 입력하세요!");
				return false;
			}
			else if(productName == "") {
				alert("상품명(모델명)을 입력하세요!");
				return false;
			}
			else if(file == "") {
				alert("상품 메인 이미지를 등록하세요");
				return false;
			}
			else if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "JPEG") {
				alert("업로드 가능한 파일이 아닙니다.");
				return false;
			}
			else if(mainPrice == "" || !regExpPrice.test(mainPrice)) {
				alert("상품금액은 숫자로 입력하세요.");
				return false;
			}
			else if(document.getElementById("file").value != "") {
				var maxSize = 1024 * 1024 * 10;  // 10MByte까지 허용
				var fileSize = document.getElementById("file").files[0].size;
				if(fileSize > maxSize) {
					alert("첨부파일의 크기는 10MB 이내로 등록하세요");
					return false;
				}
				else {
					myform2.action = "${ctp}/dbShop/dbProductInput";
					myform2.submit();
				}
			}
    }
     
   // 상품명을 선택하면 상품의 설명을 띄워준다.
   function productNameCheck() {
    var productName  = myform1.productName1.value;
    
   	$.ajax({
   		type:"post",
   		url : "${ctp}/dbShop/getProductInfor",
   		data: {productName : productName},
   		success:function(vo) {
   			let str = '<div class="row">';
   			str += '<div class="col">';
   			str += '상품 : '+vo.productName+'<br/>';
   			str += '상품 : '+numberWithCommas(vo.mainPrice)+'원';
				str += '<input type="button" value="옵션 조회" onclick="optionShow('+vo.idx+')" class="btn btn-primary btn-sm"/><br/>';   			
   			str += '</div><hr/>';
   			$("#demo").html(str);
   			document.myform1.productIdx.value = vo.idx;
   		},
   		error : function() {
   			alert("전송오류!");
   		}
   	});
   }
/* 
   	$.ajax({
   		type:"post",
   		url : "${ctp}/dbShop/getProductInfor",
   		data: {productName : productName},
   		success:function(vo) {
   			let str = '<div class="row">';
   			str += '<div class="col">';
   			str += '상품 : '+vo.productName+'<br/>';
   			str += '상품 : '+numberWithCommas(vo.mainPrice)+'원';
   			if(res == ""){
				str += '' 			
   			}
   			else{
   				
   			}
   			str += '</div><hr/>';
   			$("#demo").html(str);
   			document.myform1.productIdx.value = vo.idx;
   		},
   		error : function() {
   			alert("전송오류!");
   		}
   	});
   }
    */
   
    // 옵션상세내역보기
   function optionShow(productIdx) {
   	$.ajax({
   		type : "post",
   		url  : "${ctp}/dbShop/getOptionList",
   		data : {productIdx : productIdx},
   		success:function(vos) {
   			let str = '';
   			if(vos.length != 0) {
						str = " / ";
	    			for(let i=0; i<vos.length; i++) { 
	    				str += '<a href="javascript:optionDelete('+vos[i].idx+')">';
							str += vos[i].optionName + "</a> / ";
	    			}
   			}
   			else {
   				str = "현 상품에 등록된 옵션이 없습니다.";
   			}
					$("#optionDemo").html(str);
   		},
   		error : function() {
   			alert("전송오류!");
   		}
   	});
   }
   
   // 콤마찍기 
   function numberWithCommas(x) {
		  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
   
   // 옵션 입력후 등록전송
   function OptionInput() {
   	if(document.getElementById("optionName").value=="") {
   		alert("상품 옵션이름을 등록하세요");
   		return false;
   	}
   	else if(document.getElementById("optionPrice").value=="") {
   		alert("상품 옵션가격을 등록하세요");
   		return false;
   	}
   	else if(document.getElementById("productName1").value=="") {
   		alert("상품명을 선택하세요");
   		return false;
   	}
   	else {
			myform1.action = "${ctp}/dbShop/dbOptionInput";
   		myform1.submit();
   	}
   }
</script>
<body>
<!-- 대분류 등록  -->
<div class="container" style="margin-top: 46px;  margin-left: 18%; width:45%;"> 
  <main>
 	<div class="recent-grid">
	<div class="projects">
  	<div class="card" style="    width: 48%;    float: left;    margin-right: 40px;   margin-bottom: 50px; ">
   	<div class="card-header">
      <h2>&nbsp;&nbsp;<b>분류 등록</b></h2>
      &nbsp;&nbsp;&nbsp;<font color="gray">대분류코드 : 영문 1자리  |  소분류 코드 : 숫자 2자리</font>
    </div>
    <br>
    <div class="card-body">
    <form name="categoryMainForm">
    <input type="text" name="categoryMainCode" placeholder="대분류 코드(A,B,C..)" class="form-control"/><br>
    <input type="text" name="categoryMainName" placeholder="대분류명(의류,서적..)" class="form-control"/><br>
    <input type="button" value="대분류등록" onclick="categoryMainCheck()" class="btn btn-success btn-sm" style="float:right;"/> 
    <input type="button" value="대분류조회" onclick="memberView('${mainVo.categoryMainCode}','${mainVo.categoryMainName}')" data-toggle="modal" data-target="#MainCategoryModal"  class="btn btn-outline-success btn-sm" style="float:right; margin-right:10px;"/>
    </form>
    <br><hr/>
<!-- 소분류 등록  -->
    <form name="categorySubForm">
    <select name="categoryMainCode" class="form-control">
		<option value="">대분류명</option>
		<c:forEach var="mainVo" items="${mainVos}">
		  <option value="${mainVo.categoryMainCode}">${mainVo.categoryMainName}</option>
		</c:forEach>
    </select>
    <br>
    <input type="text" name="categorySubCode" placeholder="소분류 코드(01,02,03..)" class="form-control"/><br>
    <input type="text" name="categorySubName" placeholder="소분류명(후드티,자켓,잠옷..)" class="form-control"/><br>
    <input type="button" value="소분류등록" onclick="categorySubCheck()" class="btn btn-success btn-sm" style="float:right;"/> 
    <input type="button" value="소분류조회"  onclick="memberView('${vo.categoryMainCode}','${vo.categorySubCode}','${vo.categorySubName}')"  data-toggle="modal" data-target="#SubCategoryModal" class="btn btn-outline-success btn-sm" style="float:right; margin-right:10px;"/>
    </form>
    </div>
	</div>
	</div> 
	</div>
  </main>
</div>

<!-- MainCategoryModal -->
<div class="modal fade" id="MainCategoryModal" >
  <div class="modal-dialog" style="padding-right: 0px; top: 15%;left: 4%;">
    <div class="modal-content" style="width:600px; " >
      <!-- Modal Header -->
      <div class="modal-header">
        <h2 class="modal-title"><b>&nbsp;&nbsp;대분류 조회</b></h2>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body" style="width:570px;height:500px;">
			 <table class="table table-hover m-3">
	      <tr class="table-dark text-dark text-center">
	        <th>대분류코드</th>
	        <th>대분류명</th>
	        <th></th>
	      </tr>
	      <c:forEach var="mainVo" items="${mainVos}">
	        <tr class="text-center">
	          <td>${mainVo.categoryMainCode}</td>
	          <td>${mainVo.categoryMainName}</td>
	          <td><input type="button" value="X" onclick="categoryMainDelete('${mainVo.categoryMainCode}')" class="btn btn-danger btn-sm"/></td>
	        </tr>
	      </c:forEach>
    	</table>				
      </div>
    </div>
  </div>
</div>

<!-- SubCategoryModal -->
<div class="modal fade" id="SubCategoryModal" >
  <div class="modal-dialog" style="padding-right: 0px; top: 15%;left: 4%;">
    <div class="modal-content" style="width:600px; " >
      <!-- Modal Header -->
      <div class="modal-header">
        <h2 class="modal-title"><b>&nbsp;&nbsp;소분류 조회</b></h2>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body" style="width:570px;height:500px;">
			 <table class="table table-hover m-3">
	      <tr class="table-dark text-dark text-center">
	        <th>대분류코드</th>
	        <th>소분류코드</th>
	        <th>소분류명</th>
	        <th></th>
	      </tr>
	      <c:forEach var="subVo" items="${subVos}">
	        <tr class="text-center">
	          <td>${subVo.categoryMainCode}</td>
	          <td>${subVo.categorySubCode}</td>
	          <td>${subVo.categorySubName}</td>
	          <td><input type="button" value="X" onclick="categoryMainDelete('${mainVo.categoryMainCode}')" class="btn btn-danger btn-sm"/></td>
	        </tr>
	      </c:forEach>
    	</table>				
      </div>
    </div>
  </div>
</div>





<!-- 옵션등록하기 -->
<div class="container" style="margin-top: 46px;  margin-left: 18%; width:45%; "> 
  <main>
 	<div class="recent-grid">
	<div class="projects">
  	<div class="card" style="margin-left: 10px;    margin-bottom: 50px;    width: 49%;    float: revert; height:528px;" >
   	<div class="card-header">
      <h2>&nbsp;&nbsp;<b>옵션 등록</b></h2>
      &nbsp;&nbsp;&nbsp;<font color="gray">대분류  |  소분류  |  상품명 선택 후 옵션 등록</font>
    </div>
    <br>
	<div class="card-body">
	<form name="myform1" method="post">
    <div class="form-group">
      <select id="categoryMainCode" name="categoryMainCode" class="form-control" onchange="categoryMainChange1()" style=" width: 330px;  float: left;">
        <option value="">대분류를 선택하세요.</option>
        <c:forEach var="mainVo" items="${mainVos}">
        	<option value="${mainVo.categoryMainCode}">${mainVo.categoryMainName}</option>
        </c:forEach>
      </select>
    </div>
    <div class="form-group">
      <select id="categorySubCode" name="categorySubCode" class="form-control" onchange="categorySubChange()" style=" float: right;   width: 330px;">        <option value="">소분류를 선택하세요.</option>
      </select>
    </div>
    <br><br>
    <div class="form-group">
      <select name="productName1" id="productName1" class="form-control" onchange="productNameCheck()">
        <option value="">상품을 선택하세요.</option>
      </select>
      <br>
      <div id="demo">상품 :<br>가격 : <br></div>
      <div id="optionDemo"></div>
    </div>
   <hr/>
    <div class="form-group">
      <input type="text" name="optionName" id="optionName" placeholder="옵션 이름을 입력하세요." class="form-control"/>
    </div>
    <div class="form-group">
      <input type="text" name="optionPrice" id="optionPrice" placeholder="옵션 가격을 입력하세요." class="form-control"/>
    </div>
    <br>
    <div class='text-right'><input type="button" value="옵션등록" onclick="OptionInput()" class="btn btn-success btn-sm"/></div>
    <input type="hidden" name="productIdx">
  	</form>
	</div>
	</div>
	</div>
	</div>
	</main>
	</div>	
	
	
	
	
<!-- 상품 등록 -->
<div class="container" > 
  <main>
 	<div class="recent-grid">
	<div class="projects">
  	<div class="card" style="width: 74.5%;   margin-left: -40px; margin-bottom:30px;" >
   	<div class="card-header">
      <h2>&nbsp;&nbsp;<b>상품 등록</b></h2>
      &nbsp;&nbsp;&nbsp;<font color="gray">대분류  |  소분류  선택 후 상품 등록</font>
    </div>
    <br>
	<div class="card-body">
	    <form name="myform2" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <select id="categoryMainCode" name="categoryMainCode" class="form-control" onchange="categoryMainChange2()">
          <option value="">대분류를 선택하세요.</option>
          <c:forEach var="mainVo" items="${mainVos}">
          	<option value="${mainVo.categoryMainCode}">${mainVo.categoryMainName}</option>
          </c:forEach>
        </select>
      </div>
    <div class="form-group">
      <select id="categorySubCode2" name="categorySubCode" class="form-control">
        <option value="">소분류를 선택하세요.</option>
      </select>
      </div>
      <div class="form-group">
        <input type="text" name="productName" id="productName" class="form-control" placeholder="상품명을 입력하세요." required />
      </div>
      <div class="form-group">
        &nbsp;대표 이미지 선택 <font color="gray">(업로드 가능 확장자 : jpg , jpeg , gif, png)</font>
        <input type="file" name="file" id="file" class="form-control-file border"  accept=".jpg,.gif,.png,.jpeg" required />
      </div>
      <div class="form-group">
      	<input type="text" name="mainPrice" id="mainPrice" placeholder="상품 가격을 입력하세요." class="form-control" required />
      </div>
      <div class="form-group">
      	<textarea rows="5" name="content" id="CKEDITOR" class="form-control"  placeholder="상품 설명을 입력하세요." required></textarea>
      </div>
	   <script>
	    CKEDITOR.replace("content",{
	    	uploadUrl:"${ctp}/dbShop/imageUpload",
	    	filebrowserUploadUrl: "${ctp}/dbShop/imageUpload",
	    	height:500
	    });
	  </script>
	<div class='text-right'><input type="button" value="상품등록" onclick="ProductInput()" class="btn btn-primary btn-sm"/></div>
    </form>
	</div>
	</div>
	</div>
	</div>
	</main>	
		
</div>
</body>
</html>
