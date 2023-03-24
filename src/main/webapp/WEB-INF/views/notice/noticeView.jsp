<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항(notifyView.jsp)</title>
</head>
<body>
<%@ include file="/WEB-INF/views/include/bs4.jsp" %>
<p><br/></p>
<div class="modal-dialog modal-dialog-centered">
  <div class="modal-content">
  
    <div class="modal-header">
	    <h4>${vo.title}</h4>
	    <button type="button" class="close" data-dismiss="modal" onclick="window.close()">&times;</button>
	  </div>
	  <div class="modal-body">
	    ${fn:replace(vo.content, newLine, "<br/>")}
	  </div>
	  <hr size="5"/>
	  <hr/>
	  <div class="modal-footer">
	    <input type="button" value="닫기" onclick="window.close()"/>
	  </div>
	</div>
</div>
<p><br/></p>
</body>
</html>