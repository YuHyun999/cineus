<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- bootstrap 4 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;box-sizing: border-box;}


.col-12, .col-1,.col-2,.col-6{
padding-left: 0px;
padding-right: 0px;
}

h3{
font-size:20px;
font-weight: 700;
/* line-height: 1.1; */
padding-top: 10px;
padding-bottom: 10px;
}

/* Style the tab */
.tab {
  float: left;
  border-left: 1px solid #ccc;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  background-color: #f1f1f1;
  /* width: 180px; */
  height: 400x;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 0 0 0 20px;
  width:100%;
  height:50px;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.1s;
  font-size: 14px;
  border-bottom: 1px solid #ccc;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
  position:relative;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}
/* .tab button.active::after {
	position: absolute;
	top:20px;
	right:18px;
    display: block;
    content: ">";
    font-size: 12px;
} */

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  /*width: 70%;*/
  border-left: none;
  height: 401px;
}
.depth2{
	background-color: #333;
	font-size: 14px;
}

.depth2 a:link {
  color: white;
}

/* visited link */
.depth2 a:visited {
  color: white;
}

/* mouse over link */
.depth2 a:hover {
  color: #ccc;
}

/* selected link */
.depth2 a:active {
  color: gold;
  text-decoration: underline;
}
.depth2 a.active {
  color: gold;
  text-decoration: underline;
}
.depth2 ul{
	margin-top: 15px;
	margin-bottom: 15px;
	margin-left: 5px;
}
.depth2 ul li{
	height: 33px;
	letter-spacing:0px;
	display: flex;
}

.depth2 ul li a{
	flex: 1;
}

/* #depth3 = .map */
.depth3{
  float: left;
  padding: 0 0 0 0;
  border: 1px solid #ccc;
  border-left: none;
  height: 401px;
	background-color: #eee;
}
 
 #page-title{
 font-size: 1.7em;
 color : black;
 text-align: center;
 margin: 1em;
 }
 .container-fluid {
   max-width:1210px;
}
#map, #g1, .tab.depth1{
padding:0 0;
}

</style>



<!-- ------------------------------------------------------------- -->
	<link rel="stylesheet" type="text/css" href="${context}/css/common.css">
	
	
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
<br><br><br>

<!--  jquery-->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>

