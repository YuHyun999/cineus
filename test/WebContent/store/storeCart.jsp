<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
%>    
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
		                    <thead>
		                        <tr>
		                            <th scope="col"><input type="checkbox"></th>
		                            <th scope="col">상품명</th>
		                            <th scope="col">판매금액</th>
		                            <th scope="col" class="text-center">수량</th>
		                            <th scope="col" class="text-right">구매금액</th>
		                            <th> </th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <tr>
		                            <td><img src="https://dummyimage.com/50x50/55595c/fff" /> </td>
		                            <td>Product Name Dada</td>
		                            <td>In stock</td>
		                            <td><input class="form-control" type="text" value="1" /></td>
		                            <td class="text-right">124,90 €</td>
		                            <td class="text-right"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button> </td>
		                        </tr>
		                        <tr>
		                            <td></td>
		                            <td></td>
		                            <td></td>
		                            <td></td>
		                            <td><strong>총 결제 예정 금액</strong></td>
		                            <td class="text-right"><strong>346,90 €</strong></td>
		                        </tr>
		                    </tbody>
		                </table>
		            </div>
		        </div>
		        <div class="col mb-2">
		            <div class="row">
		                <div class="col-sm-12 col-md-6 text-right">
		                    <button class="btn btn-lg btn-block btn-success text-uppercase">결제하기</button>
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