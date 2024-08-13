<%@page import="java.util.ArrayList"%>
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
		String imagePath =  request.getContextPath();
		imagePath += "/_03_board_mysql/uploadFile/";
		System.out.println(imagePath);
	
		String tdColor = "lightyellow";
	%>
	<%
	
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
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
			
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_03_board_mysql?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = "UPDATE board SET board_readcount = board_readcount + 1 WHERE board_number = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, boardNumber);
				pstmt.executeUpdate();
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(conn != null){ conn.close();	}
				if(pstmt != null){ pstmt.close(); }
			}	
	%>

	<%
		int 		boardImageSize 				= 	0;
		int[]       boardImageNumberList  		=   new int[5];
		int[] 		boardImageBoardNumberList 	= 	new int[5];
		String[] 	boardImageNameList 				=   new String[5];	
	%>
	
	
	<%
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_03_board_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = " SELECT * FROM boardimage WHERE boardimage_boardnumber = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1 , boardNumber);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				boardImageNumberList[boardImageSize] = rs.getInt(1);
				boardImageBoardNumberList[boardImageSize] = rs.getInt(2);
				boardImageNameList[boardImageSize] = rs.getString(3);
				boardImageSize += 1;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){ conn.close();	}
			if(pstmt != null){ pstmt.close(); }
			if(rs != null){ rs.close();	}
		}
	
	%>		

	<div align="center">
		<h1>UPLOAD 게시판</h1>
		<h2>게시글 정보</h2>
		<form method="post" action="boardWritePro.jsp" enctype="multipart/form-data">
			<table border="1">
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">게시글번호</td>
					<td width="450"><input type="text" name="writer" value="<%= boardNumberList %>" readonly="readonly"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">작성자</td>
					<td width="450"><input type="text" name="writer" value="<%= boardWriterList%>" readonly="readonly"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">제목</td>
					<td width="450"><input type="text" name="subject" value="<%= boardSubjectList %>" readonly="readonly"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">글내용</td>
					<td width="450"><textarea rows="10" cols="50" name="content" readonly="readonly"><%= boardContentList %></textarea></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">사진첨부</td>
					<td width="450" id="box">
						<% for(int i = 0; i < boardImageSize; i++){%>
							<p>
								<img src="<%= imagePath + boardImageNameList[i] %>" width="100px" style="border: 1px solid lightgray;">								
							</p>
						<%} %>
						
					</td>
				</tr>
				<tr height="40">
					<td width="150" align="center" colspan="2" bgcolor="<%= tdColor %>">
						<input type="button" value="답글쓰기" onclick="location.href='reWriteForm.jsp?boardNumber=<%= boardNumber %>'">
						<input type="button" value="전체게시글보기" onclick="location.href='boardMain.jsp'">
					</td>
				</tr>				
			</table>
		</form>
	</div>
</body>
</html>