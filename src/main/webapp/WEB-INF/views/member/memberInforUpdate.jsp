<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<meta charset="utf-8"/>
<meta name="google" value="notranslate"/>
 <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<title>Side Menu</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');

	html{
			width: 100%;
			height: 100vh;
			background-image: url("images/b5.jpg" );
			background-size: cover;
			/* position: relative; */
		  overflow: hidden; 
		}
	
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  font-family: 'Josefin Sans', sans-serif;
}

body{
   background-color: #f3f5f9;
}

.wrapper{
  display: flex;
  position: relative;
}

.wrapper .sidebar{
	width: 25%;
  height: 100%;
  background: #00000078;
  padding: 50px 0px;
  position: fixed;
}

.wrapper .sidebar h2{
  color: #fff;
  text-transform: uppercase;
  text-align: center;
  margin-bottom: 30px;
}

.wrapper .sidebar ul li{
  padding: 15px;
  font-size : 1.5em;
}    

.wrapper .sidebar ul li a{
  color: #999999;
  display: block;
}

.wrapper .sidebar ul li a .fas{
  width: 25px;
}


.wrapper .sidebar .social_media{
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
}

.wrapper .sidebar .social_media a{
  display: block;
  width: 40px;
  background: #594f8d;
  height: 40px;
  line-height: 45px;
  text-align: center;
  margin: 0 5px;
  color: #999999;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
}

.wrapper .main_content{
  width: 100%;
  margin-left: 200px;
}

.wrapper .main_content .header{
  padding: 20px;
  background: #fff;
  color: #717171;
  border-bottom: 1px solid #e0e4e8;
}

