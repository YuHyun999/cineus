<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%request.setCharacterEncoding("UTF-8");
%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<link href="https://fonts.googleapis.com/css?family=Cinzel:400,700|Montserrat:400,700|Roboto&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/icomoon/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
  <link href="${pageContext.request.contextPath}/css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300" >

  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
        
<div class="header-top">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-12 text-center">
            <a href="${pageContext.request.contextPath}/index.jsp" class="site-logo">
              <img src="${pageContext.request.contextPath}/images/logo.png" alt="Image" class="img-fluid">
            </a>
          </div>
          <a href="#" class="mx-auto d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black"><span
                class="icon-menu h3"></span></a>
        </div>
      </div>
    
      <div class="site-navbar py-2 js-sticky-header site-navbar-target d-none pl-0 d-lg-block" role="banner">

      <div class="container">
        <div class="d-flex align-items-center">
          
          <div class="mx-auto">
            <nav class="site-navigation position-relative text-left" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mx-auto d-none pl-0 d-lg-block border-none">
                <li><a href="${context}/movie/getMoviesList.do" class="nav-link text-left" style="padding: 0 30px;">영화</a></li>
                <li><a style="font-size: 26px;">|</a></li>
                <li><a href="#" class="nav-link text-left" style="padding: 0 30px;">예매</a></li>
                <li><a style="font-size: 26px;">|</a></li>
                <li><a href="${context}/theater/getTheatersList.do" class="nav-link text-left" style="padding: 0 30px;">영화관</a></li>
                <li><a style="font-size: 26px;">|</a></li>
                <li><a href="${context}/stores/storeList.do" class="nav-link text-left" style="padding: 0 30px;">스토어</a></li>
                <li><a style="font-size: 26px;">|</a></li>                                         
<%
	String id = (String)session.getAttribute("id");

	if(id == null){//세션값이 저장되어 있지 않은 경우 로그아웃된 상태
%>				
			<li><a href="${context}/members/login.me" class="nav-link text-left" style="padding: 0 30px;">로그인</a></li>					
<%		
	}else{//세션값이 저장되어 있는 경우(로그인 된 상태)
%>		
			<li><a href="" class="nav-link text-left" style="padding: 0 30px;">${id}님</a></li>
			<li><a href="${context}/members/logout.me" class="nav-link text-left" style="padding: 0 30px;">로그아웃</a></li>
<%		
	}
%>
            </ul>                                                                                                                                                                                                                                                                                         
           </nav>

          </div>
         
        </div>
      </div>

    </div>
    
    </div>