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
		int 		boardSize 			= 	(int)session.getAttribute("boardSize");
		int[] 		boardNumberList 	= 	(int[])session.getAttribute("boardNumberList");
		String[] 	boardWriterList 	=  	(String[])session.getAttribute("boardWriterList");
		String[] 	boardSubjectList 	=  	(String[])session.getAttribute("boardSubjectList");
		String[] 	boardContentList 	=  	(String[])session.getAttribute("boardContentList");
		String[] 	boardDateList 		=  	(String[])session.getAttribute("boardDateList");
		int[] 		boardReadCountList 	=  	(int[])session.getAttribute("boardReadCountList");
		int[]		boardRefList 		=  	(int[])session.getAttribute("boardRefList");
		int[]		boardStepList 		=  	(int[])session.getAttribute("boardStepList");
		int[]		boardLevelList 		=  	(int[])session.getAttribute("boardLevelList");
		
		
		int 		boardImageSize 				= 	(int)session.getAttribute("boardImageSize");
		int[] 		boardImageNumberList 		= 	(int[])session.getAttribute("boardImageNumberList");
		int[] 		boardImageBoardNumberList 	=  	(int[])session.getAttribute("boardImageBoardNumberList");
		String[] 	boardImageNameList 			=	(String[])session.getAttribute("boardImageNameList");
		
		
		int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		
		int index = 0;
		for(int i=0; i<boardSize; i++) {
			if(boardNumberList[i] == boardNumber) {
				index = i;
				break;
			}
		}
		
		// 조회수 증가
		boardReadCountList[index] += 1;
		
		session.setAttribute("boardReadCountList", boardReadCountList);
		
	%>


	<%
	
		String imagePath =  request.getContextPath();
		imagePath += "/bookshop/uploadFile/";
		System.out.println(imagePath);
	
		String tdColor = "lightyellow";
		
		
	%>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<br><br>
	<div align="center">
		<h1>UPLOAD 게시판</h1>
		<h2>게시글 정보</h2>
		<form method="post" action="boardWritePro.jsp" enctype="multipart/form-data">
			<table border="1">
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">게시글번호</td>
					<td width="450"><input type="text" name="writer" value="<%= boardNumberList[index] %>" readonly="readonly"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">작성자</td>
					<td width="450"><input type="text" name="writer" value="<%= boardWriterList[index] %>" readonly="readonly"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">제목</td>
					<td width="450"><input type="text" name="subject" value="<%= boardSubjectList[index] %>" readonly="readonly"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">글내용</td>
					<td width="450"><textarea rows="10" cols="50" name="content" readonly="readonly"><%= boardContentList[index] %></textarea></td>
				</tr>
				<tr height="40">
					<td width="150" align="center" bgcolor="<%= tdColor %>">사진첨부</td>
					<td width="450" id="box">
						<% 
						
							for(int i = 0; i < boardImageSize; i++){
								if(boardImageBoardNumberList[i] == boardNumber) {
						%>
							<p><img src="<%= imagePath + boardImageNameList[i] %>" width="100px"></p>
						<%			
								}
							} 
						%>
					</td>
				</tr>
				<tr height="40">
					<td width="150" align="center" colspan="2" bgcolor="<%= tdColor %>">
						<input type="button" value="답글쓰기" onclick="location.href='reWriteForm.jsp?boardNumber=<%= boardNumber %>'">
						<input type="button" value="전체게시글보기" onclick="location.href='boardList.jsp'">
					</td>
				</tr>				
			</table>
		</form>
	</div>
</body>
</html>