.wrapper .main_content .info{
  margin: 20px;
  color: #33333;
  line-height: 0px;
}

		section {
			width: 100%;
			height: 100vh;
			background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQ0OCIgaGVpZ2h0PSIyMTcyIiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxwYXRoIGZpbGw9IiMwQTBBMEEiIGQ9Ik0wIDBoMTQ0OHYyMTcySDB6Ii8+CiAgPHBhdGggZmlsbD0idXJsKCNhKSIgZmlsbC1vcGFjaXR5PSIuOCIgZD0iTTAgMGgxNDQ4djIxNzJIMHoiLz4KICA8cGF0aCBmaWxsPSIjMEEwQTBBIiBkPSJNMCAyMTcyaDE0NDh2LTcyNEgweiIvPgogIDxwYXRoIHRyYW5zZm9ybT0ibWF0cml4KC0xIDAgMCAxIDE0NDggMCkiIGZpbGw9InVybCgjYikiIGQ9Ik0wIDBoMTQ0OHYxNDQ4SDB6Ii8+CiAgPG1hc2sgaWQ9ImMiIHN0eWxlPSJtYXNrLXR5cGU6YWxwaGEiIG1hc2tVbml0cz0idXNlclNwYWNlT25Vc2UiIHg9IjAiIHk9IjAiIHdpZHRoPSIxNDQ4IiBoZWlnaHQ9IjIxNzIiPgogICAgPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xNDQ4IDBIMHYyMTcyVjBoMTQ0OFptMCAxMzEuNTk4TDEyNS45MjEgNzQ3Ljk1OCA0MzkuMzI5IDIxNzJIMTQ0OFYxMzEuNTk4WiIgZmlsbD0iIzAwMCIvPgogIDwvbWFzaz4KICA8ZyBtYXNrPSJ1cmwoI2MpIj4KICAgIDxwYXRoIGZpbGw9IiMwQTBBMEEiIGQ9Ik0xNDQ4IDBIMHYyMTcyaDE0NDh6Ii8+CiAgICA8cGF0aCBmaWxsPSJ1cmwoI2QpIiBmaWxsLW9wYWNpdHk9Ii44IiBkPSJNMCAwaDE0NDh2MjE3MkgweiIvPgogICAgPHBhdGggZmlsbD0idXJsKCNlKSIgZD0iTTAgMGgxNDQ4djIxNzJIMHoiLz4KICAgIDxwYXRoIGZpbGw9InVybCgjZikiIGQ9Ik0wIDBoMTQ0OHYyMTcySDB6Ii8+CiAgPC9nPgogIDxkZWZzPgogICAgPGxpbmVhckdyYWRpZW50IGlkPSJhIiB4MT0iMTQ0OCIgeTE9IjEwODYiIHgyPSItMTI2LjA4NyIgeTI9Ijg1My40NDYiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgICAgPHN0b3Agc3RvcC1jb2xvcj0iIzFGMUYxRiIvPgogICAgICA8c3RvcCBvZmZzZXQ9IjEiIHN0b3AtY29sb3I9IiMxRjFGMUYiIHN0b3Atb3BhY2l0eT0iMCIvPgogICAgPC9saW5lYXJHcmFkaWVudD4KICAgIDxsaW5lYXJHcmFkaWVudCBpZD0iYiIgeDE9IjcyNCIgeTE9IjE0NDgiIHgyPSI3MjQiIHkyPSIwIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+CiAgICAgIDxzdG9wIHN0b3AtY29sb3I9IiMwQTBBMEEiLz4KICAgICAgPHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjMEEwQTBBIiBzdG9wLW9wYWNpdHk9IjAiLz4KICAgIDwvbGluZWFyR3JhZGllbnQ+CiAgICA8bGluZWFyR3JhZGllbnQgaWQ9ImQiIHgxPSIwIiB5MT0iMTA4NiIgeDI9IjEzNDMuMiIgeTI9Ijk2OC45OTIiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgICAgPHN0b3Agb2Zmc2V0PSIuMjUiIHN0b3AtY29sb3I9IiMxRjFGMUYiLz4KICAgICAgPHN0b3Agb2Zmc2V0PSIxIiBzdG9wLWNvbG9yPSIjMUYxRjFGIiBzdG9wLW9wYWNpdHk9IjAiLz4KICAgIDwvbGluZWFyR3JhZGllbnQ+CiAgICA8bGluZWFyR3JhZGllbnQgaWQ9ImUiIHgxPSIxNDQ4IiB5MT0iMTA4NiIgeDI9IjcyNCIgeTI9IjEwODYiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgICAgPHN0b3Agc3RvcC1jb2xvcj0iIzBBMEEwQSIvPgogICAgICA8c3RvcCBvZmZzZXQ9Ii43NSIgc3RvcC1jb2xvcj0iIzBBMEEwQSIgc3RvcC1vcGFjaXR5PSIwIi8+CiAgICA8L2xpbmVhckdyYWRpZW50PgogICAgPGxpbmVhckdyYWRpZW50IGlkPSJmIiB4MT0iNzI0IiB5MT0iMjE3MiIgeDI9IjcyNCIgeTI9IjAiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIj4KICAgICAgPHN0b3Agc3RvcC1jb2xvcj0iIzBBMEEwQSIvPgogICAgICA8c3RvcCBvZmZzZXQ9IjEiIHN0b3AtY29sb3I9IiMwQTBBMEEiIHN0b3Atb3BhY2l0eT0iMCIvPgogICAgPC9saW5lYXJHcmFkaWVudD4KICA8L2RlZnM+Cjwvc3ZnPgo=);
			background-size: cover;
			/* position: relative; */
		  overflow: hidden; 
		}
		


.wrapper .main_content .info div{
  margin-bottom: 20px;
	}

p{
	margin-rigt:100px;
	margin-bottom:25px;
}

.container {
    display: block;
    position: relative;
    z-index: 0;
    width: 100%;
    max-width: 56%;
    min-height: 72%;
		top: 18%;
    left: 13.5%;
    background-color: #292727;
    color: white;
}

#password1,#password2,#nickName{
   border: none;
    background-color: #333;
    height: 60px;
    color: white;
    padding-left: 15px;
    border-radius: 5px;
    width: 91%;
	}

.btn-primary {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
    width: 45%;
    height: 40px;
}

