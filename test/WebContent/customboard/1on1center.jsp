<%@page import="faqboard.BoardDAO"%>
<%@page import="faqboard.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<c:set var="pageNum" value = "${pageNum}"/>
<c:set var="boardList" value = "${boardList}"/>
<c:set var="pageCount" value = "${pageCount}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  header.jsp에 이미 </head> 와 <body>가 있음 -->	
<!-- </head> -->
<!-- <body> -->

<!-- 헤더 들어가는곳 -->
<jsp:include page="/inc/header.jsp"/>
<!-- 헤더 들어가는곳 -->
<link rel="stylesheet" href="${contextPath}/customboard/style.css">


<div class="content-wrap">
	<div class="center-home-div">
		<ul class="center-home">
			<li class = "center-home-inner">
				<a class = "center-text" href="${contextPath}/customerboard/customcenter.do" >고객센터</a>
			<li>
		</ul>
		<hr class="center-home-line">
	</div>
</div>
<div class = "container width-fixed">
	<div class = "customer-tab cu30">
		<ul>
			<li><a href = "${contextPath}/customerboard/FAQcenter.do" class = "ct5">자주묻는질문</a></li>
			<li><a href = "${contextPath}/customerboard/noticecenter.do" class = "ct5">공지사항</a></li>
			<li><a href = "${contextPath}/customerboard/1on1center.do" class = "ct5">1:1문의</a></li>
			<li><a class = "ct5">단체관람/대관문의</a></li>
			<li style = "border-right:1px solid #d9d9d9;"><a class = "ct5">분실물문의/접수</a></li>
			<li class = "ct5" id = "phone-number">시네어스 고객센터<br><h4>Cineus center</h4><hr><h3>1234-5678</h3></li>
		</ul>
	</div>
	
	
</div> <!-- container width-fixed 의 끝 -->

</body>
</html>