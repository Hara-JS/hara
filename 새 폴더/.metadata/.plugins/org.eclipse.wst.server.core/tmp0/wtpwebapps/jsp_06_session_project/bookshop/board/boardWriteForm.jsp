<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String tdColor = "lightblue";
	%>
	

	<jsp:include page="../layout/header.jsp"></jsp:include>
	
	<br><br>
	<div align="center">
		
		<h2>새 게시글 작성하기</h2>
		<form  id="FILE_FORM"  method="post" enctype="multipart/form-data">
			<table border="1">
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">작성자</td>
					<td width="450"><input type="text" id="writer" name="writer"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">제목</td>
					<td width="450"><input type="text" id="subject" name="subject"></td>
				</tr>
				
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">글내용</td>
					<td width="450"><textarea rows="10" cols="50" id="content" name="content"></textarea></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">사진첨부</td>
					<td width="450" id="box">
						 <p></p>	
						 <button id="button-addPicture">사진추가</button>
						 <p></p>					
					</td>
				</tr>
				
				<tr height="40">
					<td width="150" align="center" colspan="2" bgcolor="<%= tdColor %>">
	               		<button id="button-boardWritePro">글쓰기</button>
						<button id="button-boardMain">메인화면</button>					
					</td>
				</tr>				
			</table>
		</form>
	</div>
	
	<script>		
		
		let addPicture = (event) => {
			
			event.preventDefault();			 
        	if(num == 6){
    			alert("사진은 5장까지 업로드 가능합니다.");
    			return;
    		}
        	
        	let $box = document.getElementById("box");
        	
        	let $line = document.createElement('span');
        	$line.className = 'line';
        	
        	let $newP1 = document.createElement('span');
            let fileNumber = "file" + num + "";
            let str = "<input type='file' value='추가' name='";            
            str += fileNumber + "'>";
            $newP1.innerHTML = str;
            $line.appendChild($newP1); 
            
        	let $newP2 = document.createElement('span');
        	str = "<input type='button' value='삭제'  onclick='delPicture(this)'><p></p>";       
        	$newP2.innerHTML = str;
            $line.appendChild($newP2);
            
            $box.appendChild($line);
            
            num += 1;
        }     
		
		let delPicture = (event) => {
			let $lineList = document.querySelectorAll('.line');
			
			for(let i=0; i<$lineList.length; i++) {
				if($lineList[i].children[1].children[0] == event) {
					console.log(i);
					$lineList[i].remove();
					num -= 1;
					break;
				}
			}
		}
		
		
		let boardWritePro = (event) => {
			event.preventDefault();
            // 아이디 입력 확인
            if($writer.value == "") {
                $writer.focus();
                alert("이름을 입력해주세요.");
                return false;
            }
          
            // 비밀번호 입력 확인
            if($subject.value == "") {
            	$subject.focus();
                alert("제목을 입력해주세요.");
                return false;
            }
           
            // 이름 입력 확인
            if($content.value == "") {
            	$content.focus();
                alert("내용을 입력해주세요.");
                return false;
            }
                     
              let form = $('#FILE_FORM')[0];
		      let formData = new FormData(form);
		     		      
		      $.ajax({
			        url: 'boardWritePro.jsp',
			        processData: false,
			        contentType: false,
			        data: formData,
			        type: 'POST',
			        success: function(result){
			         	alert("게시글을 작성했습니다.");
			         	location.href="boardMain.jsp";
			        },
			        
		      }); 
            return true;
        }			
		
		let boardMain = (event) => {
			event.preventDefault();
			location.href='boardMain.jsp';
		}
		
		let num = 1;	
		
		let $btnAddPicture = document.querySelector("#button-addPicture");
	   	$btnAddPicture.addEventListener("click", addPicture);
		
		let $btnBoardWritePro = document.querySelector("#button-boardWritePro");
	   	$btnBoardWritePro.addEventListener("click", boardWritePro);
		
	    let $writer = document.querySelector("#writer");
	    let $subject = document.querySelector("#subject");
	    let $content = document.querySelector("#content");
		
	    let $btnBoardMain = document.querySelector("#button-boardMain");
	    $btnBoardMain.addEventListener("click", boardMain);
	    
    </script>	
</body>
</html>