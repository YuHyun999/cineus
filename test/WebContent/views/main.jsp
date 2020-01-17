<%@page import="java.time.ZoneId"%>
<%@page import="movie.MovieDTO"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>CINEUS</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="${context}/js/moment.js"></script>
	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${context}/css/card.css">
<style>
 .container-fluid {
   max-width:1110px;
}
#more_list_div{
padding-left: 0px;
padding-right: 0px;

}
#more_list_btn{
border-radius: 0px;
padding-top: 15px;
padding-bottom: 15px;
}
.btn-primary2{
background-color: #1f0DA8;
color:white;
}
.btn-primary2:hover{
color:white;
}
#temp_menu .navbar{
	height:69px;
}
#temp_menu .navbar a{
	color : #007bff;
	font-weight:500;
}
/* 로딩 뱅글뱅글 */
#loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; } 
  
#loading-image {  
 position: absolute;  
 top: 50%;  
 left: 50%; 
 z-index: 100; }
 /* 로딩 뱅글뱅글 끝*/
 
</style>

	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->

<br><br><br>
 
 
 <div class="container-fluid">
	
	
		<!-- 서브메뉴바// -->
<div id="temp_menu">
	<nav class="navbar navbar-expand-sm bg-light">
	  <ul class="navbar-nav" id="condition">
	    <li class="nav-item">
	      <a class="nav-link" href="javascript:void(0);">최신개봉작</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="javascript:void(0);">상영예정작</a>
	    </li>
	  </ul>&nbsp;&nbsp;|&nbsp;&nbsp; 
	  <ul class="navbar-nav" id="option">
	    <li class="nav-item">
	      <a class="nav-link" href="javascript:void(0);">개봉일순</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="javascript:void(0);">가나다순</a>
	    </li>
	  </ul>
	</nav>
</div>	
	
	
	<br>
	
	<form id="movieListForm" action="${context}/movie/getMoviesList.do" method="post">
		<input type="hidden" name="h_condition" id="h_condition">
		<input type="hidden" name="h_option" id="h_option">
		<input type="hidden" name="h_cnt1" id="h_cnt1">
		<input type="hidden" name="h_cnt2" id="h_cnt2">
		
	<!-- 영화 목록 보여주기 -->
	<!-- details card section starts from here -->
			<section class="details-card">
				<c:choose>
					<c:when test="${empty list}">
						<h6><strong>현재 상영중인 영화가 없습니다.</strong></h6>
					</c:when>
				<c:otherwise>
					<%-- <div class="container">
						<h6><strong>현재 ${list.size()}편의 영화가 상영중입니다.</strong></h6>
					</div> --%>
				    <div class="container">
				        <!-- <div class="row"> -->
				        <!-- 최신영화 순으로 보여준다. -->
				        <c:forEach var="m" items="${list}" varStatus="loop"> 	
				        	<c:if test="${loop.index%4==0}">
				        		<div class="row">
				        	</c:if>
					            <div class="col-md-3">
					                <div class="card-content">
					                    <div class="card-img">
					                        <img src="${context}/images/movie/${m.movie_ID}.jpg" alt="">
					                        <span><h4>${loop.index+1}</h4></span>
					                    </div>
					                    <div class="card-desc">
					                        <div class="title">${m.title}</div>
					                        <div class="date">${m.start_date}</div>&nbsp;&nbsp;
					                        
					                        <script>
					                        	var start_date=$(".card-desc .date").text();
						                        var date = moment(start_date);
						                        var now = moment();
						                       /*  alert("date 와 now는 "+date+", "+now); */
						                        if (now > date) {
						                           // date is past
						                        	$(".card-desc .date").text("");
						                        } else {
						                           // date is future
						                           var duration = moment.duration(now.diff(date));
													var days = duration.asDays();		
						                           $(".card-desc .date").append("D-"+days);
						                        }
					                        </script>
					                        
					                        
					                        <div class="container btn-container">
					                        	<div class="row">
					                       			<div class="col col-md-6">
					                        			<a class="btn" href="${context}/movie/getMovieInfo.do?movie_ID=${m.movie_ID}">상세정보</a>
					                        		</div>
					                        		<div class="col col-md-6">
					                            		<a class="btn" href="#">예매하기</a>
					                            	</div> 
					                            </div>
					                         </div>
					                    </div>
					                </div><!-- card-content 끝 -->
					            </div> <!-- col 끝 -->
					        <c:if test="${loop.index%4==3}">
				        		</div> <!-- div for a row -->
				        	</c:if>
				         </c:forEach>
				        <!-- </div> --> <!-- row 끝 -->
				    </div> <!-- container 끝 -->
				 </c:otherwise>
				</c:choose>
			</section>
			<!-- details card section starts from here -->
				<!-- 영화 목록 보여주기 끝 -->
			
			<!-- 더보기 버튼 -->
			<div class="container" id="more_list_div">
				<input type="button" class="btn btn-primary2 btn-block" id="more_list_btn" value="더보기 + ">
			</div>
	</form> <!-- #movieListForm 끝 -->
	
</div> <!-- .container-fluid 끝 -->
<br><br><br><br>


<!-- 카드에 표시되는 내용 수정 -->
<script>
var limit=12;
$(".card-content .title").each(function(){
	if($(this).text().length>=limit){
		$(this).text($(this).text().substr(0,limit)+"...");
	}
});

/* $(".card-content .date").each(function(){
	if($(this).text().length>=limit){
		$(this).text($(this).text().substr(0,limit)+"...");
	}
}); */
</script>




<script>
	//더보기 버튼을 숨겨야 할 땐 숨긴다.
	if($(".card-content").length%12!=0){
		$("#more_list_btn").hide();
	};
	
	
	/* 더보기 버튼을 눌렀을 때 */
	$("#more_list_btn").on("click",function(){
		/* alert("클릭!"); */
		/* 12개(3줄)씩 더 보여준다 */
		var curr_list_len="${list.size()}";
	});
</script>



	<!-- 메뉴 초기값 설정 -->
	<!-- ///////////////// -->
	<c:if test="${list_condition!=2}"> 
		<script>
			$("#condition li a").eq(0).css("font-weight","bold");
			$("#h_condition").val("1");
		</script>
	</c:if>
	<c:if test="${list_condition==2}">
		<script>
			$("#condition li a").eq(1).css("font-weight","bold");
			$("#h_condition").val("2");
		</script>
	</c:if>
	<!-- ///////////////// -->
	<c:if test="${list_option!=2}"> 
		<script>
			$("#option li a").eq(0).css("font-weight","bold");
			$("#h_option").val("1");
		</script>
	</c:if>
	<c:if test="${list_option==2}">
		<script>
			$("#option li a").eq(1).css("font-weight","bold");
			$("#h_option").val("2");
		</script>
	</c:if>
	
	
	
<script>	
	/* 메뉴를 눌렀을 때 */
	$("#condition a").eq(0).on("click",function(){
		$("#h_condition").val("1");
		$("#movieListForm").submit();
	});
	$("#condition a").eq(1).on("click",function(){
		$("#h_condition").val("2");
		$("#movieListForm").submit();
	});
	$("#option a").eq(0).on("click",function(){
		$("#h_option").val("1");
		$("#movieListForm").submit();
	});
	$("#option a").eq(1).on("click",function(){
		$("#h_option").val("2");
		$("#movieListForm").submit();
	});
</script>

	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>