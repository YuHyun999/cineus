<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="${contextPath}/customer/style.css">
  
</head>
<body>

<div class="content-wrap">
	<div class="center-home-div">
		<ul class="center-home">
			<li class = "center-home-inner">
				<a class = "center-text" href="${contextPath}/customerboard/customcenter.do">고객센터</a>
			<li>
		</ul>
		<hr class="center-home-line">
	</div>
</div>
<div class = "container">
	<div class="center-menu">
		<div>
			<h2><span class="center-title">무엇이 궁금하신가요?</span></h2>
			
			<p class = "center-number">시네어스 고객센터 Customer center / 051-000-0000
				<span class = "center-number-text">무엇이든 물어보살</span>
			</p>
		</div>
	</div>
	<div class = "FAQ">
			<div>
				<div class = "search-label">
				<label>FAQ 검색</label>
				</div>
				<input class = "search" placeholder = "    검색어를 입력하세요">
			</div>
	</div>
	<div class = "customer-box">
	<div class = "box-header" id = "FAQ-content">
		<div>
			<h4>자주 묻는 질문 BEST 5</h4>
		</div>
		<div>
			<ul>
				<li></li>
			</ul>
		</div>
		<button id = "more-faqboard" onclick = "location.href = '${contextPath}/customerboard/FAQcenter.do'">더보기+</button>
	</div>
	</div>
</div>
</body>
</html>