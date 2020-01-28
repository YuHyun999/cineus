<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="mbean" value="${requestScope.mbean}" />
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
	<div id="fa_1" tabindex="-1" class="sub" align="center">
			<div class="sub_bg"> <br><br>
				<div class="snb_area">
					<h1>
						<span>My Page</span>
					</h1>
				</div> 

				<div class="subcont null">
					<div class="subtitle">
						<div id="printBody">
							<p>${mbean.customer_name}</p>���� ȸ�������Դϴ�.
								<table class="tb02" summary="���̵�, �̸�, �̸���, ����ó, �ּ�, ȸ�������� ���� ������ �����ϴ� ǥ">
									<tbody>
											<tr>
												<th scope="row">���̵�</th>
												<td><p>${mbean.customer_id}</p></td>
											</tr>
											<tr>
												<th scope="row">�̸�</th>
												<td><p>${mbean.customer_name}</p></td>
											</tr>
											<tr>
												<th scope="row">�̸���</th>
												<td><p>${mbean.customer_email}</p></td>
											</tr>
											<tr>
												<th scope="row">����ó</th>
												<td><p>${mbean.customer_tel}</p></td>
											</tr>
											<tr>
												<th scope="row">�ּ�</th>
												<td><p>${mbean.customer_address}</p></td>
											</tr>
											<tr>
												<th scope="row">ȸ�����</th>
												<td><p></p></td>
											</tr>
											
									</tbody>
							</table>
						</div>
					</div>
					
				</div>
			</div>
			<br><br>
			<button>ȸ�� ���� ����</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button>ȸ�� ���� ����</button>	
			<br><br><br><br>
		
	</div>
	<!-- ���� ���� �� -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- ���� ���� �� -->	
</body>
</html>