<!-- 구글맵 사용을 위한 코드 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBA3RfOIQXYW9-eXsvqAMeM5MxUOdXQxJw"></script>
<script>
var map;
function initialize() {
}
</script>
<!-- 구글맵 사용을 위한 코드 -->


 <div class="container-fluid">
 	<!-- 메뉴  -->
	<!--< jsp:include page="/views/common/menu.jsp" />-->
	<!-- 메뉴 끝 -->

	<div id="page-title"><h3>영화관 선택</h3></div>
	<!-- <p>Click on the buttons inside the tabbed menu:</p> -->
	
	
	<div class="all col-12 container "> <!-- 네모 영역 전체를 감싸는 div -->
	
		<!-- ---------------지역 선택------------------------- -->
		<div class="tab depth1 col-2 col-md-2">
		  <button class="tablinks" onclick="openCity(event, 'g1')" id="defaultOpen">서울</button>
		  <button class="tablinks" onclick="openCity(event, 'g2')">경기</button>
		  <button class="tablinks" onclick="openCity(event, 'g3')">인천</button>
		  <button class="tablinks" onclick="openCity(event, 'g4')">대전/충청/세종</button>
		  <button class="tablinks" onclick="openCity(event, 'g5')">부산/대구/경상</button>
		  <button class="tablinks" onclick="openCity(event, 'g6')">광주/전라</button>
		  <button class="tablinks" onclick="openCity(event, 'g7')">강원</button>
		  <button class="tablinks" onclick="openCity(event, 'g8')">제주</button>
		</div>
		
		
		<!-- ---------------극장 선택------------------------- -->
		<div id="g1" class="tabcontent depth2 col-2 col-md-3">
		  <!-- <h3>서울</h3> -->
		  <ul class="list-unstyled row" > <!-- 18개 -->
		  	<li class="list-item col-6 "><a href="#">강남</a></li>
		  	<li class="list-item col-6 "><a href="#">강남대로(씨티)</a></li>
		  	<li class="list-item col-6"><a href="#">강동</a></li>
		  	<li class="list-item col-6"><a href="#">군자</a></li>
		  	<li class="list-item col-6"><a href="#">동대문</a></li>
		  	<li class="list-item col-6"><a href="#">마곡</a></li>
		  	<li class="list-item col-6"><a href="#">목동</a></li>
		  	<li class="list-item col-6"><a href="#">상봉</a></li>
		  	<li class="list-item col-6" style="letter-spacing:-1px;"><a href="#">상암월드컵경기장</a></li>
		  	<li class="list-item col-6"><a href="#">센트럴</a></li>
		  	<li class="list-item col-6"><a href="#">송파파크하비오</a></li>
		  	<li class="list-item col-6"><a href="#">신촌</a></li>
		  	<li class="list-item col-6"><a href="#">은평</a></li>
		  	<li class="list-item col-6"><a href="#">이수</a></li>
		  	<li class="list-item col-6"><a href="#">창동</a></li>
		  	<li class="list-item col-6"><a href="#">코엑스</a></li>
		  	<li class="list-item col-6"><a href="#">화곡</a></li>
		  	<li class="list-item col-6"><a href="#">ARTNINE</a></li>
		  </ul>
		</div>
		
		<div id="g2"  class="tabcontent depth2 col-2 col-md-3">
		  <!-- <h3>경기</h3> -->
		   <ul class="list-unstyled row"> <!-- 21개 -->
			<li class="list-item col-6 "><a href="#">김포</a></li>
			<li class="list-item col-6 "><a href="#">남양주</a></li>
			<li class="list-item col-6 "><a href="#">동탄</a></li>
		 	<li class="list-item col-6 "><a href="#">백석</a></li>
			<li class="list-item col-6 "><a href="#">별내</a></li>
			<li class="list-item col-6 "><a href="#">분당</a></li>
			<li class="list-item col-6 "><a href="#">수원</a></li>
			<li class="list-item col-6 "><a href="#">수원남문</a></li>
		 	<li class="list-item col-6 "><a href="#">시흥배곧</a></li>
		 	<li class="list-item col-6 "><a href="#">안산중앙</a></li>
			<li class="list-item col-6 "><a href="#">양주</a></li>
			<li class="list-item col-6 "><a href="#">영통</a></li>
			<li class="list-item col-6 "><a href="#">의정부민락</a></li>
			<li class="list-item col-6 "><a href="#">일산</a></li>
			<li class="list-item col-6 "><a href="#">일산벨라시타</a></li>
			<li class="list-item col-6 "><a href="#">킨텍스</a></li>
			<li class="list-item col-6 "><a href="#">파주금촌</a></li>
			<li class="list-item col-6 "><a href="#">파주운정</a></li>
			<li class="list-item col-6 "><a href="#">파주출판도시</a></li>
			<li class="list-item col-6 "><a href="#">평택</a></li>
			<li class="list-item col-6 "><a href="#">하남스타필드</a></li>
		  </ul>
		</div>
		
		<div id="g3"  class="tabcontent depth2 col-2 col-md-3">
		  <!-- <h3>인천</h3> -->
		  <ul class="list-unstyled row"> <!-- 4개 -->
		 	 <li class="list-item col-6 "><a href="#">검단</a></li>
		  	<li class="list-item col-6 "><a href="#">송도</a></li>
		  	<li class="list-item col-6 "><a href="#">인천논현</a></li>
		  	<li class="list-item col-6 "><a href="#">청라</a></li>
		  </ul>
		</div>
		
		<div id="g4"  class="tabcontent depth2 col-2 col-md-3">
		  <!-- <h3>대전/충청/세종</h3> -->
		  <ul class="list-unstyled row"> <!-- 7개 -->
		  	<li class="list-item col-6 "><a href="#">공주</a></li>
		  	<li class="list-item col-6 "><a href="#">대전</a></li>
		  	<li class="list-item col-6 "><a href="#">세종</a></li>
		  	<li class="list-item col-6 "><a href="#">제천</a></li>
		  	<li class="list-item col-6 "><a href="#">진천</a></li>
		  	<li class="list-item col-6 "><a href="#">천안</a></li>
		  	<li class="list-item col-6 "><a href="#">충주</a></li>
		  </ul>
		</div>
		
		<div id="g5"  class="tabcontent depth2 col-2 col-md-3">
		  <!-- <h3>부산/대구/경상</h3> -->
		  <ul class="list-unstyled row"> <!-- 16개 -->
		  	<li class="list-item col-6 "><a href="#">거창</a></li>
		  	<li class="list-item col-6 "><a href="#">경산하양</a></li>
		  	<li class="list-item col-6 "><a href="#">경주</a></li>
		  	<li class="list-item col-6 "><a href="#">구미</a></li>
		  	<li class="list-item col-6 "><a href="#">김천</a></li>
		  	<li class="list-item col-6 "><a href="#">덕천</a></li>
		  	<li class="list-item col-6 "><a href="#">동대구</a></li>
		  	<li class="list-item col-6 "><a href="#">문경</a></li>
		  	<li class="list-item col-6 "><a href="#">부산극장</a></li>
		  	<li class="list-item col-6 "><a href="#">부산대</a></li>
		  	<li class="list-item col-6 "><a href="#">북대구(칠곡)</a></li>
		  	<li class="list-item col-6 "><a href="#">사천</a></li>
		  	<li class="list-item col-6 "><a href="#">양산</a></li>
		  	<li class="list-item col-6 "><a href="#">울산</a></li>
		  	<li class="list-item col-6 "><a href="#">창원</a></li>
		  	<li class="list-item col-6 "><a href="#">해운대(장산)</a></li>
		  </ul>
		</div>
		
		<div id="g6"  class="tabcontent depth2 col-2 col-md-3">
		  <!-- <h3>광주/전라</h3> -->
		  <ul class="list-unstyled row"> <!-- 11개 -->
		  	<li class="list-item col-6 "><a href="#">광주상무</a></li>
		  	<li class="list-item col-6 "><a href="#">광주하남</a></li>
		  	<li class="list-item col-6 "><a href="#">남원</a></li>
		  	<li class="list-item col-6 "><a href="#">목포</a></li>
		  	<li class="list-item col-6 "><a href="#">목포하당(포르모)</a></li>
		  	<li class="list-item col-6 "><a href="#">송천</a></li>
		  	<li class="list-item col-6 "><a href="#">순천</a></li>
		  	<li class="list-item col-6 "><a href="#">여수</a></li>
		  	<li class="list-item col-6 "><a href="#">전대(광주)</a></li>
		  	<li class="list-item col-6 "><a href="#">전주(객사)</a></li>
		  	<li class="list-item col-6 "><a href="#">첨단</a></li>
		  </ul>
		</div>
		
		<div id="g7"  class="tabcontent depth2 col-2 col-md-3">
		  <!-- <h3>강원</h3> -->
		  <ul class="list-unstyled row"> <!-- 4개 -->
		  	 <li class="list-item col-6 "><a href="#">남춘천</a></li>
		  	<li class="list-item col-6 "><a href="#">속초</a></li>
		  	<li class="list-item col-6 "><a href="#">원주</a></li>
		  	<li class="list-item col-6 "><a href="#">원주센트럴</a></li>
		  </ul>
		</div>
		
		<div id="g8"  class="tabcontent depth2 col-2 col-md-3">
		  <!-- <h3>제주</h3> -->
		  <ul class="list-unstyled row"> <!-- 1개 -->
		  	<li class="list-item col-6 "><a href="#">제주</a></li>
		  </ul>
		</div>
		
		<!-- ---------------지도------------------------- -->
		<div id="map" class="depth3 col-8 col-md-7">
			<div id="map-canvas" style="height:100%; width:100%">
			</div>
		</div>
		
	</div> <!-- .all 끝 -->
