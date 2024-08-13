<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous">
</script>

<script>
	Kakao.init('0d03e66deff870f6eef49cd2b4f082f4');
</script>

<script>
	function loginoutKakao() {
	  
		console.log('logoutpro');
		<% session.removeAttribute("log"); %>
		
		let client_id = 'cdf54afc64e78fc7ad0f945f417a57d1';
		let logout_redirect_uri = 'http://localhost:8989/jsp_06_session_project/bookshop/shop/itemList.jsp';
		
		
		let str = '';
		str += 'https://kauth.kakao.com/oauth/logout?client_id=';
		str += client_id;
		str += '&logout_redirect_uri=';
		str += logout_redirect_uri;
		
		window.location.href = str;
		
	}
  
	loginoutKakao();
  
</script>

