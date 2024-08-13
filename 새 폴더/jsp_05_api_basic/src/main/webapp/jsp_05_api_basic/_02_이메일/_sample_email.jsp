<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>

</head>
<body>
	<div align="center">
		<table border="1">
			<tr>
				<td colspan="2"><h1>회원에게 이메일 보내기</h1></td>
			</tr>
			<tr>
				<td colspan="2"><h3>Gmail로만 전송 가능합니다.</h3></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text"  id="to_name" placeholder="이름을 입력해주세요"></td>
			</tr>
			<tr>
				<td>이메일 주소</td>
				<td><input type="text" id="email" , placeholder="메일주소를 입력해주세요"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea id="message" rows="5" placeholder="내용을 입력해주세요 "></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="button-submitEmail"  value="메일보내기"/></td>
			</tr>
		</table>
	</div> 
	
	<script>

	function submitEmail(){

		let data = {	
	      		//각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!  	  	
	            from_name: '관리자',
	            to_name: document.querySelector("#to_name").value  , 
	            email_id :  document.querySelector("#email").value  , 
	            message : document.querySelector("#message").value  , 
	       	};
	        emailjs.send('service_smyaw7b', 'template_dj50rlt', data)
	     	//emailjs.send('service ID', 'template ID', 보낼 내용이 담긴 객체)
	       	    .then(function(response) {
	       	       console.log('SUCCESS!', response.status, response.text);
	       	     
	       	       alert("메일을 성공적으로 전송하였습니다.");
	       	       // location.href="adminMain.jsp";
	       	       
	       	    }, function(error) {
	       	       console.log('FAILED...', error);
	       	    });
	    
	}

	emailjs.init("2aCXMCEZHXXDEATP-");		
	
	let $submitEmail = document.querySelector("#button-submitEmail");
	$submitEmail.addEventListener("click", submitEmail);
	

</script>
	
	
	
</body>
</html>


















