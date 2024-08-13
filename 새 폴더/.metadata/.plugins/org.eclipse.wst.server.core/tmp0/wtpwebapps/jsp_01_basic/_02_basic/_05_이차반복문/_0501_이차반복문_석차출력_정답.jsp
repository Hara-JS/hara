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
			/*
			    [문제]
			        scoreList는 학생시험점수배열이다. 
			        석차를 출력하시오.
			    [정답]
			        2 3 4 1 
			*/
			
			int[] scoreList = {87,   42,   11,   98};
			
			int size = scoreList.length;
		
	%>
	
	<%for(int i = 0; i < size; i++){ %>
		<% int count = 1; %>
		
		<%for(int j = 0; j< size; j++){ %>
			<%if(scoreList[i] < scoreList[j]){ %>
				<%count += 1; %>
			<%} %>
		<%} %>
		
		<%=count +" " %>
	
	<%} %>
</body>
</html>