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
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    box-shadow: 0 5px 10px rgb(154 160 185 / 5%), 0 15px 40px rgb(166 173 201 / 20%);
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    border-radius: -14px;
}

th{
	width:10%;
}

</style>
<script>
'use strict';

$(document).ready(function() {
	var wDate = document.getElementsByClassName('wDate');
	for(var i=0; i<wDate.length; i++) {		// 여러개의 날짜를 숫자로 변환하는부분이 있다면 그 클래스 갯수만큼 돌린다.
		var fromNow = moment(wDate[i].value).fromNow();		// 해당클래스의 value값을 넘겨주면 시간으로 계산해도 돌려준다.
	    document.getElementsByClassName('inputDate')[i].innerText = fromNow;	// 담아온 시간을 inputDate클래스에 뿌려준다.
	}
});


function qnaReply() {
	var qnaIdx = "${vo.idx}";
	var reContent = replyForm.reContent.value;
	if(reContent == "") {
		alert("글을 입력하세요.");
		replyForm.reContent.focus();
		return false;
	}
	var query = {
			qnaIdx : qnaIdx,
			reContent : reContent
	}
	$.ajax({
		url : "${ctp}/admin/QnaReplyInput",
		type : "post",
		data : query,
		success : function(data) {
			location.reload();
		}
	});
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
	      <h2>&nbsp;&nbsp;<b>묻고 답하기</b></h2>
	    	</div>
	    	<br>
				<div class="card-body">
					<div class="container">
						<table class="table table-bordered table-black">
							<tr>
								<th>제목</th>
								<td colspan="3"> ${vo.title}</td>
							</tr>
							<tr>
								<th>작성ID</th>
								<td colspan="3">${vo.mid}</td>
							</tr>
							<tr>
								<th>상태</th>
								<td colspan="3">
									<c:if test="${vo.reply=='미답변'}">
										<span class="badge badge-pill badge-secondary">${vo.reply}</span>						
									</c:if>
									<c:if test="${vo.reply=='답변완료'}">
										<span class="badge badge-pill badge-danger">${vo.reply}</span>						
									</c:if>
								</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td style="width:200px">${fn:substring(vo.WDate,0,10)}</td>
							</tr>
							<tr>
								<td colspan="4" class="view-content">
						      <c:if test="${!empty vo.FSName}"><img src="${ctp}/data/qna/${vo.FSName}" width="400px"/><br/></c:if>
						      <br/>
						      <p>${fn:replace(vo.content,newLine,"<br/>")}<br/></p>
								</td>
							</tr>
						</table>
						<!-- 답변서가 작성되어 있을때 수행하는 곳 -->
						<c:if test="${!empty reVo.reContent}">
							<form name="replyForm">
								<label for="reContent"><h5>답변내용</h5></label>
								<c:if test="${empty sReplySw || sReplySw != '1'}">	<!-- 답변서 작성되어 있고, 수정가능상태는 readonly로 처리후 '수정'버튼 누르면 'readonly'해제후 '수정완료'버튼으로 바꾼다. -->
									<%-- <textarea name="reContent" rows="5"  id="reContent" readonly="readonly" class="form-control" >${reVo.reContent}</textarea> --%>
									<textarea name="reContent" rows="5"  id="reContent" class="form-control bg-light" >${reVo.reContent}</textarea>
									<div style="text-align: right">		<!-- 수정을 위해서는 현재 답변글의 글번호(reIdx)를 넘겨야하지만, 현재는 답변글이 항상 1개이기에 넘기지않아도 알수 있다. -->
										<input type="button" value="수정" id="updateBtn" onclick="updateReplyCheck()" class="btn btn-secondary btn-sm mt-2"/>
										<input type="button" value="삭제" id="deleteBtn" onclick="deleteReplyCheck()" class="btn btn-danger btn-sm mt-2"/>
									</div>
								</c:if>
								<c:if test="${!empty sReplySw && sReplySw == '1'}">
									<textarea name="reContent" rows="5"  id="reContent" class="form-control" >${reVo.reContent}</textarea>
									<div style="text-align: right">
										<input type="button" value="수정완료" id="updateOkBtn" onclick="updateReplyCheckOk()" class="btn btn-secondary btn-sm mt-2"/>
										<input type="button" value="삭제" id="deleteBtn" onclick="deleteReplyCheck()" class="btn btn-secondary btn-sm mt-2"/>
									</div>
								</c:if>
							</form>
						</c:if>
					
						<!-- 답변서가 작성되어 있지 않을때 수행하는 곳 -->
						<c:if test="${empty reVo.reContent}">
							<form name="replyForm">
								<label for="reContent">답변글 작성하기</label>
								<textarea name="reContent" rows="5" class="form-control" placeholder="답변글 작성하기"></textarea>
								<div style="text-align: right">
									<input type="button" value="등록" onclick="qnaReply()" class="btn btn-secondary btn-sm mt-2"/>
								</div>
							</form>
						</c:if>
					</div>					
				</div>
			</div>
		</div>
	</div>
</main>	
</div>
</body>
</html>
