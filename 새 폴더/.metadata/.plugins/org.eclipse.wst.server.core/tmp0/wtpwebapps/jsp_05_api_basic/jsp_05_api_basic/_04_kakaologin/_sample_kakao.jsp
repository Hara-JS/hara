<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
		앱 키
		REST API 키 		: 24fee39b4274ba04ee223c549ace04bc
		JavaScript 키	: bd77484aa437d72f10c2b4727744d8c9
	
	 --%>
 	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" 
	integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous">
	</script>

	<script>
		Kakao.init('bd77484aa437d72f10c2b4727744d8c9'); // 사용하려는 앱의 JavaScript 키 입력
	</script>

	<a id="kakao-login-btn" href="javascript:loginWithKakao()">
	  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼" />
	</a>
		
	<script>
		function loginWithKakao() {
			Kakao.Auth.authorize({
				redirectUri: 'http://localhost:8989/jsp_05_api_basic/_04_kakaologin/_sample_kakaoPro.jsp',
			});
		}
	</script>
	
	
</body>
</html>













