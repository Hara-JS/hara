<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- ajax 때문에 작성 --%>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	

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

	<script>
	
	function logoutPro() {
		
		console.log('logoutpro');
		<% session.removeAttribute("log"); %>
		
		let client_id = '24fee39b4274ba04ee223c549ace04bc';
		let logout_redirect_uri = 'http://localhost:8989/jsp_05_api_basic/_04_kakaologin/index.jsp';
		
		
		let str = '';
		str += 'https://kauth.kakao.com/oauth/logout?client_id=';
		str += client_id;
		str += '&logout_redirect_uri=';
		str += logout_redirect_uri;
		
		window.location.href = str;
		
		
		
		
	}	
	
	logoutPro();
	
	</script>
</body>
</html>