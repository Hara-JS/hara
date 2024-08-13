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
		[1] 앱 키
			REST API 키 		: cdf54afc64e78fc7ad0f945f417a57d1
			JavaScript 키 	: a71f5de3576f93318b93a81bd91aac23
		[2] Web 플랫폼 등록
			http://localhost:8989
		[3] Redirect URI 등록
			http://localhost:8989/jsp_07_api_session/bookshop/member/kakaoLoginPro.jsp
	 --%>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous">
</script>

<script>
  Kakao.init('a71f5de3576f93318b93a81bd91aac23'); // 사용하려는 앱의 JavaScript 키 입력
</script>


	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<br><br><br><br>

	<div align="center">
		<table border="1">
			<tr>
				<td><h2>카카오 로그인</h2></td>
			</tr>
			<tr>
				<td>
				<a id="kakao-login-btn" href="javascript:loginWithKakao()">
				  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
				    alt="카카오 로그인 버튼" />
				</a>
				</td>
			</tr>
		</table>
	</div>
	

<script>
  function loginWithKakao() {
	    Kakao.Auth.authorize({
	      redirectUri: 'http://localhost:8989/jsp_06_session_project/bookshop/member/kakaoLoginPro.jsp',
	    }); 
  }
</script>

</body>
</html>










