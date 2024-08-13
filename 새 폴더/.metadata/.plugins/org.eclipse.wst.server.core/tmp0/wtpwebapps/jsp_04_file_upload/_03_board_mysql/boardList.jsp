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
	
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
	%>
	<%
		int 		boardSize 			= 	0;
		int[] 		boardNumberList 	= 	new int[1000];
		String[] 	boardWriterList 	=   new String[1000];
		String[] 	boardSubjectList 	=   new String[1000];
		String[] 	boardContentList 	=   new String[1000];
		String[] 	boardDateList 		=   new String[1000];
		int[] 		boardReadCountList 	=   new int[1000];
		int[]		boardRefList 		=   new int[1000];
		int[]		boardStepList 		=   new int[1000];
		int[]		boardLevelList 		=   new int[1000];
		int[]		boardRemoveList 	=  	new int[1000];
		

	%>

	<%
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_03_board_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = " SELECT * FROM board ORDER BY board_ref DESC , board_level ASC ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				boardNumberList[boardSize] = rs.getInt(1);
				boardWriterList[boardSize] = rs.getString(2);
				boardSubjectList[boardSize] = rs.getString(3);
				boardContentList[boardSize] = rs.getString(4);
				boardDateList[boardSize] = rs.getString(5);
				boardReadCountList[boardSize] = rs.getInt(6);
				boardRefList[boardSize] = rs.getInt(7);
				boardStepList[boardSize] = rs.getInt(8);
				boardLevelList[boardSize] = rs.getInt(9);
				boardRemoveList[boardSize] = rs.getInt(10);
					
				
				boardSize += 1;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){ conn.close();	}
			if(pstmt != null){ pstmt.close(); }
			if(rs != null){ rs.close();	}
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
				<td>되돌리기</td>
			</tr>
			<% for(int i = startRow; i < endRow; i++){%>				
			<tr>					
				<td><%= boardSize - i %></td>	
				<td style="width: 500px" align="left">	
										
					<% if(boardStepList[i] > 1) { %>
						<% for(int j=0; j< boardStepList[i]  * 3; j++) { %>
							&nbsp;
						<% } %>
						[답변]
					<% } %>
										
					<% if(boardRemoveList[i] == 1) {%>					
						--- 삭제된 게시글 입니다. ---			
					<%}else if(boardRemoveList[i] == 0) { %>							
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
				<td><button onclick="window.location.href='boardDeleteCancel.jsp?boardNumber=<%= boardNumberList[i] %>'">되돌리기</button></td>
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
			[<a href="boardMain.jsp?currentPageNumber=<%= endPageNum + 1 %>">이후</a>]
		<% } %>
		
		<hr />
		
		<h3>전체 페이지 수 = <%= allPageCount %></h3>
		
		<hr />
		
	</div>
	
	
	<script>
	
	</script>
</body>
</html>

