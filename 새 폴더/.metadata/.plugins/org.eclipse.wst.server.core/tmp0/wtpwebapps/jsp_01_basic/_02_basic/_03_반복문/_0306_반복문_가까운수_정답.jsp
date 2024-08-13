<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%--
	[문제] 
		1 에서 200 사이의 숫자중 다음 조건에 전부 맞는 숫자를 출력하시오.
	   	[조건1] 6의 배수를출력
	    [조건2] 100에 가장가까운 수를 출력 
	[정답]
		102	
--%>

<%
	int firstAns = 0;
	for(int i=1; i<=200; i++) {
		if(i % 6 == 0 && i < 100) {
			firstAns = i;
		}
	}
	
	int secondAns = firstAns + 6;
	
	int firstRes = 100 - firstAns;
	if(firstAns > 100) {
		firstRes = firstAns - 100;
	} 
	
	int secondRes = 100 - secondAns;
	if(secondAns > 100){
		secondRes = secondAns - 100;
	}
	
	System.out.println("fristRes = " + firstRes);
	System.out.println("secondRes = " + secondRes);
	
	if(firstRes < secondRes) {
%>
		<h2><%= firstAns %></h2>
<%
	} else {
 %>
		<h2><%= secondAns %></h2>
 <%
	}
 %>