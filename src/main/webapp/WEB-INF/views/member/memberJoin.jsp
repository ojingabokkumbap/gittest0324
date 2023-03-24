<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
	
	<style>
	

		body {
			background-color: #e9e9e9;
			font-family: 'Montserrat', sans-serif;
			font-size: 16px;
			/* line-height: 1.25; */
			letter-spacing: 1px;
		}
		
		* {
			box-sizing: border-box;
			transition: .25s all ease;
		}
		
		.login-container {
			display: block;
			position: relative;
			z-index: 0;
			margin-top: 4rem;
    	margin-left: 18rem;
		  padding: 3rem 4rem 0 4rem;
			width: 100%;
			max-width: 525px;
			min-height: 800px;
			/* background-image: url("images/sion.jpg"); */
			background-color: #f5f5f5;
			box-shadow: 0 50px 70px -20px rgba(0, 0, 0, 0.85);
		}
		
		.login-container:after {
		/* 	content: '';
			display: inline-block;
			position: absolute;
			z-index: 0;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			background-image: radial-gradient(ellipse at left bottom, rgba(22, 24, 47, 0.5) 0%,rgba(38, 20, 72, 0.5) 0%, rgba(3, 27, 75, 0.5) 30%); */
			box-shadow: 0 -20px 150px -20px rgba(0, 0, 0, 0.5);
		}
		
		.form-login {
			position: relative;
			z-index: 1;
		  padding-bottom: 4.5rem;
		  border-bottom: 1px solid rgba(255, 255, 255, 0.25);
		}
		

		.login-nav {
			position: relative;
			padding: 0;
			margin: 0 0 6em 1rem;
		}
		
		.login-nav__item {
			list-style: none;
			display: inline-block;
		}
		
		.custom-select {
    display: inline-block;
    width: 100%;
    padding: 0.375rem 1.75rem 0.375rem 0.75rem;
    font-size: 1rem;
    height:44px;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    /* vertical-align: middle; */
    /* border-radius: 33px; */
    background: #fff url(data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='4' height='5' viewBox='0 0 4 5'%3e%3cpath fill='%23343a40' d='M2 0L0 2h4zm0 5L0 3h4z'/%3e%3c/svg%3e) no-repeat right 0.75rem center/8px 10px;
    background-color: #9ac0eb;
    border: 0.1px solid #ced4da;
    border-radius: 1.25rem;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
}
		
		.login-nav__item + .login-nav__item {
			margin-left: 2.25rem;
		}
		
		.login-nav__item a {
			position: relative;
			color: rgba(0, 0, 0, 0.5);
			text-decoration: none;
			text-transform: uppercase;
			font-weight: 500;
			font-size: 1.25rem;
			padding-bottom: .5rem;
			transition: .20s all ease;
		}
		
		.login-nav__item.active a,
		.login-nav__item a:hover{
			color: #444444;
			transition: .15s all ease;
		}
		
		.login-nav__item a:after {
			content: '';
		  display: inline-block;
		  height: 10px;
		  background-color: rgb(255, 255, 255);
		  position: absolute;
		  right: 100%;
		  bottom: -1px;
		  left: 0;
		  border-radius: 50%;
		  transition: .15s all ease;
		}
		
		.login-nav__item a:hover:after,
		.login-nav__item.active a:after{
			background-color: rgb(17, 97, 237);
			height: 2px;
			right: 0;
			bottom: 2px;
			border-radius: 0;
			transition: .20s all ease;
		}
		
		.login__label {
			display: block;
			padding-left: 1rem;
		}
		
		.login__label,
		.login__label--checkbox {
			/* color: rgba(255, 255, 255, 0.5); */
 	   color: #727272;
   	 font-size: 1rem;
		}
		
		.login__label--checkbox {
		    display: inline-block;
		    position: relative;
		    padding-left: 1.5rem;
		    margin-top: 1rem;
		    margin-left: 1rem;
		    color: #222222;
		    font-size: 0.85rem;
		    text-transform: inherit;
		}
		
		.login__input {
			color: #777777;
			font-size: 1.15rem;
			width: 100%;
			padding: .5rem 1rem;
			border: 2px solid transparent;
			outline: none;
			border-radius: 1.5rem;
			background-color: rgb(154 192 235);
			letter-spacing: 1px;
		}
		
		.login__input:hover,
		.login__input:focus{
			color: white;
			border: 2px solid rgba(0, 0, 0, 0.1);
			background-color: rgba(0, 0, 0, 0.50);
		}
		
		.login__input + .login__label {
			margin-top: 1.5rem;
		}
		
		.login__input--checkbox {
			position: absolute;
			top: .1rem;
			left: 0;
			margin: 0;
		}
		
		.login__submit {
			color: #222222;
			font-size: 1rem;
			font-family: 'Montserrat', sans-serif;
			text-transform: uppercase;
			letter-spacing: 1px;
			margin-top: 5rem;
			padding: .75rem;
			border-radius: 2rem;
			display: block;
			width: 100%;
			background-color: rgb(0 0 0 / 76%);
			cursor: pointer;
			border:none;
		}
		
		.login__idcheck {
			color: #c13737;
			font-size: 1rem;
			font-family: 'Montserrat', sans-serif;
			letter-spacing: 1px;
			margin-top: 1rem;
			font-size: .75rem;
			border-radius: .5rem;
			/* display: block; */
			width: 20%;
			/* background-color: rgba(17, 97, 237, 1); */
			margin-left: -1.5em;
			border: none;
			cursor: pointer;
		}
		
		.login__nicknamecheck {
			color: #c13737;
			font-size: 1rem;
			font-family: 'Montserrat', sans-serif;
			letter-spacing: 1px;
			margin-top: 1rem;
			font-size: .75rem;
			border-radius: .5rem;
			/* display: block; */
			width: 20%;
			/* background-color: rgba(17, 97, 237, 1); */
			margin-left: -0.5em;
			border: none;
			cursor: pointer;
		}
		
		.login__submit:hover {
			/* background-color: rgba(17, 97, 237, 1); */
			background-color: black;
		}
		
		/* .login__forgot {
			display: block;
			margin-top: 3rem;
			text-align: center;
			color: rgba(255, 255, 255, 0.75);
			font-size: .75rem;
			text-decoration: none;
			position: relative;
			z-index: 1;
		}
		 */
		.login__forgot:hover {
			color: rgb(17, 97, 237);
		}
				section {
					width: 100%;
					height: 100vh;
					background-image: url("../resources/images/job2.jpg" ) ;
					background-size: cover;
					/* position: relative; */
				  overflow: hidden; 
				}
				
			.input_contet{
				margin: 15px;
		    margin-top: -50px;
			}
			
			.email-form {
		    color: #777777;
		    font-size: 1.15rem;
		    width: 100%;
		    padding: 0.5rem 1rem;
		    border: 2px solid transparent;
		    outline: none;
		    border-radius: 1.5rem;
		    background-color: rgb(154 192 235);
		    letter-spacing: 1px;
		    max-width : 250px;
		}
		.brand {
		  position: absolute;
		  padding-left: 20px;
		  float: left;
		  line-height: 70px;
		  text-transform: uppercase;
		  font-size: 1.4em;
		}
		h1{
			font-size:95px;
		}
	</style>
	<script>
		'use strict';
		// 아이디와 닉네임 중복버튼을 클릭했는지를 확인하기위한 전역변수를 정의한다.(버튼클릭후에도 내용을 수정했다면 초기값은 0으로 셋팅해서 버튼을 누를수 있도록해야한다.)
			let idCheckSw = 0;
			let nickCheckSw = 0;
		
		//비밀번호 확인
	 	$(function(){
			$('#password2').blur(function() {
		    if($('#password1').val() != $('#password2').val()) {
		    	if($('#password2').val()!='') {
			    	alert("비밀번호가 일치하지 않습니다.");
	    	    $('#password2').val('');
	          $('#password2').focus();
		      }
		    }
			})  	   
		});
		
	 	function fCheck(){
	    let regMid = /^[a-z0-9_]{4,20}$/;
	    let regNickName = /^[가-힣]+$/;
	    let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	    
	    let submitFlag = 0;		// 전송체크버튼으로 값이 1이면 체크완료되어 전송처리한다.
	    
		 	let mid = myform.mid.value;
			let pwd = myform.pwd.value;
			let nickName = myform.nickName.value;
		  let email1 = myform.email1.value;
			let email2 = myform.email2.value;
		  let email = email1 + '@' + email2;
		  
			if(!regMid.test(mid)) {
        alert("아이디는 영문 소문자와 숫자, 언더바(_)만 사용가능합니다.(길이는 4~20자리까지 허용)");
        myform.mid.focus();
        return false;
      }
	    else if(!regNickName.test(nickName)) {
        alert("닉네임은 한글만 사용가능합니다.");
        myform.nickName.focus();
        return false;
      }
	    else if(!regEmail.test(email)) {
        alert("이메일 형식에 맞지않습니다.");
        myform.email1.focus();
        return false;
      } 
	    else {
	  	  submitFlag = 1;
	    }
		 	
			// 전송전에 모든 체크가 끝나서 submitFlag가 1이되면 서버로 전송한다.
			if(submitFlag == 1) {
				if(idCheckSw == 0) {
					alert("아이디 중복체크버튼을 눌러주세요!");
					document.getElementById("midBtn").focus();
					return false;
				}
				else if(nickCheckSw == 0) {
					alert("닉네임 중복체크버튼을 눌러주세요!");
					document.getElementById("nickNameBtn").focus();
					return false;
				}
				else {
	  			// 묶여진 필드(email/tel)를 폼태그안에 hidden태그의 값으로 저장시켜준다.
	  			myform.email.value = email;
	  			myform.submit();
				}
			}
			else {
				alert("회원가입 실패");
			}
		}
	
		// id 중복체크
		function idCheck() {
			let mid = myform.mid.value;
	    	if(mid.trim() == "" || mid.length<4 || mid.length>=10) {
	    		alert("아이디를 확인하세요.");
	    		myform.mid.focus();
	    		return false;
	    }
	    	
	    	$.ajax({
	    		type  : "post",
	    		url   : "${ctp}/member/memberIdCheck",
	    		data  : {mid : mid},
	    		success:function(res) {
	    			if(res == "1") {
	    				alert("이미 사용중인 아이디입니다.");
	    				$("#mid").focus();
	    			}
	    			else {
	    				alert("사용 가능한 아이디입니다.");
	    				idCheckSw = 1;
	    			}
	    		},
	    		error : function() {
	    			alert("전송오류!");
	    		}
	    	});
	    }
		
		 // nickName 중복체크
	    function nickNameCheck() {
	    	let nickName = myform.nickName.value;
	    	if(nickName.trim() == "" || nickName.length<1 || nickName.length>=10) {
	    		alert("닉네임을 확인하세요.");
	    		myform.nickName.focus();
	    		return false;
	    	}
	    	
	    	$.ajax({
	    		type  : "post",
	    		url   : "${ctp}/member/memberNickNameCheck",
	    		data  : {nickName : nickName},
	    		success:function(res) {
	    			if(res == "1") {
	    				alert("이미 사용중인 닉네임입니다.");
	    				$("#nickName").focus();
	    			}
	    			else {
	    				alert("사용 가능한 닉네임입니다.");
	    				nickCheckSw = 1;
	    			}
	    		},
	    		error : function() {
	    			alert("전송오류!");
	    		}
	    	});
	    }
		
	</script>
