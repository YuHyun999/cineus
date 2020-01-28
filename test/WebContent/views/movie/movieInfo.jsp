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
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	
	<!-- 갤러리 -->
	<link rel="stylesheet" type="text/css" href="${context}/css/gallery_style.css">
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
.info .row{
color:black;
    line-height: 30px;
    font-size:14px;
    /* letter-spacing: -1px; */
}
.info .row{
margin-bottom:40px;
/* border-top: 1px gray solid; */
}	
.larger{
	font-size:16px;
	font-weight:bold;
}
#btn_go_to_list, #btn_reserve{
padding : 10px 10px;
}
#btn_go_to_list{
margin-right: 10px;
}
#btn_reserve{
}
#container-fluid{
	max-width:1100px;
	padding-left: 0;
	padding-right: 0;
}
	</style>
  
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
	<script>
		$("#menu2 *").css("color","#111").css("borderColor","#111");
		$("#menu2 .btn_menu_all").css("backgroundColor","#fff").css("borderColor","#111");
	</script>

 <br><br><br>
 
 <div class="container-fluid" id="container-fluid">
	<div class="container info">
		<div class="row">
	<!-- 영화 상세정보 보여주기 -->
			<div class="col col-md-4" style="padding-left:0">
				<%-- <img src="${context}/images/movie/${m.movie_ID}.jpg" id="img_info" alt=""  data-toggle="lightbox">
				<span>포스터 크게보기</span>  보류--%>
				<%-- <a href="#" onclick="image_popup(${m.movie_ID})"> --%>
   				 	<img src="${context}/images/movie/${m.movie_ID}.jpg" class="img-fluid">
				<!-- </a> -->
			</div>
			<div class="col col-md-8" style="padding-right:0">
				<h3>${m.title}</h3>
				${m.title_en}
				<hr>
				<div class="row" >
					<div class="col col-md-8">
							제작연도 : ${m.product_year}년<br>
							러닝타임 : ${m.show_time}분<br>
							개봉일 : ${m.start_date}<br>
						<c:if test="${m.end_date ne null}">
							상영종료일 : ${m.end_date}
						</c:if>
					</div>
					<div class="col col-md-4">
						<button class="btn btn-primary2 col-sm" id="btn_reserve">예매하기</button>
					</div> 
				</div>
				<hr style="margin-top:200px">
				<div class="row" >
					<div class="col col-md-6">
					</div>
					<div class="col col-md-3">
						<button class="btn btn-outline-dark btn-block" id="btn_like" ><i class="fa fa-heart"></i>
							<span id="num_like">${m_like}</span>
						</button>
					</div>
					<div class="col col-md-3">
						<button class="btn btn-outline-dark btn-block" id="btn_schedule" >
							상영시간표
						</button>	
					</div>
				</div>
			</div> <!-- 오른쪽 col 끝 -->
		</div> <!-- row끝 -->
		
		<div class="row">
			<span class="larger">줄거리</span>
			<br>
			${m.plot}
		</div>
	<c:if test="${m.trailer ne null}">
		<div class="row" >
			<span class="larger">동영상</span>
		</div>
		<div class="row">
			<iframe src="${m.trailer}" frameborder='no' scrolling='no' marginwidth='0' marginheight='0' WIDTH='544' HEIGHT='306' allow='autoplay' allowfullscreen ></iframe>
		</div>
	</c:if>
	
		<div class="row" id="row_for_images">
			<span class="larger">사진</span>
		</div>
		<div class="row">
			<div id="div_for_images"></div>
		</div>
		<br><br><br><br><br><br><br>
	</div> <!-- container 끝 -->
	
</div> <!-- .container-fluid 끝 -->


<!-- ------------------내용 끝------------------ -->





<%-- <%
String referer = (String)request.getHeader("REFERER");
%> --%>


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
				}
				else{ 
				}
			}//success
		});  //ajax
	}
</script>


<script>
	<%-- $("#btn_go_to_list").on("click",function(){
		//history.back();  X
		location.href="<%=referer%>";
		
	}) --%>
	
	$("#btn_like").on("click",function(){
		//like 버튼 눌러졌을 때 숫자 업뎃
		var $this=$(this);
		var id="<%=(String)session.getAttribute("id")%>";
		//현재 표시되는 like 개수를 저장해둔다.
		var curr_val=parseInt($("#num_like").text());
		
		if(id!="null" && id!="undefined"){
			//alert("로그인 중입니다.");
			
			//on 상태이면 off 하고 off 상태이면 on 한다
			toggle_like("${m.movie_ID}",id);
			
			if($this.prop("ison")){ //on인 경우 off한다
				//like 개수 업데이트(-1)
				$("#num_like").text(curr_val-1);
				$this.removeProp("ison");
				$this.css("background-color","white").css("color","black"); //초기상태로 돌림
			}
			else{	//off인 경우 on한다
				//like 개수 업데이트(+1)
				$("#num_like").text(curr_val+1);
				
				$this.prop("ison",true);
				$this.css("background-color","#343a40").css("color","white"); //
			}
			
		}
		else{ 
			alert("보고싶어 버튼을 누르려면 먼저 로그인하세요.");
		return;
		}
	})
	
	$("#btn_schedule").on("click",function(){
		window.location.href = "${context}/schedule/getSchedule_movie.do?movie_ID=${m.movie_ID}";
	});
	
	$("#btn_reserve").on("click",function(){
		window.location.href = "${context}/schedule/getSchedule_movie.do?movie_ID=${m.movie_ID}";
	});
</script>




<!-- -------갤러리------- --> 
<script> 
	$.ajax({
		  url:'${context}/movie/getMoviePictures.do',
		  type:'post',
			data: {'path' : '/images/movie/${m.movie_ID}'},
			dataType: "json",
			error:function(jqXHR, textStatus, errorThrown){
				//alert(errorThrown);
				//영화에 사진이 없는 경우에 발생함
			},
		 	 success: function(data){
                $gallery=$("#div_for_images"); //이미지들을 display할 영역
                $("#row_for_images").append("&nbsp;&nbsp;<span style='font-size:16px'>"+data.length+" photos</span>");
                $gallery.append("<ul id='WS-LiSli' class='grid'>");
                $list=$("#WS-LiSli");
		 		 for(var i=0; i<data.length ; i++){
		 			$list.append("<li><img src='${context}/images/movie/${m.movie_ID}/"+data[i]+"'></li>");
		 		 }
		 		$gallery.append("</ul>");
		 	}
	});


</script>
<!-- -------갤러리 끝------- -->





 
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>