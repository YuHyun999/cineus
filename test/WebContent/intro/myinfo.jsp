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
		<h2>�� ����</h2> <input type="button" value="ȸ������ �����ϱ�" onclick="#">
		
		<div align="center">
			�̸�: <%=(String)session.getAttribute("name") %> <br>
			��ȭ��ȣ: <%=(String)session.getAttribute("ptel") %> <br>
			���: <br>
		</div>
		<input type="button" value="ȸ�� Ż���ϱ�" onclick="#"> <br><br><br>
		
		<div>
			<b>���� ���� ��ȭ</b> <br>
			�� ��ȭ
		</div>
	</table>
</body>
</html>