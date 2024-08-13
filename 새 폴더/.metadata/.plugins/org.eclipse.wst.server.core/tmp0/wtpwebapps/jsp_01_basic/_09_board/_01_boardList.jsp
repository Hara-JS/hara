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
		Object obj = session.getAttribute("count");
		int count = (int)obj;
		
		obj = session.getAttribute("noList");
		String[] noList = (String[])obj;
		
		obj = session.getAttribute("writerList");
		String[] writerList = (String[])obj;
		
		obj = session.getAttribute("regDateList");
		String[] regDateList = (String[])obj;
	
		obj = session.getAttribute("subjectList");
		String[] subjectList = (String[])obj;
		
		obj = session.getAttribute("contentsList");
		String[] contentsList = (String[])obj;
	%>
	
	전체 게시글 수 : <%= count %>개
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>제목</th>
			<th>내용</th>
			<th>삭제</th>
		</tr>
	<%	for(int i=0; i<count; i++) {	%>
		<tr>
			<td><%= noList[i] %></td>		
			<td><%= writerList[i] %></td>	
			<td><%= regDateList[i] %></td>	
			<td>
				<a href="_05_updateBoard.jsp?index=<%= i %>"><%= subjectList[i] %></a>
			</td>		
			<td><%= contentsList[i] %></td>	
			<td>
				<button onclick="window.location.href='_06_deleteBoard.jsp?index=<%= i %>'">삭제하기</button>
			</td>	
		</tr>
	<%	} %>
		<tr>
			<td colspan="6">
				<button onclick="window.location.href='_00_main.jsp'">메인화면</button>
			</td>
		</tr>
	</table>
	
		
</body>
</html>