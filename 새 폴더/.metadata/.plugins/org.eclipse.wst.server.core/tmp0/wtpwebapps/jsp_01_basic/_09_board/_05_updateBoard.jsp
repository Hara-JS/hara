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
		String[] regDtaeList = (String[])obj;
		
		obj = session.getAttribute("subjectList");
		String[] subjectList = (String[])obj;
		
		obj = session.getAttribute("contentsList");
		String[] contentsList = (String[])obj;
		
		int index = Integer.parseInt(request.getParameter("index"));
	%>
	<h2>게시글 수정하기</h2>

	<form method="post" action="_05_updateBoardPro.jsp">
		<table border="1">
			<tr>
				<th>번호</th>
				<td colspan="3"><%= noList[index] %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%= writerList[index] %></td>
				<th>작성일</th>
				<td><%= regDtaeList[index] %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="subject" value="<%= subjectList[index] %>">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3">
					<textarea rows="10" cols="30" name="contents"><%= contentsList[index] %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="hidden" name="index" value="<%= index %>">
				
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>