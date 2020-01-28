<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table>
		<h2>내 정보</h2> <input type="button" value="회원정보 수정하기" onclick="#">
		
		<div align="center">
			이름: <%=(String)session.getAttribute("name") %> <br>
			전화번호: <%=(String)session.getAttribute("ptel") %> <br>
			등급: <br>
		</div>
		<input type="button" value="회원 탈퇴하기" onclick="#"> <br><br><br>
		
		<div>
			<b>보고 싶은 영화</b> <br>
			본 영화
		</div>
	</table>
</body>
</html>