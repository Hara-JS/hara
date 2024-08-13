<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	[문제]
		거스름돈 (174,900원)을 거슬러줄려고한다.
		단, 일천원짜리는 매진 되어 500원짜리로 거슬러준다면,
		각 단위별로 몇장씩 나눠줘야하는가?
	[정답]
		오만원  : 3 , 일만원  : 2 , 오천원 : 0 , 
		일천원  : 0 , 오백원  : 9 , 일백원 : 4
--%>

<%
	int money = 174900;
	
	int fiftyThous = money / 50000;
	int tenThous = money % 50000 / 10000;
	int fiveThous = money % 10000 / 5000;
	int fiveHund = money % 5000 / 500;
	int oneHund = money % 500 / 100;
%>

<h2>오만원 = <%= fiftyThous %></h2>
<h2>일만원 = <%= tenThous %></h2>
<h2>오천원 = <%= fiveThous %></h2>
<h2>일천원 = <%= 0 %></h2>
<h2>오백원 = <%= fiveHund %></h2>
<h2>일백원 = <%= oneHund %></h2>