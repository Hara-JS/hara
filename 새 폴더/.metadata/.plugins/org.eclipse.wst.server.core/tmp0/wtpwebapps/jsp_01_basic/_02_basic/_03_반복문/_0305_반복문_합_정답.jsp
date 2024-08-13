<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%--
	 [문제] 1~5까지의 합을 출력하시오.  1 + 2 + 3 + 4 + 5
	 [정답] 15
--%>

<%
	int total = 0;

	for(int i=1; i<=5; i++) {
		total += i;		
	}
%>

<h2><%= total %></h2>