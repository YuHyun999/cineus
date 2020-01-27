<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>CINEUS</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	
	<!-- 갤러리 -->
	<link rel="stylesheet" type="text/css" href="${context}/css/gallery_style.css">
	<style>

 #page-title{
 font-size: 1.7em;
 color : black;
 text-align: center;
 margin: 1em;
 }
 .container-fluid {
   max-width:1210px;
}
	</style>
  
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->


 <br><br><br>
 
 <div class="container-fluid">
 <div id="page-title">
 		 	<h3><img src="${context}/images/schedule-24px.svg" style="width:40px;height:40px;margin-bottom:10px">&nbsp;&nbsp;예매하기</h3>
 		 </div>
 
 
</div> <!-- container-fluid 끝 -->

 
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>