<%@page import="java.util.Arrays"%>
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
		        arr배열의 각 값의 약수를 전부 출력하고 
		        각 약수의 개수를 count배열에 추가하시오.
		    [정답]
		        1 43 
		        1 5 11 55 
		        1 5 13 65 
		        1 11 		
		        count = 2, 4, 4, 2
		*/	
		
	    int[] arr = {43, 55, 65, 11};
	    int[] count = new int[4];
	%>
	
	<%
	    for(int i=0; i<arr.length; i++) {
	
	        int total = 0;
	        for(int j=1; j<=arr[i]; j++) {
	            if(arr[i] % j == 0) {
	 %>
	                <%= j %>
	 <%
	                total += 1;
	            }
	        }
	        count[i] = total;
	 %>
	 		<br />
	 		
	 <%   }	 %>
	 count = <%= Arrays.toString(count) %>
</body>
</html>