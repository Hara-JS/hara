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
	<style>
		td{
			text-align : center;
		}
	</style>
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
		
		
		
		
	%>
	<jsp:include page="../layout/adminHeader.jsp"></jsp:include>
	<br><br>
	<div align="center">
		<h1>관리자 게시판</h1>
		<h2>전체 게시글</h2>
		<table border="1">	
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회</td>
			</tr>
			<% for(int i = 0; i < boardSize; i++){%>
				
			<tr>
					
				<td><%=boardNumberList[i] %></td>				
				<td><%=boardSubjectList[i] %></td>				
				<td><%=boardWriterList[i] %></td>
				
				<%
					// https://developer-talk.tistory.com/643				
					LocalDateTime time = LocalDateTime.now();	
					System.out.println(LocalDateTime.now());					
					int year = time.getYear();
					int month = time.getMonthValue();
					int day = time.getDayOfMonth();
					int hour = time.getHour();
					int min = time.getMinute();
					int second = time.getSecond();
					
					System.out.println(year + " " + month + " " + day);
					System.out.println(hour + " " + min + " " + second);
					String[] dateAndTime = boardDateList[i].split(" ");
					System.out.println(Arrays.toString(dateAndTime));	
					String[] dateList = dateAndTime[0].split("-");
					
					int[] dateListInt = new int[3];
					
					for(int j = 0; j < dateList.length;j++){
						dateListInt[j] = Integer.parseInt(dateList[j]);
					}
					String[] timeList = dateAndTime[1].split(":");
					
					int[] timeListInt = new int[3];
					
					for(int j = 0; j < dateList.length;j++){
						timeListInt[j] = Integer.parseInt(timeList[j]);
					}
										
					System.out.println(Arrays.toString(dateListInt));	
					System.out.println(Arrays.toString(timeListInt));	
					
					LocalDateTime startDT1 = LocalDateTime.of(
							dateListInt[0], dateListInt[1], dateListInt[2],
							timeListInt[0], timeListInt[1], timeListInt[2]);
					
					LocalDateTime startDT2 = LocalDateTime.of(year, month, day, hour, min, second);
										
					Duration diff = Duration.between(startDT2.toLocalTime(), startDT1.toLocalTime());
					
					LocalDate startDate = LocalDate.of(dateListInt[0], dateListInt[1], dateListInt[2]);
					LocalDate endDate = LocalDate.of(year, month, day);
					Period period = Period.between(startDate, endDate);
					System.out.println("차이:"+ period.getYears());			
					System.out.println("차이:"+ period.getMonths());			
					System.out.println("차이:"+ period.getDays());						
					
				%>
				
				<% if( period.getDays() >= 1 ){ %>				
					<td><%=dateAndTime[0] %></td>					
				<% }else {%>				
					<td><%=dateAndTime[1] %></td>				
				<% } %>
							
				<td><%=boardReadCountList[i] %></td>
			</tr>
			<%} %>
		</table>
		<a href="adminMain.jsp">메인</a>
	</div>
</body>
</html>