</div><!-- container-fluid 끝 -->
<!-- ------------------------------------------------------------- -->

<!-- 극장 하나를 보여준다. -->
<c:forEach var="t" items="${list}" varStatus="loop">
	<script>
		$("li.list-item").eq("${loop.index}").on("click",function(){
			var name="${t.name}";
			var address="${t.address}";
			var x="${t.x}";
			var y="${t.y}";
			
			var index="${loop.index}";
			
			$("li.list-item a").removeClass("active");
			$(this).find("a").addClass("active");
			
			//console.log(index+" "+name+" "+address+" "+x+" "+y); /* 확인용 */
			
			//마커 생성하기
			var latlng=new google.maps.LatLng(y, x);
			var mapOptions = {
				 zoom: 18, /* 1~21까지 있고 커질수록 상세해짐 */
				 center: latlng
			};
			map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
			
 			var marker= new google.maps.Marker({
	               position: latlng, // 마커가 위치할 위도와 경도(변수)
	               map: map,
	               title: name, // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
	               snippet: address
	        });
 			 var contentString = '<div id="content">'+
             '<div id="siteNotice">'+
             '</div>'+
             '<h4 style="font-size:1.4em;font-weight:bold">'+name+'</h4>'+
             '<div id="bodyContent">'+
             '<p><b>주소 : </b>'+address+'</p>'+
             '</div>'+
             '</div>';

        	 var infowindow = new google.maps.InfoWindow({
         	  content: contentString
        	 });
        	 infowindow.open(map, marker);
        	 
			 google.maps.event.addDomListener(window, 'load', initialize);
		}); /* mouseenter 끝 */
	</script>
