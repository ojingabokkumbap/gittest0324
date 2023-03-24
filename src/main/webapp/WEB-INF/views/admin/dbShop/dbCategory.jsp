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
<script>
'use strict';

// 대분류 등록하기
function categoryMainCheck() {
	let categoryMainCode = categoryMainForm.categoryMainCode.value.toUpperCase();
	let categoryMainName = categoryMainForm.categoryMainName.value;
	if(categoryMainCode.trim() == "" || categoryMainName.trim() == "") {
		alert("대분류명(코드)를 입력하세요");
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
			if(res == "0") alert("같은 상품이 등록되어있습니다.\n확인하시고 다시 입력하세요.");
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

// 대분류 삭제하기
function categoryMainDelete(categoryMainCode) {
	let ans = confirm("대분류항목을 삭제하시겠습니까?");
	if(!ans) return false;
	
	$.ajax({
		type : "post",
		url  : "${ctp}/dbShop/categoryMainDelete",
		data : {categoryMainCode : categoryMainCode},
		success:function(res) {
			if(res == "0") {
				alert("하위항목이 있기에 삭제할수 없습니다.\n하위항목을 먼저 삭제해 주세요.");
			}
			else {
				alert("대분류 항목이 삭제 되었습니다.");
				location.reload();
			}
		},
		error : function() {
			alert("전송오류!");
		}
	});
}

// 중분류 등록하기
function categoryMiddleCheck() {
	let categoryMainCode = categoryMiddleForm.categoryMainCode.value;
	let categoryMiddleCode = categoryMiddleForm.categoryMiddleCode.value;
	let categoryMiddleName = categoryMiddleForm.categoryMiddleName.value;
	if(categoryMainCode == "" || categoryMiddleCode.trim() == "" || categoryMiddleName.trim() == "") {
		alert("중분류명(코드)를 입력하세요");
		categoryMiddleForm.categoryMiddleName.focus();
		return false;
	}
	$.ajax({
		type : "post",
		url  : "${ctp}/dbShop/categoryMiddleInput",
		data : {
			categoryMainCode : categoryMainCode,
			categoryMiddleCode : categoryMiddleCode,
			categoryMiddleName : categoryMiddleName
		},
		success:function(res) {
			if(res == "0") alert("같은 상품이 등록되어있습니다.\n확인하시고 다시 입력하세요.");
			else {
				alert("중분류가 등록되었습니다.");
				location.reload();
			}
		},
		error : function() {
			alert("전송오류!");
		}
	});
}

// 중분류 삭제하기
function categoryMiddleDelete(categoryMiddleCode) {
	let ans = confirm("중분류항목을 삭제하시겠습니까?");
	if(!ans) return false;
	
	$.ajax({
		type : "post",
		url  : "${ctp}/dbShop/categoryMiddleDelete",
		data : {categoryMiddleCode : categoryMiddleCode},
		success:function(res) {
			if(res == "0") {
				alert("하위항목이 있기에 삭제할수 없습니다.\n하위항목을 먼저 삭제해 주세요.");
			}
			else {
				alert("중분류 항목이 삭제 되었습니다.");
				location.reload();
			}
		},
		error : function() {
			alert("전송오류!");
		}
	});
}

// 소분류 등록하기
function categorySubCheck() {
	let categoryMainCode = categorySubForm.categoryMainCode.value;
	let categoryMiddleCode = categorySubForm.categoryMiddleCode.value;
	let categorySubCode = categorySubForm.categorySubCode.value;
	let categorySubName = categorySubForm.categorySubName.value;
	if(categoryMainCode == "" || categoryMiddleCode == "" || categorySubCode.trim() == "" || categorySubName.trim() == "") {
		alert("소분류명읗 확인해 보세요");
		categoryMiddleForm.categorySubName.focus();
		return false;
	}
	$.ajax({
		type : "post",
		url  : "${ctp}/dbShop/categorySubInput",
		data : {
			categoryMainCode : categoryMainCode,
			categoryMiddleCode : categoryMiddleCode,
			categorySubCode : categorySubCode,
			categorySubName : categorySubName
		},
		success:function(res) {
			if(res == "0") alert("같은 상품이 등록되어있습니다.\n확인하시고 다시 입력하세요.");
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

// 소분류 삭제하기
function categorySubDelete(categorySubCode) {
	let ans = confirm("소분류항목을 삭제하시겠습니까?");
	if(!ans) return false;
	
	$.ajax({
		type : "post",
		url  : "${ctp}/dbShop/categorySubDelete",
		data : {categorySubCode : categorySubCode},
		success:function(res) {
			if(res == "0") {
				alert("하위항목이 있기에 삭제할수 없습니다.\n하위항목을 먼저 삭제해 주세요.");
			}
			else {
				alert("중분류 항목이 삭제 되었습니다.");
				location.reload();
			}
		},
		error : function() {
			alert("전송오류!");
		}
	});
}

// 소분류 입력창에서 대분류 선택치 중분류 자동 조회하기
function categoryMainChange() {
	let categoryMainCode = categorySubForm.categoryMainCode.value;
	$.ajax({
		type : "post",
		url  : "${ctp}/dbShop/categoryMiddleName",
		data : {categoryMainCode : categoryMainCode},
		success:function(res) {
			let str = '';
			str += '<option value="">중분류</option>';
			for(let i=0; i<res.length; i++) {
				str += '<option value="'+res[i].categoryMiddleCode+'">'+res[i].categoryMiddleName+'</option>';
			}
			$("#categoryMiddleCode").html(str);
		},
		error : function() {
			alert("전송오류!");
		}
	});
}
</script>
<body>
<p><br/></p>
	<div class="container" style="margin-top: 46px;  margin-left: 18%; width:45%;"> 
  <main>
    <h2>분류 등록</h2>
  <hr/>
  <form name="categoryMainForm">
    <h5>상품 분류</h5>
    대분류코드(A,B,C,...)
    <input type="text" name="categoryMainCode" size="1" maxlength="1"/>, &nbsp;
    대분류명
    <input type="text" name="categoryMainName" size="8"/> &nbsp;
    <input type="button" value="대분류등록" onclick="categoryMainCheck()" class="btn btn-primary btn-sm"/>
    <table class="table table-hover m-3">
      <tr class="table-dark text-dark text-center">
        <th>대분류코드</th>
        <th>대분류명</th>
        <th>삭제</th>
      </tr>
      <c:forEach var="mainVo" items="${mainVos}">
        <tr class="text-center">
          <td>${mainVo.categoryMainCode}</td>
          <td>${mainVo.categoryMainName}</td>
          <td><input type="button" value="삭제" onclick="categoryMainDelete('${mainVo.categoryMainCode}')" class="btn btn-danger btn-sm"/></td>
        </tr>
      </c:forEach>
      <tr><td colspan="3" class="m-0 p-0"></td></tr>
    </table>
  </form>
  <hr/><br/>
  <form name="categoryMiddleForm">
    <h5>중분류 관리(코드는 숫자2자리)</h5>
    대분류선택
    <select name="categoryMainCode">
			<option value="">대분류명</option>
			<c:forEach var="mainVo" items="${mainVos}">
			  <option value="${mainVo.categoryMainCode}">${mainVo.categoryMainName}</option>
			</c:forEach>
    </select> &nbsp;
    중분류코드(01,02,03,...)
    <input type="text" name="categoryMiddleCode" size="2" maxlength="2"/>, &nbsp;
    중분류명
    <input type="text" name="categoryMiddleName" size="8"/> &nbsp;
    <input type="button" value="중분류등록" onclick="categoryMiddleCheck()" class="btn btn-primary btn-sm"/>
    <table class="table table-hover m-3">
      <tr class="table-dark text-dark text-center">
        <th>중분류코드</th>
        <th>중분류명</th>
        <th>대분류명</th>
        <th>삭제</th>
      </tr>
      <c:forEach var="middleVo" items="${middleVos}">
        <tr class="text-center">
          <td>${middleVo.categoryMiddleCode}</td>
          <td>${middleVo.categoryMiddleName}</td>
          <td>${middleVo.categoryMainName}</td>
          <td><input type="button" value="삭제" onclick="categoryMiddleDelete('${middleVo.categoryMiddleCode}')" class="btn btn-danger btn-sm"/></td>
        </tr>
      </c:forEach>
      <tr><td colspan="4" class="m-0 p-0"></td></tr>
    </table>
  </form>
  <hr/><br/>
  <form name="categorySubForm">
    <h5>소분류 관리(코드는 숫자3자리)</h5>
    대분류선택
    <select name="categoryMainCode" onchange="categoryMainChange()">
			<option value="">대분류명</option>
			<c:forEach var="mainVo" items="${mainVos}">
			  <option value="${mainVo.categoryMainCode}">${mainVo.categoryMainName}</option>
			</c:forEach>
    </select> &nbsp;
    중분류코드
    <select name="categoryMiddleCode" id="categoryMiddleCode">
			<option value="">중분류명</option>
    </select> &nbsp;
    소분류코드(001,002,..)
    <input type="text" name="categorySubCode" size="2" maxlength="3"/>, &nbsp;
    소분류명
    <input type="text" name="categorySubName" size="8"/> &nbsp;
    <input type="button" value="소분류등록" onclick="categorySubCheck()" class="btn btn-primary btn-sm"/>
    <table class="table table-hover m-3">
      <tr class="table-dark text-dark text-center">
        <th>소분류코드</th>
        <th>소분류명</th>
        <th>중분류명</th>
        <th>대분류명</th>
        <th>삭제</th>
      </tr>
      <c:forEach var="subVo" items="${subVos}">
        <tr class="text-center">
          <td>${subVo.categorySubCode}</td>
          <td>${subVo.categorySubName}</td>
          <td>${subVo.categoryMiddleName}</td>
          <td>${subVo.categoryMainName}</td>
          <td><input type="button" value="삭제" onclick="categorySubDelete('${subVo.categorySubCode}')" class="btn btn-danger btn-sm"/></td>
        </tr>
      </c:forEach>
      <tr><td colspan="5" class="m-0 p-0"></td></tr>
    </table>
  </form>
</main>
</div>
</body>
</html>
