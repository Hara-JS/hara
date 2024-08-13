<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous">
</script>

<script>
  Kakao.init('a71f5de3576f93318b93a81bd91aac23'); // 사용하려는 앱의 JavaScript 키 입력
</script>  


	<%
		String code = request.getParameter("code");
		System.out.println(code);
	%>
	<input type="hidden" id="code" value="<%= code %>">

 <script>
 
 	let access_token = '';
 
	function name() {
		let access_code = document.querySelector("#code").value;
		console.log(access_code);
		
		$.ajax({
		    type : "POST"
		    , url : 'https://kauth.kakao.com/oauth/token'
		    , data : {
		        grant_type : 'authorization_code',
		        client_id : 'cdf54afc64e78fc7ad0f945f417a57d1',		// REST API 키
		        redirect_uri : 'http://localhost:8989/jsp_06_session_project/bookshop/member/kakaoLoginPro.jsp',
		        code : access_code
		    }
		    , success : function(response) {
		    	console.log('login success');
		    	
		    	Kakao.Auth.setAccessToken(response.access_token);
		    	access_token = response.access_token;
		    	
	        	requestUserInfo();
		    }
		    ,error : function(jqXHR, error) {
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
				
				$.ajax({
		        	type : "POST"
	    		    , url : 'kakaoLoginPro2.jsp'
	    		    , data : {nickname:nickname}
			        , success : function(response) {
			        	alert("카카오 로그인 성공");
			        	location.href="../shop/itemList.jsp";
				    }
		        });
				
			}
			, error : function() {
				console.log('userInfo error');
			}
		});
	}
	 
	 name();
	 
 </script>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 