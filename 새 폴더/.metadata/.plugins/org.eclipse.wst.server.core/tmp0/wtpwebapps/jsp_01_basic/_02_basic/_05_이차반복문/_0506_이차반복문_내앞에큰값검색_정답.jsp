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
		        각각의 배열의 값들이 배열전체의 값들과 비교하면서 현재값의 앞에 위치한 값들만 출력하시오.
		        단, 내앞의 값둘중 나보다 큰값들만 출력하시오.
		    [정답]
		        =10
		        =20
		        =30
		        =40
		        40 =30
		        20 30 40 30 =10
		        =50
		        =60
		*/
		
		int[] arr = {10, 20, 30, 40, 30, 10, 50, 60};
	%>
	
	<%
	    for(int i = 0; i<arr.length; i++) {
	        int a = arr[i];
	        
	        for(int j = 0; j < i; j++){
	
	            int b = arr[j];
	
	            if(a < b){
	 %>
	                <%= arr[j] %>
	 <%
	            }       
	        }
	  %>
	  	= <%= arr[i] %> <br />
	  <% } %>
</body>
</html>







