<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div style = "width:850px;margin:0 auto;">
	<div style="color: #1F0DA8;">
		<h2><a href="#menu1" id="no1" class="meun1" title="�ó׾ �Ұ� ����">�ó׾ �Ұ�</a>&nbsp;&nbsp; | &nbsp;&nbsp;
		<a href="#menu2" id="no2" class="meun2" title="ã�ƿ��ô� ��">ã�ƿ��ô� ��</a></h2>
	</div>
<div class="section no1" id="menu1" tabindex="0">
	<h3>�ó׾ ����</h3>
	
	<div>
		<ul>
			<li>�̼� (Mission)</li>
		</ul>
		<img alt="#" src="../images/png1.png">
	
	</div>
<div style="height: 280px">
		<div style="float:left;">
			<ul>
				<li>�ٽɰ�ġ (Core Value)</li>
			</ul>
			<img alt="#" src="../images/png2.png">
			
		</div> <br>
		
		<div style="width:420px;float:left;">
			<ul>
				<li>Brand Name</li>
			</ul>
			<b>Brand Name</b>
			'CINEUS(�ó׾)'�� '�ó׸��� �츮�� ���ϴ� CINE�� US�� ��������,
			��� ������ �پ��ϰ� ���� ����Ʈ�� ���� ������ �����ϰ��� �ϴ� �ǹ̰� ��� �ֽ��ϴ�.
			
			<b>BI(Brand Identity)</b>
			2020�� ���Ӱ� ������ �ó׾�� ���ο� ����� ��Ÿ�½��ϴ�.
		</div>
	</div>
</div>	
<div class="section no2" id="menu2" tabindex="0">
	<h3>ã�ƿ��ô� ��</h3>
	<!-- �̹��� ������ ǥ���� div �Դϴ� -->
	
	<div id="staticMap" style="width:600px;height:350px;"></div>    
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8261ba87cb02aa933a61f15c5acf052d"></script>
	<script>    
	// �̹��� ������ ǥ���� ��Ŀ�Դϴ�
	// �̹��� ������ ǥ���� ��Ŀ�� �Ʒ��� ���� �迭�� �־��ָ� �������� ��Ŀ�� ǥ���� �� �ֽ��ϴ� 
	var markers = [
	    {
	        position: new kakao.maps.LatLng(37.541900, 127.0450000), 
	        text: '�ó׾ 6���� �ֽ��ϴ�. ���� ���ּ���!' // text �ɼ��� �����ϸ� ��Ŀ ���� �ؽ�Ʈ�� �Բ� ǥ���� �� �ֽ��ϴ�     
	    }
	];

	var staticMapContainer  = document.getElementById('staticMap'), // �̹��� ������ ǥ���� div  
	    staticMapOption = { 
	        center: new kakao.maps.LatLng(37.541900, 127.0450000), // �̹��� ������ �߽���ǥ
	        level: 3, // �̹��� ������ Ȯ�� ����
	        marker: markers // �̹��� ������ ǥ���� ��Ŀ 
	    };    

	// �̹��� ������ �����մϴ�
	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	</script>
	
</div>
</div>		
</body>
</html>


