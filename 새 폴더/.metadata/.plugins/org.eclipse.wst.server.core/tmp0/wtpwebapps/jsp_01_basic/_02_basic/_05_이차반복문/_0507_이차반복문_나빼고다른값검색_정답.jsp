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
			    각각의 배열의 값들이 나머지값들과 비교해서 현재의 배열값보다 다른값만 출력하시오.
			    단, 값이 같은때에는 #을 출력하시오.
			    그리고, 내자리는 숫자대신 "*" 을출력하시오.
			[정답]
				* 20 30 40 30 # 50 60
				10 * 30 40 30 10 50 60
				10 20 * 40 # 10 50 60
				10 20 30 * 30 10 50 60
				10 20 # 40 * 10 50 60
				# 20 30 40 30 * 50 60
				10 20 30 40 30 10 * 60
				10 20 30 40 30 10 50 *
		*/
		
		int[] arr = {10, 20, 30, 40, 30, 10, 50, 60};
	%>
	
	<%
	    for(int i = 0; i<arr.length; i++) {
	        int a = arr[i];
	        for(int j = 0; j < arr.length; j++) {
	            int b = arr[j];
	            if(a != b) {
	 %>
	                <%= arr[j] %> 
	 <%         } else if(i == j) {  %>
	                * 
	 <%         } else {  %>
	                # 
	 <%         } %>
	 <%     } %>
	        <br />
	 <% } %>
</body>
</html>












