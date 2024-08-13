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
	
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<br><br>
	<div align="center">
		
		<h2>새 게시글 작성하기</h2>
		<form  id="FILE_FORM"  method="post" enctype="multipart/form-data">
			<table border="1">
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
						 <input type="file" name="file1">
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
		let boardWritePro = (event) => {
			event.preventDefault();
                     
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
		
		let $btnBoardWritePro = document.querySelector("#button-boardWritePro");
	   	$btnBoardWritePro.addEventListener("click", boardWritePro);
		
	    let $btnBoardMain = document.querySelector("#button-boardMain");
	    $btnBoardMain.addEventListener("click", boardMain);
	    
    </script>	
</body>
</html>