<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<c:set var="cartList" value="${requestScope.cartList }"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"> 
   
    <!-- </head>
		 <body> -->
	<div class="container" id="mar">
	
		<div class="container mb-4">
		    <div class="row">
		        <div class="col-12">
		            <div class="table-responsive">
		                <table class="table table-striped">

<c:choose>
	<c:when test="${empty cartList}">
		<tr><td colspan="5">장바구니에 담긴 상품이 없습니다.</td></tr>
	</c:when>

	<c:otherwise>

							<thead>
		                        <tr>
		                        	<th scope="col"></th>
		                            <th scope="col">상품명</th>
		                            <th scope="col">판매금액</th>
		                            <th scope="col" class="text-center">수량</th>
		                            <th scope="col" class="text-right">구매금액</th>
		                        </tr>
		                    </thead>
		                    <tbody>
	
		<c:forEach var="cartList" items="${cartList }">
								<tr>
		                            <td><img src="../images/store_images/${cartList.item_image }" /> </td>
		                            <td>${cartList.item_name }</td>
		                            <td>${cartList.sale_price }</td>
		                            <td>
		                            	<input class="form-control" type="number" value="${cartList.cart_qty }" min="1" max="5" />
		                            	<button type="button">변경</button>
		                            </td>
		                            <td class="text-right total_price">
		                            	99999
		                            	<input type="text" class="total_price" value="9999">
		                            </td>
		                            <td class="text-right"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </td>
		                        </tr>
		</c:forEach>
								<tr>
		                            <td></td>
		                            <td></td>
		                            <td></td>
		                            <td></td>
		                            <td><strong>총 결제 예정 금액</strong></td>
		                            <td class="text-right"><strong>346,90 €</strong></td>
		                        </tr>
		                    </tbody>
	</c:otherwise>
</c:choose>		                        

		                </table>
		            </div>
		        </div>
		        <div class="col mb-2">
		            <div class="row">
		                <div class="col-sm-12 col-md-6 text-right">
		                    <button class="btn btn-lg btn-block btn-success text-uppercase" onclick="location.href='${contextPath }/stores/openPay.do'">구매하기</button>
		                </div>
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