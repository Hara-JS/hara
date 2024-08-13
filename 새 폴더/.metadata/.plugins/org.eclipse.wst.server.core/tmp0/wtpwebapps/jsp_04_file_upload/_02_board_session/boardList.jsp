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
		String[] 	boardDateList 		=  	(String[])session.getAttribute("boardDateList");
		int[] 		boardReadCountList 	=  	(int[])session.getAttribute("boardReadCountList");
		int[]		boardRefList 		=  	(int[])session.getAttribute("boardRefList");
		int[]		boardStepList 		=  	(int[])session.getAttribute("boardStepList");
		int[]		boardLevelList 		=  	(int[])session.getAttribute("boardLevelList");
		boolean[]	boardRemoveList 	=  	(boolean[])session.getAttribute("boardRemoveList");
		
		
		int 		boardImageSize 				= 	(int)session.getAttribute("boardImageSize");
		int[] 		boardImageNumberList 		= 	(int[])session.getAttribute("boardImageNumberList");
		int[] 		boardImageBoardNumberList 	=  	(int[])session.getAttribute("boardImageBoardNumberList");
		String[] 	boardImageNameList 			=	(String[])session.getAttribute("boardImageNameList");
	%>

	<%
		// 정렬하기
		for(int i=0; i<boardSize; i++) {
			for(int j=i + 1; j<boardSize; j++) {
				if(boardRefList[i] < boardRefList[j]) {
					int temp = boardNumberList[i];
					boardNumberList[i] = boardNumberList[j];
					boardNumberList[j] = temp;
					
					String strTemp = boardWriterList[i];
					boardWriterList[i] = boardWriterList[j];
					boardWriterList[j] = strTemp;
					
					strTemp = boardSubjectList[i];
					boardSubjectList[i] = boardSubjectList[j];
					boardSubjectList[j] = strTemp;
					
					strTemp = boardContentList[i];
					boardContentList[i] = boardContentList[j];
					boardContentList[j] = strTemp;
					
					strTemp = boardDateList[i];
					boardDateList[i] = boardDateList[j];
					boardDateList[j] = strTemp;
					
					temp = boardReadCountList[i];
					boardReadCountList[i] = boardReadCountList[j];
					boardReadCountList[j] = temp;
					
					temp = boardRefList[i];
					boardRefList[i] = boardRefList[j];
					boardRefList[j] = temp;
					
					temp = boardStepList[i];
					boardStepList[i] = boardStepList[j];
					boardStepList[j] = temp;
					
					temp = boardLevelList[i];
					boardLevelList[i] = boardLevelList[j];
					boardLevelList[j] = temp;
					
					boolean boolTemp = boardRemoveList[i];
					boardRemoveList[i] = boardRemoveList[j];
					boardRemoveList[j] = boolTemp;
				}
			}
		}
	
	for(int i=0; i<boardSize; i++) {
		for(int j=i + 1; j<boardSize; j++) {
			if(boardRefList[i] == boardRefList[j] && boardLevelList[i] > boardLevelList[j]) {
				int temp = boardNumberList[i];
				boardNumberList[i] = boardNumberList[j];
				boardNumberList[j] = temp;
				
				String strTemp = boardWriterList[i];
				boardWriterList[i] = boardWriterList[j];
				boardWriterList[j] = strTemp;
				
				strTemp = boardSubjectList[i];
				boardSubjectList[i] = boardSubjectList[j];
				boardSubjectList[j] = strTemp;
				
				strTemp = boardContentList[i];
				boardContentList[i] = boardContentList[j];
				boardContentList[j] = strTemp;
				
				strTemp = boardDateList[i];
				boardDateList[i] = boardDateList[j];
				boardDateList[j] = strTemp;
				
				temp = boardReadCountList[i];
				boardReadCountList[i] = boardReadCountList[j];
				boardReadCountList[j] = temp;
				
				temp = boardRefList[i];
				boardRefList[i] = boardRefList[j];
				boardRefList[j] = temp;
				
				temp = boardStepList[i];
				boardStepList[i] = boardStepList[j];
				boardStepList[j] = temp;
				
				temp = boardLevelList[i];
				boardLevelList[i] = boardLevelList[j];
				boardLevelList[j] = temp;
				
				boolean boolTemp = boardRemoveList[i];
				boardRemoveList[i] = boardRemoveList[j];
				boardRemoveList[j] = boolTemp;
			}
		}
	}
	
	%>		
	
	<%
		int onePageArticlesCount = 10;		// 한 페이지에 보여줄 게시글 수
		int currentPageNumber = 1;			// 현재 페이지 번호
		if(request.getParameter("currentPageNumber") != null) {
			currentPageNumber = Integer.parseInt(request.getParameter("currentPageNumber"));
		}
		int allArticlesCount = boardSize;	// 전체 게시글 수
		int startRow = (currentPageNumber - 1) * onePageArticlesCount;		// 게시글 시작 번호
		int endRow = startRow + onePageArticlesCount;						// 게시글 마침 번호
		
		if(endRow > allArticlesCount) {
			endRow = allArticlesCount;
		}
	%>
	
	<div align="center">
		<h1>UPLOAD 게시판</h1>
		<h2>전체 게시글 (<%= boardSize %>개)</h2>
		<table border="1">	
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회</td>
				<td>삭제</td>
			</tr>
			<% for(int i = startRow; i < endRow; i++){%>
				
			<tr>
					
				<td><%= boardSize - i %></td>	
							
				<td style="width: 500px" align="left">
					<% if(boardStepList[i] > 1) { %>
						<% for(int j = 0; j < boardStepList[i]  * 3; j++) { %>
							&nbsp;
						<% } %>
						[답변]
					<% } %>
										
					<% if(boardRemoveList[i] == true) {%>					
						--- 삭제된 게시글 입니다. ---			
					<%}else if(boardRemoveList[i] == false) { %>							
						<a href="boardInfo.jsp?boardNumber=<%=boardNumberList[i]%>"><%=boardSubjectList[i] %></a>																		
					<%} %>	
				
				
				</td>				
				<td><%=boardWriterList[i] %></td>
				
				<%
					// https://developer-talk.tistory.com/643				
					LocalDateTime time = LocalDateTime.now();	
					int year = time.getYear();
					int month = time.getMonthValue();
					int day = time.getDayOfMonth();
					int hour = time.getHour();
					int min = time.getMinute();
					int second = time.getSecond();
					
					String[] dateAndTime = boardDateList[i].split(" ");
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
										
					LocalDateTime startDT1 = LocalDateTime.of(
					dateListInt[0], dateListInt[1], dateListInt[2],
					timeListInt[0], timeListInt[1], timeListInt[2]);
					
					LocalDateTime startDT2 = LocalDateTime.of(year, month, day, hour, min, second);
										
					Duration diff = Duration.between(startDT2.toLocalTime(), startDT1.toLocalTime());
					
					LocalDate startDate = LocalDate.of(dateListInt[0], dateListInt[1], dateListInt[2]);
					LocalDate endDate = LocalDate.of(year, month, day);
					Period period = Period.between(startDate, endDate);
				%>
				
				<% if( period.getDays() >= 1 ){ %>				
					<td><%=dateAndTime[0] %></td>					
				<% }else {%>				
					<td><%=dateAndTime[1] %></td>				
				<% } %>
							
				<td><%=boardReadCountList[i] %></td>
				<td><button onclick="window.location.href='boardDelete.jsp?boardNumber=<%= boardNumberList[i] %>'">삭제</button></td>
			</tr>
			<%} %>
		</table>
		
		
		
		<%
			int clickablePageCount = 5;										// 페이지 번호 개수
			int allPageCount = allArticlesCount / onePageArticlesCount;		// 전체 페이지 수
			if(allArticlesCount % onePageArticlesCount != 0) allPageCount += 1;
			
			int startPageNum = 1;
			if(currentPageNumber % clickablePageCount != 0) {
				startPageNum = (currentPageNumber / clickablePageCount) * clickablePageCount + 1;
			} else {
				startPageNum = (currentPageNumber / clickablePageCount - 1) * clickablePageCount + 1;
			}
			int endPageNum = startPageNum + clickablePageCount  - 1;
			if(endPageNum > allPageCount){
				endPageNum = allPageCount;
			}
		%>
		<% if(startPageNum > clickablePageCount) { %>
			[<a href="boardMain.jsp?currentPageNumber=<%= startPageNum - clickablePageCount %>">이전</a>]
		<% } %>
		<% for(int i=startPageNum; i<= endPageNum; i++) { %>
			[<a href="boardMain.jsp?currentPageNumber=<%= i %>"><%= i %></a>]
		<% } %>
		<% if(endPageNum < allPageCount) { %>
			[<a href="boardList.jsp?currentPageNumber=<%= endPageNum + 1 %>">이후</a>]
		<% } %>
		
		<hr />
		
		<h3>전체 페이지 수 = <%= allPageCount %></h3>
		
		<hr />
		
	
	</div>
	
	
	<script>
	
	</script>
</body>
</html>

















