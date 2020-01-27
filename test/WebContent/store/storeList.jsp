<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<c:set var="storeList1" value="${requestScope.storeList1 }" />
<c:set var="storeList2" value="${requestScope.storeList2 }" />
<c:set var="storeList3" value="${requestScope.storeList3 }" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스토어</title>
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<!-- </head>
<body> -->

	<div class="container storeContainer" id="mar">
	
	<!-- 메뉴바// -->
	<nav class="navbar navbar-expand-sm bg-light">
	  <ul class="navbar-nav" id="storeTeb">
	    <li class="nav-item">
	      <a class="nav-link" href="javascript:void(0);"  majorCode="1">씨네티켓</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="javascript:void(0);"  majorCode="2">씨네찬스</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="javascript:void(0);" majorCode="3">씨네푸드</a>
	    </li>
	    <li>
	    	<a href="${contextPath }/stores/viewCart.do">장바구니 보기(삭제예정)</a>
	    </li>
	  </ul>
	</nav>
	
	<script type="text/javascript">
		$("#storeTeb>li>a").on("click",function(){//메뉴바 스크롤 이동시키기
			var majorCode = $(this).attr("majorCode");
			if(majorCode){
				$('html, body').animate({scrollTop : $("#storeTeb_"+majorCode).offset().top-70}, 400);
			}
		});
	</script>
	<!-- //메뉴바 -->
	<br>

		<div class="container">
			
			<h3 class="h3" id="storeTeb_1">씨네티켓</h3>
		    <div class="row">
<c:choose>
	<c:when test="${storeList1 == null }">
		<p>등록된 상품이 없습니다.</p>
	</c:when>
	<c:when test="${storeList1 != null }">
		<c:forEach var="store1" items="${storeList1 }">				        
	        <div class="col-md-3 col-sm-6">
	            <div class="product-grid">
	                <a href="${contextPath }/stores/viewStore.do?item_code=${store1.item_code}">
		                <div class="product-image">				                    
							<img class="pic-1" src="../images/store_images/${store1.item_image }">			                    
							<span class="product-new-label">BEST</span>
		                </div>
		              
		                <div class="product-content">
		                    <h3 class="title">${store1.item_name }</h3>
		                    <p>${store1.item_detail }</p>
		                    <div class="price">${store1.sale_price}
		                        <span>${store1.price }</span>
		                    </div>
		                </div>
	                </a>
	            </div>
	        </div>		       			    
		</c:forEach>
	</c:when>
</c:choose>		    
			</div>	
				    
			<h3 class="h3" id="storeTeb_2">씨네찬스</h3>
			<div class="row">
<c:choose>
	<c:when test="${storeList2 == null }">
		<p>등록된 상품이 없습니다.</p>
	</c:when>
	<c:when test="${storeList2 != null }">
		<c:forEach var="store2" items="${storeList2 }">				        
	        <div class="col-md-3 col-sm-6">
	            <div class="product-grid">
	                <a href="${contextPath }/stores/viewStore.do?item_code=${store2.item_code}">
		                <div class="product-image">			                    
							<img class="pic-1" src="../images/store_images/${store2.item_image }">				                    
		                </div>		              
		                <div class="product-content">
		                    <h3 class="title">${store2.item_name }</h3>
		                    <p>${store2.item_detail }</p>
		                    <div class="price">${store2.sale_price}
		                        <span>${store2.price }</span>
		                        <div>0개남음</div>
		                    </div>
		                </div>
	                </a>
	            </div>
	        </div>		       			    
		</c:forEach>
	</c:when>
</c:choose>
			</div>	

		    <h3 class="h3" id="storeTeb_3">씨네푸드</h3>
			<div class="row">
<c:choose>
	<c:when test="${storeList3 == null }">
		<p>등록된 상품이 없습니다.</p>
	</c:when>
	<c:when test="${storeList3 != null }">
		<c:forEach var="store3" items="${storeList3 }">			        
	        <div class="col-md-3 col-sm-6">
	            <div class="product-grid">
	                <a href="${contextPath }/stores/viewStore.do?item_code=${store3.item_code}">
		                <div class="product-image">				                    
		                        <img class="pic-1" src="../images/store_images/${store3.item_image }">				                    
		                    <span class="product-new-label">BEST</span>
		                </div>
		              
		                <div class="product-content">
		                    <h3 class="title">${store3.item_name }</h3>
		                    <p>${store3.item_detail }</p>
		                    <div class="price">${store3.sale_price}
		                        <span>${store3.price }</span>
		                    </div>
		                </div>
	                </a>
	            </div>
	        </div>		       			    
		</c:forEach>
	</c:when>
</c:choose>	
			</div>
        
		 	</div></div>
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>