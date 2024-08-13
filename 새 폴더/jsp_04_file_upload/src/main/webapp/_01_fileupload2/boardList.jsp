<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
		
		int 		boardImageSize 				= 	(int)session.getAttribute("boardImageSize");
		int[] 		boardImageNumberList 		= 	(int[])session.getAttribute("boardImageNumberList");
		int[] 		boardImageBoardNumberList 	=  	(int[])session.getAttribute("boardImageBoardNumberList");
		String[] 	boardImageNameList 			=	(String[])session.getAttribute("boardImageNameList");
	%>

	<div align="center">
		<h1>UPLOAD 게시판</h1>
		<h2>전체 게시글 (<%= boardSize %>개)</h2>
		<table border="1">	
			<tr>
				<td>번호</td>
				<td>제목</td>
			</tr>
			<% for(int i = 0; i < boardSize; i++){%>
			<tr>
				<td><%= i + 1 %></td>	
				<td style="width: 500px" align="left">
					<a href="boardInfo.jsp?boardNumber=<%=boardNumberList[i]%>"><%=boardSubjectList[i] %></a>																		
				</td>				
			</tr>
			<%} %>
		</table>
	</div>
	
</body>
</html>

















