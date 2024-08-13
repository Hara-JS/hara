<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
	 [문제]
		 1. 1~50까지 반복을 한다.
		 2. 그 안에서 해당 숫자의 369게임의 결과를 출력한다.		  
		 3. 각각의 숫자에 3이나 6이나 9가 두개 면 "짝짝"
		 4. 각각의 숫자에 3이나 6이나 9가 한개 면 "짝"
		 5. 3이나 6이나 9가 없으면 그냥 숫자출력 
		  
		  예) 1 2 짝 4 5 짝 7 8 짝 10 11 12 짝 ...
--%>

<%
	for(int i=1; i<=50; i++) {
		
		int tens = i / 10;
		int units = i % 10;
		
		int count = 0;
		if(tens == 3 || tens == 6 || tens == 9) {
			count += 1;
		}
		if(units == 3 || units == 6 || units == 9) {
			count += 1;
		}
		
		if(count == 2) {
%>
			짝짝<br>
<%			
		} else if(count == 1) {
%>
			짝<br>
<%
		} else {
%>
			<%= i %><br>
<%
		}
	}
	
%>