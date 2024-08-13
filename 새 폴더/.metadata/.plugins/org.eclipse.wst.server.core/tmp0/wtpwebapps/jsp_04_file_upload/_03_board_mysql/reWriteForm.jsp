<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
	%>

	<%
		String tdColor = "lightblue";
	%>
	
	<%
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		
		int		boardNumberList 	= 	0;
		String 	boardWriterList 	=  	"";
		String	boardSubjectList 	=  "";
		String 	boardContentList 	=	"";
		String 	boardDateList 		=	"";
		int 	boardReadCountList 	=  	0;
		int		boardRefList 		=	0;
		int		boardStepList 		=  	0;
		int		boardLevelList 		=  	0;
		int		boardRemoveList 	=  0;
	
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_03_board_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = " SELECT * FROM board WHERE board_number = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNumber);
			rs = pstmt.executeQuery();
		
			if(rs.next()){
				
					boardNumberList 	= 	rs.getInt(1);
				 	boardWriterList 	=  	rs.getString(2);
					boardSubjectList 	=   rs.getString(3);
				 	boardContentList 	=	rs.getString(4);
				 	boardDateList 		=	rs.getString(5);
				 	boardReadCountList 	=  	rs.getInt(6);
					boardRefList 		=	rs.getInt(7);
					boardStepList 		=  	rs.getInt(8);
					boardLevelList 		=  	rs.getInt(9);
					boardRemoveList 	=  	rs.getInt(10);
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){ conn.close();	}
			if(pstmt != null){ pstmt.close(); }
			if(rs != null){ rs.close();	}
		}			
	%>

	<jsp:include page="header.jsp"></jsp:include>
	
	<div align="center">
		
		<h2>답변 게시글 작성하기</h2>
		<form  id="FILE_FORM"  method="post">
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
					<td width="150" align="center" colspan="2" bgcolor="<%= tdColor %>">
						<input type="hidden" name="boardNumber" value="<%= boardNumber %>">
						<input type="hidden" name="ref" value="<%= boardRefList %>">
						<input type="hidden" name="reStep" value="<%= boardStepList %>">
						<input type="hidden" name="reLevel" value="<%= boardLevelList %>">

	               		<button id="button-boardReWritePro">답글쓰기</button>
						<button id="button-boardMain">메인화면</button>					
					</td>
				</tr>				
			</table>
		</form>
	</div>
	
	<script>		
		let boardReWritePro = (event) => {
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
                     
	      	let formValues = $("#FILE_FORM").serialize();
	      	$.ajax({
		        type: 'POST',
		        url: 'reWritePro.jsp',
		        data: formValues,
		        success: function(){
		         	alert("게시글을 작성했습니다.");
		         	location.href="boardMain.jsp";
		        },
		        error: function() {
		        	alert("reWriteForm error");
		        }
		        
	      }); 
            return true;
        }			
		
		let boardMain = (event) => {
			event.preventDefault();
			location.href='boardMain.jsp';
		}
		
//		let num = 1;	
		
		let $btnBoardReWritePro = document.querySelector("#button-boardReWritePro");
	   	$btnBoardReWritePro.addEventListener("click", boardReWritePro);
		
	    let $writer = document.querySelector("#writer");
	    let $subject = document.querySelector("#subject");
	    let $content = document.querySelector("#content");
		
	    let $btnBoardMain = document.querySelector("#button-boardMain");
	    $btnBoardMain.addEventListener("click", boardMain);
	    
    </script>	
</body>
</html>