<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>	
<style>
body {
	background-color: #77777;
	font-family: 'Montserrat', sans-serif;
	font-size: 16px;
	line-height: 1.25;
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
	margin-left: 50rem;
	margin-top: 8rem;
  padding: 5rem 4rem 0 4rem;
	width: 100%;
	max-width: 525px;
	min-height: 680px;
	/* background-image: url("images/rul.jpg"); */
	background-color: #2b2f56;
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
 */	/* background-image: radial-gradient(ellipse at left bottom, rgba(22, 24, 47, 0.5) 0%,rgba(38, 20, 72, 0.5) 0%, rgba(3, 27, 75, 0.5) 30%); */
	/* background-image: radial-gradient(ellipse at left bottom, rgba(22, 24, 47, 0.5) 0%,rgba(38, 20, 72, 0.5) 0%, rgba(3, 27, 75, 0.5) 30%); */
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

.login-nav__item + .login-nav__item {
	margin-left: 2.25rem;
}

.login-nav__item a {
	position: relative;
	color: rgba(255, 255, 255, 0.5);
	text-decoration: none;
	text-transform: uppercase;
	font-weight: 500;
	font-size: 1.25rem;
	padding-bottom: .5rem;
	transition: .20s all ease;
}

.login-nav__item.active a,
.login-nav__item a:hover{
	color: #ffffff;
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
	color: rgba(255, 255, 255, 0.5);
	text-transform: uppercase;
	font-size: .75rem;
	margin-bottom: 1rem;
}

.login__label--checkbox {
	display: inline-block;
	position: relative;
	padding-left: 1.5rem;
	margin-top: 2rem;
	margin-left: 1rem;
	color: #ffffff;
	font-size: .75rem;
	text-transform: inherit;
}

.login__input {
	color: white;
	font-size: 1.15rem;
	width: 100%;
	padding: .5rem 1rem;
	border: 2px solid transparent;
	outline: none;
	border-radius: 1.5rem;
	background-color: rgba(255, 255, 255, 0.25);
	letter-spacing: 1px;
}

.login__input:hover,
.login__input:focus{
	color: white;
	border: 2px solid rgba(255, 255, 255, 0.5);
	background-color: transparent;
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
		color: #ffffff;
    font-size: 1rem;
    font-family: 'Montserrat', sans-serif;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-top: 1rem;
    padding: 0.75rem;
    border-radius: 0.4rem;
    display: block;
    width: 47%;
    height: 45px;
    background-color: rgba(17, 97, 237, .75);
    border: none;
    cursor: pointer;
}

.login__submit:hover {
	background-color: rgba(17, 97, 237, 1);
}

.login__forgot {
	display: block;
	margin-top: 3rem;
	text-align: center;
	color: rgba(255, 255, 255, 0.75);
	font-size: .75rem;
	text-decoration: none;
	position: relative;
	z-index: 1;
}

.login__forgot:hover {
	color: rgb(17, 97, 237);
}

		section {
			width: 100%;
			height: 100vh;
			background-image: url("../resources/images/lgb.jpg" ) ;
			/* background-color : #333333; */
			
			background-size: cover;
			/* position: relative; */
		  overflow: hidden; 
		}
		
		.brand {
  position: absolute;
  padding-left: 20px;
  float: left;
  line-height: 70px;
  text-transform: uppercase;
  font-size: 1.4em;
}

.brand {
  position: absolute;
  padding-left: 20px;
  float: left;
  line-height: 70px;
  text-transform: uppercase;
  font-size: 1.4em;
}

.modal:nth-of-type(even) {
    z-index: 1052 !important;
}
.modal-backdrop.show:nth-of-type(even) {
    z-index: 1051 !important;
}

.modal-header {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-align: start;
    align-items: flex-start;
    -ms-flex-pack: justify;
    justify-content: space-between;
    padding: 1rem 1rem;
    border : none;
    border-top-left-radius: calc(0.3rem - 1px);
    border-top-right-radius: calc(0.3rem - 1px);
}
.btn:not(:disabled):not(.disabled) {
    cursor: pointer;
    width: 100%;
}
</style>

<script>
	//'use strict';
	
	// 카카로그인을 위한 자바스크립트 키
	window.Kakao.init("bccce5544cf0a895f6ee7bd513b82cc7");
	
	//카카오 로그인
 	function kakaoLogin() {
		window.Kakao.Auth.login({ //로그인 인증하겠다, 기능을적을거라 중괄호
			scope: 'profile_nickname, account_email',//동의항목에서 닉네임,이메일 변수
			success:function(autoObj) {
				console.log(Kakao.Auth.getAccessToken(),"로그인 OK"); //인증과정을거쳐서 토큰값을 보내줌
				console.log(autoObj);
				window.Kakao.API.request({
					url : '/v2/user/me',
					success:function(res) {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
						//alert(kakao_account.email + "/" + kakao_account.profile.nickname);  // 이메일/닉네임 이렇게나옴
						
						//KakaoLoginOk만드는건(아래처럼하지말고 ok로 바로보내기) 숙제
						location.href = "${ctp}/member/memberKakaoLogin?nickName="+kakao_account.profile.nickname+"&email="+kakao_account.email;
					}
				}); //api쓴다고 요청함 ,$.ajax랑 똑같음
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
			<li class="login-nav__item active">
				<a href="${ctp}/member/memberLogin"><b>로그인</b></a>&nbsp;
			</li>
			<li class="login-nav__item">
				<a href="${ctp}/member/memberJoin">회원가입</a>
			</li>
		</ul>
		<label for="login-input-user" class="login__label">
			ID
		</label>
		<input id="login-input-user" class="login__input" type="text" name="mid" value="${mid}" />
		<label for="login-input-password" class="login__label">
			PASSWORD
		</label>
		<input id="login-input-password" class="login__input" type="password"  name="pwd"/>
		<label for="login-sign-up" class="login__label--checkbox">
			<input id="login-sign-up" name="idCheck" type="checkbox" class="login__input--checkbox" checked/>
			아이디 기억하기
		</label>
		<button type="submit" class="login__submit">로그인</button>
		<div style="float: right;  margin-top: -45px;">
		<a href="javascript:kakaoLogin();"><img src="${ctp}/images/kakao_login_medium_narrow.png" /></a>
		</div>
	</form>
		<a data-toggle="modal" href="#myModal" class="login__forgot">아이디 또는 비밀번호를 잊으셨나요?</a>
</div>
</section>
	<div class="modal" id="myModal" style=" width: 20%;height: 290px;left: 42.8%;top: 30%;">
	<div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header text-center">
          <h3 class="modal-title" style="margin-left: 15%; border:none;"><b>무엇을 도와드릴까요?</b></h3>    
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        </div>
        <div class="container"></div>
        <div class="modal-body" >
          <a href="${ctp}/member/memberIdSearch" class="btn btn-outline-primary form-comtrol">아이디를 잊어버렸어요</a><br><br>
          <a href="${ctp}/member/memberPwdSearch" class="btn btn-primary form-comtrol">비밀번호가 기억나지 않아요</a>
        </div>
      </div>
    </div>
</div>
<div class="modal" id="myModal2" data-backdrop="static">
	<div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">2nd Modal title</h4>
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        </div><div class="container"></div>
        <div class="modal-body">
          Content for the dialog / modal goes here.
          Content for the dialog / modal goes here.
          Content for the dialog / modal goes here.
          Content for the dialog / modal goes here.
          Content for the dialog / modal goes here.
        </div>
        <div class="modal-footer">
          <a href="#" class="btn btn-primary">Save changes</a>
        </div>
      </div>
    </div>
</div>
</body>
</html>
