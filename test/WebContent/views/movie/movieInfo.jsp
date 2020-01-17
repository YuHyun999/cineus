<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>CINEUS</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	<link rel="stylesheet" type="text/css" href="${context}/css/card.css">
	
	<style>
		table{
			text-align: left;
		}
		td:nth-child(1) {
 			width:40%;
		}
		table img{
			width:90%;
			height:auto
		}
		
		.btn-primary2{
background-color: #1f0DA8;
color:white;
}
.btn-primary2:hover{
color:white;
}
body{
color:black;}	
		
		/* 로딩 뱅글뱅글 */
#loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; } 
  
#loading-image {  
 position: absolute;  
 top: 50%;  
 left: 50%; 
 z-index: 100; }
 /* 로딩 뱅글뱅글 끝*/
 
 table{
 color:black;}
#btn_go_to_list, #btn_reserve{
padding : 20px 20px;
}
#btn_go_to_list{
margin-right: 10px;
}
#btn_reserve{
}
	</style>
  
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->


 <br><br><br>
 
 <div class="container-fluid">

<!-- 로딩중 표시를 위한 소스 -->
<div id="loading"><img id="loading-image" src="${context}/images/loading.gif" alt="Loading..." /></div>
<script type="text/javascript">
$(window).on('load', function () {
	$('#loading').hide(); 
});
</script>
<!-- 로딩중 표시를 위한 소스 -->

	
	
	<div class="container">
		<div class="row">
	<!-- 영화 상세정보 보여주기 -->
			<table>
				<tr>
					<td><img src="${context}/images/movie/${m.movie_ID}.jpg" alt=""></td>
					<td class="align-top">
						<div style="border-bottom:solid 1px #555;padding-bottom:20px;">
							<h3>${m.title}</h3>
							${m.title_en}
						</div>
						<br>
						제작연도 : ${m.product_year}년<br>
						러닝타임 : ${m.show_time}분<br>
						개봉일 : ${m.start_date}<br>
						상영종료일 : 
						<c:if test="${m.end_date eq null}">
							미정
						</c:if>
						<c:if test="${m.end_date ne null}">
							${m.end_date}
						</c:if>
						<br><br>
						<div class="container">
							<div class="row" style="margin-bottom:40px;">
								<button class="btn btn-outline-dark " id="btn_like" ><i class="fa fa-heart"></i> 보고싶어
								</button><div data-toggle="tooltip" data-placement="bottom" title="${m_like}"></div>
							</div>
							
							<div class="row" style="margin-top:220px;">
								<button class="btn btn-dark col-sm" id="btn_go_to_list">목록으로 돌아가기</button>
								<button class="btn btn-primary2 col-sm" id="btn_reserve">예매하기</button>
							</div>
						</div>
					</td>
			</table>
		</div>
		<br>
	</div> <!-- container 끝 -->

</div> <!-- .container-fluid 끝 -->

<%
String referer = (String)request.getHeader("REFERER");
%>


<!-- 툴팁 항상 보이게 -->
 <script>
$(function () {
	$("[data-toggle='tooltip']").tooltip('show');
})
</script> 


<!-- 보고싶어 버튼 초기상태 -->
<!-- 보고싶어 on 상태라면 ison 속성을 붙여준다. -->
<c:if test="${m_like_ison eq true}">
	<script>
	$(function () {
		$("#btn_like").prop("ison",true);
		$("#btn_like").css("background-color","#343a40").css("color","white");
	})
	</script>
</c:if>
  <!-- 보고싶어 버튼 초기상태 끝 -->


<script>
	function toggle_like(m_id, c_id){
		/* alert("ajax 가기 전 값 확인 : "+m_id+", "+c_id); */
		$.ajax({
			url:'${context}/movie/movieLikeToggle.do',
			type:'post',
			data: {'m_id' : m_id, 'c_id':c_id},
			/* dataType:'json', */
			/* async: false, */
			error:function(jqXHR, textStatus, errorThrown){
				//alert("좋아요 토글 중 오류 발생");
				alert(errorThrown);
			},
			success:function(data){
				if(data==true){ //보고싶어 토글 성공
					//할거없다
				}
				else{ 
					//할거없다
				}
			}//success
		});  //ajax
	}
</script>


<script>
	$("#btn_go_to_list").on("click",function(){
		//history.back(); 이렇게 하면 만약 이 페이지에서 좋아요 취소를 해도
		//리스트에는 좋아요 된 상태로 보이게 된다(현재 상태가 반영되지 않은 페이지를 보여준다)
		
		location.href="<%=referer%>";
		//이제 잘 됨.
		
	})
	$("#btn_reserve").on("click",function(){
		alert("준비중입니다");
	})
	
	$("#btn_like").on("click",function(){
		//like 버튼 눌러졌을 때 숫자 업뎃
		var $this=$(this);
		var id="<%=(String)session.getAttribute("id")%>";
		//현재 표시되는 like 개수를 저장해둔다.
		var curr_val=parseInt($(".tooltip .tooltip-inner").text());
		//alert(curr_val);
		//alert(id);
		/* if(id!=null && id.length!=0){  이렇게 하면 안되는구나. */
		if(id!="null" && id!="undefined"){
			//alert("로그인 중입니다.");
			
			//do something
			//on 상태이면 off 하고 off 상태이면 on 한다
			toggle_like("${m.movie_ID}",id);
			//alert($this.css("color"));
			if($this.prop("ison")){ //on인 경우 off한다
				//like 개수 업데이트(-1)
				$(".tooltip .tooltip-inner").text(curr_val-1);
				$this.removeProp("ison");
				$this.css("background-color","white").css("color","black"); //초기상태로 돌림
			}
			else{	//off인 경우 on한다
				//like 개수 업데이트(+1)
				$(".tooltip .tooltip-inner").text(curr_val+1);
				$this.prop("ison",true);
				$this.css("background-color","#343a40").css("color","white"); //
			}
			
		}
		else{ 
			alert("보고싶어 버튼을 누르려면 먼저 로그인하세요.");
		return;
		}
	})
</script>
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>