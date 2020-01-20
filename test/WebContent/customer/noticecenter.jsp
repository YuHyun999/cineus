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
<c:set var="noticeList" value = "${noticeList}"/>
<c:set var="pageCount" value = "${pageCount}"/>
<c:set var="startPage" value = "${startPage}"/>
<c:set var="endPage" value = "${endPage}"/>


<%

	request.setCharacterEncoding("UTF-8");


	String searchValue = request.getParameter("searchVal");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src = "https://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript" src="/js/bootstrap-datepicker.js"></script>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<link rel="stylesheet" href="${contextPath}/customer/style.css">

	
</head>
<body>

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
			<li><a class = "ct5">1:1문의</a></li>
			<li><a class = "ct5">단체관람/대관문의</a></li>
			<li style = "border-right:1px solid #d9d9d9;"><a class = "ct5">분실물문의/접수</a></li>
			<li class = "ct5" id = "phone-number">시네어스 고객센터<br><h4>Cineus center</h4><hr><h3>1234-5678</h3></li>
		</ul>
	</div>
	<div class = "search-wrap">
		<select id = "select">
			<option value = "0" id = "0">검색조건선택</option>
			<option value = "1" id = "1">영화예매</option>
			<option value = "2" id = "2">할인/신용카드</option>
			<option value = "3" id = "3">멤버십</option>
			<option value = "4" id = "4">영화관</option>
			<option value = "5" id = "5">홈페이지</option>
			<option value = "6" id = "6">기타</option>
		</select>
		<input type = "text" id = "searchbar" placeholder = "검색어를 입력하세요" value = "">
		<button id = "search" onclick = "searchFAQcenter()"><i id = "search_img"></i></button>
	
	</div>
	<div class = "FAQlist" id = "accordion">
		<div class = "header">
			<span class = "hd1">NO</span>
			<span class = "hd2">지역/영화관</span>
			<span class = "hd3">질문</span>
			<span class = "hd4">작성일</span>
		</div>

			<c:forEach   var="bean" items = "${noticeList}" varStatus = "i">
				<div class = "panel">
				<a class = "showdown title other"  href = "#list${i.count}" data-toggle="collapse" data-parent = "#accordion">
					<span class = "hd1">${i.count}</span>
					<span class = "hd2">${bean.location}</span>
					<span class = "hd3">${bean.subject}</span>
				</a>
				</div>
			</c:forEach>
		
	</div>
	<script type="text/javascript">

	$(document).ready(function() {
		$("a.showdown", "#accordion").click(function(){
			if($(this).next().hasClass("in")){
				$(this).attr("title", "질문 상세펴기");
			}else{
				$(this).attr("title", "질문 상세접기");
			}
		});

		var faqRank = 'null';
		if (faqRank !== '1') {
			$('a[href=#list'+faqRank+']').trigger("click");
		}
	});
	
	</script>
	
	<ul class = "custom-pagination mt25">
		
	<c:if test="${empty param.searchVal &&empty param.selectVal}">
		<c:forEach   var="pageNum" begin = "${startPage}" end = "${endPage}" step = "1" varStatus = "i">
			<li><a name = "list${i.count }" href = "${contextPath }/customerboard/noticecenter.do?pageNum=${i.count }" onclick = "setPage(this);">${i.count}</a></li>
		</c:forEach>
	</c:if>
	<c:if test="${not empty param.searchVal || not empty param.selectVal}">
		<c:forEach   var="pageNum" begin = "${startPage}" end = "${endPage}" step = "1" varStatus = "i">
			<li><a name = "list${i.count }" href = "${contextPath}/customerboard/noticecenter.do?selectVal=${param.selectVal}&searchVal=${param.searchVal}" onclick = "setPage(this);">${i.count }</a></li>
		</c:forEach>
	</c:if>
	</ul>
	

</div>


<%String pageNum = request.getParameter("pageNum"); %>


	<script type="text/javascript">
		var pageNum = <%=pageNum%>;
		
			if(pageNum == null){
				document.getElementsByName("list1")[0].setAttribute('class', 'active');
			}

			document.getElementsByName("list" + pageNum)[0].setAttribute('class', 'active');
			
			
	  		function searchFAQcenter() {
	  			
	  			var select = document.getElementById("select");
	  			var selectVal = select.options[select.selectedIndex].text;  // select 옵션값
	  			var searchVal = document.getElementById("searchbar").value; // 검색창에 입력한 값
	  			
	  			if(selectVal == "검색조건선택") {
	  				selectVal = "";
	  			}
	  			
	  			location.href = "${contextPath}/customerboard/searchList.do?selectVal=" + selectVal + "&searchVal=" + searchVal;
	  			return false;
	  		}
	  		

	  	</script> 
	  	
	  	<script type="text/javascript"> 
	
	  	function getParameterByName(name) {
	  	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	  	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	  	        results = regex.exec(location.search);
	  	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	  	}

		document.getElementById("searchbar").value = getParameterByName("searchVal");
		
		</script>
		
		<script type = "text/javascript">
		function getParameterByName(name) {
	  	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	  	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	  	        results = regex.exec(location.search);
	  	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	  	}
		
		var selectVal = getParameterByName("selectVal");
		
		if (selectVal == "영화예매") {
			document.getElementById("1").setAttribute('selected', 'selected');
		}else if(selectVal == "할인/신용카드") {
			document.getElementById("2").setAttribute('selected', 'selected');
		}else if(selectVal == "멤버십") {
			document.getElementById("3").setAttribute('selected', 'selected');
		}else if(selectVal == "영화관") {
			document.getElementById("4").setAttribute('selected', 'selected');
		}else if(selectVal == "홈페이지") {
			document.getElementById("5").setAttribute('selected', 'selected');
		}else if(selectVal == "기타") {
			document.getElementById("6").setAttribute('selected', 'selected');
		}
		
		
		</script>

</body>
</html>