</c:forEach>



<script>

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}; 

function getTheatersListByGroup(groupNum){ /* groupNum은 1~8 */
 		$.ajax({
 			url:getContextPath()+'/theater/getTheatersListByGroup.do',
			type:'POST',
			data:{'groupNum' : groupNum},
			 async: true,
			dataType:'json',
			error:function(){
				alert("영화관 오류", "영화관 가져오는 중 에러발생");
			},
			success:function(data){
				//get cetner
				var center_x=0;
				var center_y=0;
				for(var i=0 ; i<data.length ;i++){
					center_x+=data[i].x;
					center_y+=data[i].y;
				}
				center_x/=data.length;
				center_y/=data.length;
				
				var map;

				// The JSON data
				var json = data;
				  
				//지역마다 면적이 달라서 zoom을 조금씩 다르게 준다.
				var z=10; //default value
				if(groupNum==1) z=10; 
				else if(groupNum==2) z=8; 
				else if(groupNum==3) z=10; 
				else if(groupNum==4) z=8; 
				else if(groupNum==5) z=7; 
				else if(groupNum==6) z=8; 
				else if(groupNum==7) z=8; 
				else if(groupNum==8) z=9; 
				
				  // Giving the map som options
				  var mapOptions = {
				    zoom: z,
				    center: new google.maps.LatLng(center_y, center_x)
				  };
				  
				  // Creating the map
				  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
				  
				  
				  // Looping through all the entries from the JSON data
				  for(var i = 0; i < json.length; i++) {
				    
					    // Current object
					    var obj = json[i];
	
					    // Adding a new marker for the object
					    var marker = new google.maps.Marker({
					    	  position: new google.maps.LatLng(obj.y,obj.x),
					   		  map: map,
					    	  title: obj.name // this works, giving the marker a title with the correct title
					    });
					    
				
					    //공백 
					   	marker.addListener('click', function(evt) {
					   		var t=this.getTitle();
						    var ret = t.split(" ");
						    var str1 = ret[0];
					   		//이름으로 찾기
					      	// $('li:contains('+str1+')').trigger("click"); 부정확. 
					      	// 예를 들어 원주를 클릭하는데 자꾸 원주센트럴로 감.
						    $('li.list-item').filter(function(){ 
						    	return $(this).text() === str1;}).trigger("click");
					    });
				  } // end for
				  
			}//success func
		});  
}




/* 지역 버튼에 마우스 클릭했을때 호출되는 함수 */

function openCity(evt, groupNum) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent"); // .tabcontent 애들을 다 불러와서
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";		// 전부 안보이게 하고
  }
  tablinks = document.getElementsByClassName("tablinks");	// .tablinks 애들(도시이름 버튼)을 다 불러와서
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", ""); //active인 애를 해제한 다음
  }
  document.getElementById(groupNum).style.display = "block"; // id가 groupNum인 애들을 block설정하고???
  if(evt!=undefined){ // 이 경우는 처음에 로딩될 때 발생함. #defaultOpen에 onmouseover를 trigger 할 때
  	evt.currentTarget.className += " active";			// 지금 클릭상태인 애를 active 클래스 붙여준다.
  }
  else{
	  document.getElementById("defaultOpen").className+=" active";
  }
  
  /* 현재 선택된 극장이 있다면(active, 노랑색으로 표시됨)
  모두 해제한다. */
  $("li.list-item a").removeClass("active");
  
  /* 지역 지도(해당 지역의 극장이 모두 표시됨)를 보여준다. */
  /* 이 부분은 어쩔 수 없이 ajax 써야 함 */
  var group_num=parseInt(groupNum.charAt(1)); 
      /* ㄴ g1, g2... 이렇게 된 걸 숫자 1,2,...로 바꿔줌 */
  getTheatersListByGroup(group_num);
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").onclick();
</script>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html> 
