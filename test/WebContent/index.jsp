<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">
body{font-size: 0}
</style>
  <title>CINEUS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">  
  
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
    <div class="owl-carousel hero-slide owl-style">
      	<div class="hero-2">
     		<a href="#"><img src="images/carousel/140877-1A78-477C-8AE2-2E15987C43E3.jpg"></a>
    	</div>
      	<div class="hero-2">
     		<a href="#"><img src="images/carousel/6E2DF4-578D-4E7A-B719-08057AFAF687.jpg"/></a>
    	</div>
    </div>
    
    

    <div class="site-section mt-5">
      <div class="container">
		영화 목록 들어가는 자리
       </div> <!-- container 끝 -->
    </div>

    <div class="hero-2" style="background-image: url('images/carousel/theater-1477670_1920.jpg');">
     <div class="container">
        <div class="row justify-content-center text-center align-items-center">
          <div class="col-md-8">
            <span class="sub-title">GRAND OPENING</span>
            <h4><span class="sub-title">2020. 2</span></h4>
            <h3><span class="sub-title">새롭게 시작하는 CINEUS를 만나보세요!</span></h3>
          </div>
        </div>
      </div>
    </div>

    <!-- <div class="site-section bg-light">
      <div class="container">
       
      </div>
    </div> -->
  

    <div class="site-section bg-light">
      <div class="container">
        <!-- <div class="row mb-5">
          <div class="col-12 section-title text-center mb-5">
            <h2 class="d-block"></h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi, perspiciatis!</p>
            <p><a href="#">View All Products <span class="icon-long-arrow-right"></span></a></p>
          </div>
        </div> -->
        <div class="row">
          <div class="col-lg-4 mb-4 mb-lg-0 col-md-6">
            <div class="post-entry-1">
              <h2 style="color:black;">공지사항</h2>
              <table class="table table-sm" style="font-size:16px;color:black;">
              	<tr>
              		<td>2020.1.22<br>[공지]씨네어스 공지사항</td>
              	</tr>
              	<tr>
              		<td>2020.1.22<br>[공지]씨네어스 공지사항</td>
              	</tr>
              	<tr>
              		<td>2020.1.22<br>[공지]씨네어스 공지사항</td>
              	</tr>
              	<tr>
              		<td>2020.1.22<br>[공지]씨네어스 공지사항</td>
              	</tr>
              </table>
            </div>
          </div>
          <div class="col-lg-4 mb-4 mb-lg-0 col-md-6">
            <div class="post-entry-1">
              <h2>메가찬스</h2>
            </div>
          </div>
          <div class="col-lg-4 mb-4 mb-lg-0 col-md-6">
            <div class="post-entry-1">
              <h2>고객센터</h2>
              <table class="table table-sm table-bordered" style="height:300px;font-size:16px;color:black;">
              	<tr>
              		<td style="width:50%;height:50%;"><i class="material-icons" style="font-size:60px;">
question_answer
</i>1:1문의</td>
              		<td style="width:50%;"><i class="material-icons" style="font-size:60px;"> 
group
</i>단체관람/대관문의</td>
              	</tr>
              	<tr>
              		<td style="width:50%;height:50%;">자주 묻는 질문</td>
              		<td>분실물 문의/접수</td>
              	</tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>