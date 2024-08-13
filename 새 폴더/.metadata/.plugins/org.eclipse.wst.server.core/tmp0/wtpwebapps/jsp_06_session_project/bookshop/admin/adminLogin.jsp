<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="../css/adminLogin.css" rel="stylesheet" type="text/css">
   
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		function focusFunction(e){
			e.style.background="rgb(233, 233, 233)";
		}
		
		function blurFunction(e) {
			e.style.background="rgb(255, 255, 255)";
		}
	
		function checkValue() {
			let idCheck = document.querySelector("#id");
			let pwCheck = document.querySelector("#pw");
			if(!idCheck.value) {
				alert("아이디를 입력해주세요.");
				idCheck.focus();
				return false;
			}
			if(!pwCheck.value) {
				alert("비밀번호를 입력해주세요.");
				pwCheck.focus();
				return false;
			}
			return true;			
		}
		
		function submitLogin(){
			if(checkValue()) {
				let idCheck = document.querySelector("#id");
				let pwCheck = document.querySelector("#pw");
				
				$.ajax({
					type: "post",
					url: "../admin/adminLoginPro.jsp",
					data: {
						id: idCheck.value,
						pw: pwCheck.value
					},
					success: function(data) {
						let str = '<p id="check">';
						let length = str.length;
						let startIndex = data.indexOf(str);
						
						let checkValue = data.substr(startIndex + length);
						
						console.log("data = " + data);
						console.log("length = " + length);
						console.log("startIndex = " + startIndex);
						console.log("checkValue = " + checkValue);
						
						// 로그인에 실패하면
						if(checkValue.trim() === "-1") {
							alert("아이디와 비밀번호를 확인해주세요.");
							idCheck.value = "";
							pwCheck.value = "";
							idCheck.focus();
						} else {
							alert("로그인 성공");
							location.href="adminMain.jsp";
						}
					},
					error: function() {
						alert("error loginForm");
					}
				});
			}
		}
		
	</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<br><br>
	<div align="center">
		<h2>관리자 로그인</h2>
		<table border="1">
			<tr>
				<td>
					아이디
				</td>
				<td>
					<input type="text" class="inputForm" id="id" name="id" placeholder="아이디" autofocus="autofocus" onfocus="focusFunction(this)" onblur="blurFunction(this)" value="admin">
				</td>
			</tr>
			
			<tr>
				<td>
					비밀번호
				</td>
				<td>
					<input type="password" class="inputForm" id="pw" name="pw" placeholder="비밀번호" onfocus="focusFunction(this)" onblur="blurFunction(this)" value="admin">
				</td>
			</tr>
			
			<tr>
				<td align="center" colspan="2">
					<input type="button" id="button-submitLogin" value="로그인" id="login" >
				</td>
			</tr>
			
		</table>
	</div>
	<script>
	
		let $submitLogin = document.querySelector("#button-submitLogin");
		$submitLogin.addEventListener("click", submitLogin);
	</script> 
</body>
</html>





