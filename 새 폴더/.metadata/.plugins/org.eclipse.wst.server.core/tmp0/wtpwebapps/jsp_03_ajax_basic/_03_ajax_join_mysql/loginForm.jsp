<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	
   <jsp:include page="header.jsp" />	
	
   <table id="content-login">
   		<tr>
   			<td>아이디 : qwer1234</td>
   			<td>비밀번호 : Qwer1234!</td>
   		</tr>
   		<tr>
   			<td>아이디 : abcd1234</td>
   			<td>비밀번호 : Abcd1234!</td>
   		</tr>
   		<tr>
   			<td>아이디 : hello1234</td>
   			<td>비밀번호 : Hello1234!</td>
   		</tr>
        <tr>
            <td colspan="2" id="title"><h1>로그인</h1></td>
        </tr>
        <tr>
            <td>아이디</td>
            <td><input type="text" id="input-memberId" value="qwer1234"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="text" id="input-memberPw" value="Qwer1234!"></td>
        </tr>
        <tr>
            <td colspan="2" id="loginPro">
                <button id="button-memberLoginPro">로그인</button>
            </td>
        </tr>
    </table>

    <script>
        let memberLoginPro = (event) => {
            if($inputMemberId.value == "") {
                alert("아이디를 입력해주세요.");
                $inputMemberId.focus();
                return false;
            }
            if($inputMemberPw.value == "") {
                alert("비밀번호를 입력해주세요.");
                $inputMemberPw.focus();
                return false;
            }
            
            $.ajax({
				type: "post",
				url: "loginPro.jsp",
				data: {
					id: $inputMemberId.value,
					pw: $inputMemberPw.value
				},
				success: function(data) {
					let str = '<p id="check">';
					let length = str.length;
					let startIndex = data.indexOf(str);
					
					let checkValue = data.substr(startIndex + length);
					
					console.log("data = " + data);
					console.log("length = " + length);
					console.log("startIndex = " + startIndex);
					console.log("[checkValue = " + checkValue + "]");
					
					// 로그인에 실패하면
					if(checkValue.trim() === "-1") {
						alert("아이디와 비밀번호를 확인해주세요.");
						$inputMemberId.value = "";
						$inputMemberPw.value = "";
						$inputMemberId.focus();
					} else {
						alert("로그인 성공");
						location.href="main.jsp";
					}
				},
				error: function() {
					alert("error loginForm");
				}
			});
            
            return true;
        };

        let $inputMemberId = document.querySelector("#input-memberId");
        let $inputMemberPw = document.querySelector("#input-memberPw");
        let $buttonMemberLoginPro = document.querySelector("#button-memberLoginPro");

        $buttonMemberLoginPro.addEventListener("click", memberLoginPro);
    </script>
	
</body>
</html>