.btn-secondary:hover {
    color: lightblue;
}
</style>
<script>
	'use strict';
    let nickCheckSw = 0;
    
    // 회원가입폼 체크후 서버로 전송하기
    function fCheck() {
      let regNickName = /^[가-힣]+$/;
      let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
      
      let submitFlag = 0;		// 전송체크버튼으로 값이 1이면 체크완료되어 전송처리한다.
    	
    	let nickName = myform.nickName.value;
    	let email= myform.email.value;
    	
    	// 기타 추가로 체크해야 할 항목들을 모두 체크하세요.....
    	if(!regNickName.test(nickName)) {
        alert("닉네임은 한글만 사용가능합니다.");
        myform.nickName.focus();
        return false;
      }
      else if(!regEmail.test(email)) {
        alert("이메일 형식에 맞지않습니다.");
        myform.email.focus();
        return false;
        }
        else {
	    	  submitFlag = 1;
	      }
    	
  		// 전송전에 모든 체크가 끝나서 submitFlag가 1이되면 서버로 전송한다.
  		let nickName_ = '${sNickName}';
    	if(submitFlag == 1) {
    		if(nickName_ != nickName && nickCheckSw == 0) {
    			alert("닉네임 중복체크버튼을 눌러주세요!");
    		}
    		else {
	  			myform.email.value = email;
	  			myform.submit();
    		}
    	}
    	else {
    		alert("회원가입 실패~~");
    	}
    }		
    
    
    // nickName 중복체크
    function nickCheck() {
    	let nickName = $("#nickName").val();
    	if(nickName == "" || $("#nickName").val().length<2 || $("#nickName").val().length>=20) {
    		alert("닉네임을 입력하세요(아이디는 2~20자 이내로 사용하세요)!");
    		myform.nickName.focus();
    		return false;
    	}
    	if(nickName == '${sNickName}') {
    		nickCheckSw = 1;
    		return false;
    	}
    	
    	$.ajax({
    		type : "post",
    		url  : "${ctp}/member/memberNickNameCheck",
    		data : {nickName : nickName},
    		success:function(res) {
    			if(res == "1") {
    				alert("이미 사용중인 닉네임 입니다.");
    				$("#nickName").focus();
    			}
    			else {
    				alert("사용 가능한 닉네임 입니다.");
    				nickCheckSw = 1;	// 닉네임 검색버튼을 클릭한 경우는 nickCheckSw는 1이다.
    			}
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    

</script>
</head>
<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>
<body>
<div class="wrapper">
    <div class="sidebar">
      <p><a href="${ctp}/LeagueOfLegend.jsp"><img src="images/logo2.png"/></a></p>
       	<div style="margin-left:5em;">
       	 <ul>
            <li>&nbsp;&nbsp;&nbsp;<p><font color="white" size="7rem"><b>계정 관리</b></font></p></li>
            <li><a href="${ctp}/member/memberMain"><i class="fas fa-home"></i>&nbsp;&nbsp;<b>내 정보</b></a></li>
            <li><a href="${ctp}/member/memberInforUpdate"><i class="fas fa-user"></i>&nbsp;&nbsp;<b>개인정보 관리</b></a></li>
            <li><a href="${ctp}/member/memberPwdUpdate"><i class="fas fa-project-diagram"></i>&nbsp;&nbsp;<b>비밀번호 변경</b></a></li>
            <li><a href="${ctp}/member/memberDelete" onclick="memberDel()" ><i class="fas fa-address-card"></i>&nbsp;&nbsp;&nbsp;<b>회원탈퇴</b></a></li>
        </ul> 
       </div>
    </div>
</div>
    <section>
    	<div class="container" >
    		<div class="" style="float:left;background-color: #211e1f;left: 10%;margin-left: -1.35%;width: 45%;height: 698px;color: white; padding:65px;">
    			<h2><b>개인정보</b></h2>
    			<p><b>본 항목은 개인정보로서 다른 플레이어에게 공유되지 않습니다.</b></p>
	    		</div>
	    			<form name="myform" method="post" class="was-validated">
	    				<div style="float: right; width:50%; padding-top:40px;" >
			    			<font color="grey">접속 계정</font> : <b>${sNickName}</b>
			    			<br><br><br>
			    			<h3><b>개인정보 변경</b></h3>
			    			<br>
			    			<input type="text" value="${vo.nickName}" name="nickName" id="nickName" required >
			    			<br>
				    			<div class="" style="margin-left:78%;">
				    				<input type="button" value="CHECK" class="btn btn-secondary " onclick="nickCheck()" style="background: #292727; border: none;"/>
									</div>
			    			<br>
			    			<input type="text" placeholder="${vo.email}" name="email" id="password1" required >
			    			<br><br><br><br>
			    			<button type="button" class="btn btn-primary" onclick="fCheck()">변경사항 저장</button> &nbsp;
						    <button type="reset" class="btn btn-primary">취&nbsp;&nbsp;소</button> &nbsp;
	    				</div>
    			<input type="hidden" name="mid" value="${sMid}"/>
    		</form>
     </div>
    </section>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
</html>