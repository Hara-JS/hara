<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
        table, tr, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        #content-join {
            margin: 0 auto;
            width: 600px;
        }
        #title, #joinPro {
            text-align: center;
        }
    </style>
    
    
</head>
<body>
	
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
			
	<table id="content-join">
        <tr>
            <td colspan="3" id="title"><h2>테스트2</h2></td>
        </tr>
        <tr>
            <td rowspan="2">아이디</td>
            <td><input id="input-memberId" type="text" placeholder="아이디를 입력해주세요" value="test1234"></td>
            <td><button id="button-memberIdCheckPro">중복확인</button></td>
        </tr>
        <tr>
            <td id="msg-memberId" colspan="2"></td>
        </tr>
 
        <tr>
            <td colspan="3" id="joinPro">
                <button id="button-memberJoinPro">가입하기</button>
            </td>
        </tr>
    </table>

    <script>
    	
    		 /* 아이디 유효성 검사 */
            let inputMemberIdInput = (event) => {
                let $msgMemberId = document.querySelector("#msg-memberId");

                let regExp = RegExp(/^[A-Za-z0-9_\-]{6,16}$/);
                if(regExp.test($inputMemberId.value)) {
                    $msgMemberId.innerHTML = "";
                } else {
                    $msgMemberId.innerHTML = "<span style='color:#F03F40; font-size:12px;'>6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합</span>";
                }
            }

            /* 아이디 중복검사 */
            let buttonMemberIdCheckProClick = (event) => {
                let regExp = RegExp(/^[A-Za-z0-9_\-]{6,16}$/);

                if($inputMemberId.value == "") {
                    alert("아이디를 입력해주세요.");
                    $inputMemberId.focus();
                } else if(!regExp.test($inputMemberId.value)) {
                    alert("6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합");
                    $inputMemberId.value = "";
                    $inputMemberId.focus();
                } else {
                    idCheck = true;
                   	
                    $.ajax({
    					type: "post",
    					url: "_02_testPro.jsp",
    					data: {
    						id: $inputMemberId.value
    					},
    					success: function(data) {
    						/*
    							html 이 통채로 넘어오기때문에 원하는 데이터를 잘 파싱해야한다. 
    						*/
    						
    						let str = '<p id="check">';
    						let length = str.length;
    						let startIndex = data.indexOf(str);
    						
    						let checkValue = data.substr(startIndex + length);
    						
    						console.log("data = " + data);
    						console.log("length = " + length);
    						console.log("startIndex = " + startIndex);
    						console.log("checkValue = " + checkValue);
    						
    						// 아이디가 중복되면
    						if(checkValue.trim() === "-1") {
    							alert("중복된 아이디입니다.");
    							$inputMemberId.value = "";
    							$inputMemberId.focus();
    						} else {
    							alert("사용할 수 있는 아이디입니다.");
    							
    							
    						}
    						
    						
    					},
    					error: function() {
    						alert("joinForm error");
    					}
    				});	
                    
                    
                }
            }

         
            //--------------------------------------------------------------------------------------

            let idCheck = false;
            let emailCheck = false;

            let $inputMemberId = document.querySelector("#input-memberId");
            $inputMemberId.addEventListener("input", inputMemberIdInput);

            let $buttonMemberIdCheckPro = document.querySelector("#button-memberIdCheckPro");
            $buttonMemberIdCheckPro.addEventListener("click", buttonMemberIdCheckProClick);
    	
    </script>
	
	
</body>
</html>