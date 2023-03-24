<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>dbOrderBaesong.jsp</title>
</head>
<body>
<div class="container">
  <h2>배송조회</h2>
  <hr/>
  <p>주문자 : ${vo.name}</p>
  <p>연락처 : ${vo.tel}</p>
  <p>주소 : ${vo.address}</p>
  <p>배송메세지 : ${vo.message}</p>
  <p>결재수단 : ${vo.payment}</p>
  <p>주문번호 : ${vo.orderIdx}</p>
  <hr/>
</div>
</body>
</html>