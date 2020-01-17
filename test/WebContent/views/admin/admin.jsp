<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<html lang="ko">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${context}/css/admin.css">
	
<head>
	<meta charset="UTF-8" />
	<title>CINEUS</title>
</head>
<body>

	 <div class="container-fluid">
	 	<!-- 메뉴  -->
		<jsp:include page="/views/common/menu.jsp" />
		<!-- 메뉴 끝 -->
		
		<!-- 어드민 메뉴 -->
		<div class="sidenav">
			<br><br><br>
			<a href="${context}/views/admin/admin.jsp">ADMIN 메인</a><hr>
			  <a href="${context}/views/admin/admin_schedule.jsp">상영 시간표 관리</a><hr>
			  <a href="#services">상영중 영화 관리</a><hr>
			  <a href="#clients">회원 관리</a><hr>
		</div>
		<!-- 어드민 메뉴 끝 -->
		
		<div class="main">
			<!-- 어드민 내용 시작 -->
			<img src="https://source.unsplash.com/featured/?sea,cat,tree,guam" width="100%">
	 		<!-- 어드민 내용 끝 -->
	 	</div> <!-- main 끝 -->
	 </div> <!-- container-fluid 끝 -->
	 
	 <script>
	 </script>
</body>
</html>
