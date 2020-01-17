<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#mar{margin-top: 10%; width: 500px; min-height: 484px;}
.btn-primary2 {background-color: #1F0DA8; border-color: #1F0DA8; color: #FFF; !important;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
<div class="container" id="mar">

	<div class="form-group">
          <form action="${pageContext.request.contextPath}/members/Memberlogin.me" method="post" id="login">
          
            <div class="form-group">
              <div class="input-group">
                <input type="text" class="form-control" id="loginid" name="id" placeholder="아이디" required>
              </div>
            </div>           
            
		    <div class="form-group">
		      <div class="input-group">
		        <input type="password" class="form-control" id="loginpwd" name="pwd" placeholder="비밀번호" required>
		      </div>
		    </div>       
          
		      <div class="form-group justify-content-center">
              	<button type="submit" class="btn btn-primary2" style="width:460px;">로그인</button>	
              </div>
		    
          </form>
	</div>
	
	<div class="form-group" align="center" id="findIdPw">
			<hr class="float-left" style="width: 460px;">
			<a href="${pageContext.request.contextPath}/members/userFind.me" class="text-dark">ID/PW 찾기</a>
			<span class="bar" aria-hidden="true">&nbsp;|&nbsp;</span>
 			<a href="${pageContext.request.contextPath}/members/SignUp.me" class="text-dark">회원가입</a>
				
	</div>
        
</div>	 		 	 
	<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>