<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${context}/css/demo.css">
<link rel="stylesheet" href="${context}/css/navigation-icons.css">
<link rel="stylesheet" href="${context}/css/slicknav/slicknav.min.css">
<link href="${context}/css/fa_2_1.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<!-- ����� ���� �� -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- ����� ���� �� -->
    <!-- </head>
		 <body> -->

<br><br><br><br>
	<nav class="menu-navigation-icons">
    <a href="${context}/members/fa_1.me" class="menu-magenta" id="fa1"><i class="fa fa-user"></i><span>ȸ������</span></a>
    <a href="${context}/members/fa_2_1.me" class="menu-blue" id="fa2"><i class="fa fa-trophy"></i><span>����� Ȯ��</span></a>
    <a href="${context}/members/fa_3.me" class="menu-green" id="fa3"><i class="fa fa-ticket"></i><span>���� ���</span></a>
    <a href="${context}/members/fa_4.me" class="menu-yellow" id="fa4"><i class="fa fa-shopping-cart"></i><span>����� ���ų���</span></a>
    <a href="${context}/members/fa_5.me" class="menu-red" id="fa5"><i class="fa fa-video-camera"></i><span>���� �����丮</span></a>
    <a href="${context}/members/fa_6.me" class="menu-pink" id="fa6"><i class="fa fa-envelope-o"></i><span>���� ���� ����</span></a>
</nav>
	<!-- vip zone -->
	<div class="section no7 vipzone" id="fa_2" style="margin: 100px 500px;">
		<div class="w1" style="border:solid red;">
		 	<h2 style="color:#1f0da8">VIP ZONE</h2>
			 <div class="div_wrap">
			 
			 	<div class="active" id="tab1">
			 		<a href="${context}/members/fa_2_1.me" class="icon vip" data-toggle="tab" title="2019�� VIP ȸ���ȳ� ����">2019�� VIP ȸ���ȳ�</a>
			 	</div>
			 	
			 	<div id="tab2">
			 		<a href="${context}/members/fa_2_2.me" class="icon vip2" data-toggle="tab" title="2019�� VIP ���üҰ� ����">2019�� ���üҰ�</a>
			 	</div>
			 </div>
			 </div> 
			<div>
			 <h3 class="blind">2019�� VIP ȸ���ȳ�</h3>
			 <p class="help large mb0">VIPȸ�� ������ �� ���� �� ���� �޸� �� �� �ֽ��ϴ�</p>
		 		<button type="button" class="icon my_class" id="btn_my_class">
		 			���� ȸ����� Ȯ���ϱ�
		 		</button>
		 	</div>
		 </div>
		 <div class="tab-content">
		 	<div id="t1">
		 	
		 	<div id="tab" class="tab-pane active">
		 		
		 		<table class="data_table border v3" style="width: 100%; border: 1px solid #444444; border-collapse: collapse; ">
		 			<caption class="blind" style="">
		 				VIP ����: ����, ����, �ǹ�, ���, ���̾Ƹ��, �����Ⱓ, �ڰݱⰣ ���� ��������
		 			</caption>
		 			<colgroup style="border: 1px solid #444444;">
		 				<col width="28%">
		 				<col>
		 			</colgroup>
		 			<thead style="border: 1px solid #444444;">
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="col" style="border: 1px solid #444444;">����</th>
		 					<th class="last" scope="col" style="border: 1px solid #444444;">����</th>
		 				</tr>
		 			</thead>
		 			<tbody style="border: 1px solid #444444;">
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>�ǹ�</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018�� ���� �ٸ� ��ȭ 10�� �̻� ���� ����
		 					</td>
		 				</tr>
		 					
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>���</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018�� ���� �ٸ� ��ȭ 20�� �̻� ���� ����
		 					</td>
		 				</tr>
		 				
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>���̾Ƹ��</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018�� ���� �ٸ� ��ȭ 30�� �̻� ���� ����
		 					</td>
		 				</tr>
		 				
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>���� �Ⱓ</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2018�� 1�� 1�� ~ 2018�� 12�� 31�� (���� ����)
		 					</td>
		 					
		 				</tr>
		 				
		 				<tr style="border: 1px solid #444444; ">
		 					<th scope="row">
		 						<strong>�ڰ� �Ⱓ</strong>
		 					</th>
		 					<td class="last" style="border: 1px solid #444444;">
		 						2019�� 3�� 5�� ~ 2020�� 2�� 29��(���� ����)
		 					</td>
		 				</tr>
		 			</tbody>
		 		</table>
		 		<p class="help">���� �ٸ� ��ȭ ����: ���� �Ⱓ �� ���� ������ ���� �ٸ� ��ȭ ���<br> (���� ��ȭ�� 1������ ����)</p>
		 	</div>
		 	</div> <!-- t1 �� -->
		 </div>
	</div>
	<!-- ���� ���� �� -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- ���� ���� �� -->	
</body>
</html>