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
	Object obj = session.getAttribute("lastNum");
	int lastNum = (int)obj;
%>
	<h2>게시글 추가하기</h2>
	<form method="post" action="_04_addBoardPro.jsp">
		<table border="1">
			<tr>
				<th>번호</th>
				<td><%= lastNum + 1 %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="30" name="contents"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성완료">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>