<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	[문제]
		철수와 영희는 가위바위보 게임을 하고있다. 
		규칙은 아래와같다.			
		이기면 계단을 3칸 올라간다.
		지면  계단을 1칸 내려간다.
		비기면 아무일도 생기지않는다. 
		계단은 총 100계단이다. 
	
		50번째 계단에서 게임을 시작한다.			
		철수는 4번이기고 2번졌다.
		철수의 현재위치를 구하시오.
	[정답]
		60
--%>

<%
	int position = 50;
	position = position +  3 * 4;
	position = position - 1 * 2;
%>

<h2>철수의 현재위치 = <%= position %></h2>