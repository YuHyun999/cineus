<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#mar{margin-top: 28px; width: 970px; margin: 0 auto; overflow-x: auto;}
.btn-primary2 {background-color: #1F0DA8; border-color: #1F0DA8; color: #FFF; !important;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID/PW 찾기</title>
	<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	<!-- 헤더가 들어가는 곳 -->
    <!-- </head>
		 <body> -->
<div class="container" id="mar">
	<div style="margin: 70px auto; position: relative;">
		<div style="color: #666; font-size: 20px;" class="font-weight-bold">아이디
			/ 비밀번호 찾기</div>
		<div style="border: 1px solid #e1e1e1; padding: 25px 25px 25px 25px;">
			<p style="font-size: 13px;">
				아이핀을 이용하여 회원에 가입하신 경우에는 회사가 회원님의 주민등록번호를 보유하고 있지 않은 관계로, 아이핀 등록기관의
				실명확인 및 본인인증 서비스와 연계하여 아이디 및 패스워드 찾기 서비스가 제공되오니 참고하여 주시기 바랍니다. (실명확인
				및 본인인증서비스 제공 기관 : 나이스신용평가정보㈜)<br>본인인증 시 제공되는 정보는 해당 인증기관에서 직접
				수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.
			</p>
			<p style="font-size: 13px; margin-bottom: 0px;">
				* 이용안내 <span>고객센터 > 1:1</span>문의 또는 <span>ARS 1544-0070</span>
				(09:00~21:00)
			</p>
		</div>
	</div>
	<div>
		<div class="form-group float-left" style="width: 440px;">
			<div class="input-group">
				<div style="color: #666; font-size: 20px; margin-bottom: 15px;" class="font-weight-bold">아이디 찾기</div>
				<form action="" method="post">
					<div class="inputs">
						<label style="width: 133px;" class="text-dark">이름</label>
						<input type="text" style="width: 199px;" maxlength="30" required />
					</div>
					<div class="inputs">
						<label style="width: 133px;" class="text-dark">이메일</label>
						<input type="email" style="width: 199px;" maxlength="30" required />
					</div>
					<div>
						<input type="submit" class="float-right btn-primary2" value="확인">
					</div>
				</form>
			</div>
		</div>
		<div class="form-group float-right" style="width: 440px;">
			<div class="input-group">
				<div style="color: #666; font-size: 20px; margin-bottom: 15px;" class="font-weight-bold">비밀번호 찾기</div>
				<form action="" method="post">
					<div class="inputs">
						<label style="width: 133px;" class="text-dark">아이디</label>
						<input type="text" style="width: 199px;" maxlength="30" required />
					</div>
					<div class="inputs">
						<label style="width: 133px;" class="text-dark">이름</label>
						<input type="text" style="width: 199px;" maxlength="30" required />
					</div>
					<div class="inputs">
						<label style="width: 133px;" class="text-dark">이메일</label>
						<input type="email" style="width: 199px;" maxlength="30" required />
					</div>
					<div>
						<input type="submit" class="float-right btn-primary2" value="확인">
					</div>
				</form>
			</div>
		</div>
	</div>



</div>

<!-- 바텀 들어가는 곳 -->
	<jsp:include page="/inc/bottom.jsp"/>
	<!-- 바텀 들어가는 곳 -->
</body>
</html>