</head>
<body>
<section>
  <div class="brand">
    <a href="${ctp}/"><img src="../resources/images/logo.png"/></a>
  </div>
	<div class="login-container">
		<form name="myform" method="post" class="form-login">
			<ul class="login-nav">
				<li class="login-nav__item">
					<a href="${ctp}/member/memberLogin">로그인</a>
				</li>
				<li class="login-nav__item active">
					<a href="${ctp}/member/memberJoin"><b>회원가입</b></a>
				</li>
			</ul>
			<div class="input_contet">
			<label for="login-input-user" class="login__label">
				ID &nbsp; 
			<button class="login__idcheck" id="login__idcheck" onclick="idCheck()">CHECK</button>
			</label>
			<input id="mid" class="login__input" placeholder="4~10자 이내" autocomplete="off" type="text" name="mid" />
			<!--  -->
			<label for="login-input-password" class="login__label">
				PASSWORD
			</label>
			<input id="password1" class="login__input" type="password" name="pwd"/>
			<!--  -->
			<label for="login-input-password" class="login__label">
				PASSWORD
			</label>
			<input id="password2" class="login__input" type="password" name="pwd"/>
			<label for="login-input-nickname" class="login__label">
				NICKNAME <button class="login__nicknamecheck mt-3" onclick="nickNameCheck()">CHECK</button>
			</label>
			<div class ="email-group">
				<input id="nickName" name="nickName" placeholder="1~10자 이내" class="login__input" type="text" />
		    <label for="email1" class="login__label mt-4">EMAIL</label>
				<div class="input-group mb-3">
				  <input type="text" class="email-form" id="email1" name="email1" required />
				  <div class="input-group-append">
				    <select name="email2" class="custom-select">
					    <option value="naver.com" selected>naver.com</option>
					    <option value="hanmail.net">hanmail.net</option>
					    <option value="gmail.com">gmail.com</option>
					    <option value="nate.com">nate.com</option>
					    <option value="yahoo.com">yahoo.com</option>
					  </select>
				  </div>
				</div>
		  </div>
			</label>
			</div>
			<input type="button" value="가입하기" class="login__submit" style="color:white" onclick="fCheck()" />
			<input type="hidden" name="email"/>
		</form>
	</div>
		<div style="color:white; margin-top: -16em;  margin-left: 64em;">
			<h1><b>라이엇 계정 생성</b></h1>
		</div>
</section>
</body>
</html>
