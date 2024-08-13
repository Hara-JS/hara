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
		Object obj = null;
		obj = session.getAttribute("max");
		int max = (int)obj;
		
		obj = session.getAttribute("count");
		int count = (int)obj;
		
		obj = session.getAttribute("list");
		int[] list = (int[])obj;
	%>
	
	<h1>전체목록 확인하기</h1>
	<button onclick="window.location.href='02_insertPro.jsp'">랜덤으로 값 추가하기</button>
	<hr>
	
	<%	for(int i=0; i<count; i++) { %>
			<p>
			<%= list[i] %>
			<button onclick="window.location.href='03_updateForm.jsp?index=<%= i %>'">수정하기</button>
			<button onclick="window.location.href='05_deletePro.jsp?index=<%= i %>'">삭제하기</button>
			</p>
	<%	} %>
</body>
</html>