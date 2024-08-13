<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%-- ajax 때문에 작성 --%>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	
	<%-- Kako.Auth 전부 카카오 자바스크립트 SDK 이기 때문에 아래 두 스크립트 모두 두 페이지에서 필요함 --%>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js" 
	integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous">
	</script>
	
	<script>
		Kakao.init('bd77484aa437d72f10c2b4727744d8c9'); // 사용하려는 앱의 JavaScript 키 입력
	</script>
	
</head>
<body>
	<%
		String code = request.getParameter("code");
		System.out.println("code = " + code);
		
		session.setAttribute("code", code);
	%>
	인증코드 = <span id="code"><%= code %></span> <br />

	이름 = <span id="nickname"></span> <br />
	
	프로필 사진 = <img id="profileImage" width="100px">
	
	<a href="index.jsp">메인으로</a>
	
	<script>
	
		let access_token = '';
		
		function loginPro() {
			let access_code = document.querySelector("#code").innerText;
			
			$.ajax({
			    type : "POST"
			    , url : 'https://kauth.kakao.com/oauth/token'
			    , data : {
			        grant_type : 'authorization_code',
			        client_id : '24fee39b4274ba04ee223c549ace04bc',		// REST API 키
			        redirect_uri : 'http://localhost:8989/jsp_05_api_basic/_04_kakaologin/_sample_kakaoPro.jsp',
			        code : access_code
			    }
			    , success : function(response) {
			    	console.log('login success');
			    	
			    	
			        Kakao.Auth.setAccessToken(response.access_token);
			        access_token = response.access_token;
			        console.log(access_token);
			        
			    	<% 
			    		
			    		session.setAttribute("log", "test");
			    	%>
			        
		        	requestUserInfo();
			    }
			    ,error : function() {
					console.log('login error');
			    }
			});
		}
		
		function requestUserInfo() {
			
			$.ajax({
				type : "POST"
				, url : 'https://kapi.kakao.com/v2/user/me'
				, headers : {
					'Content-type': 'application/x-www-form-urlencoded;charset=utf-8'
					, 'Authorization' : 'Bearer ' + access_token
					, 'Accept' : 'applicaton/json'
				}
				, success : function(response) {
					console.log('userInfo success');
					
					let nickname = response.properties.nickname;
					document.querySelector("#nickname").innerText = nickname;
					
					let profileImage = response.properties.profile_image;
					document.querySelector("#profileImage").src = profileImage;
					
				}
				, error : function() {
					console.log('userInfo error');
				}
			});
		}
		
		loginPro();
		
	</script>
	
</body>
</html>