<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
	[문제]
	 	철수와 영희는 50,000원 을 가지고있다. 
	 	철수와 영희는 같이 영화 1편을 봤다.
	 	간식은 팝콘1개와 콜라 2개를 사먹었다.
		남은돈은 얼마인가?
		
	 	. 콜라1개는 팝콘1개 보다 4,000원 싸다.
	 	. 영화 1편의 가격은 12,000 원이다.
	 	. 팝콘의 가격은 영화의 0.6 가격이다.		
	
	[정답]
		12,400원
--%>

<%
	double money = 50000;

	double moviePrice = 12000;
	double popcornPrice = moviePrice * 0.6;
	double cockPrice = popcornPrice - 4000;
	
	double total = moviePrice * 2 + popcornPrice + cockPrice * 2;
	
	money -= total;
	
	String strMoney = String.format("%.0f", money);
%>

<h2>잔돈 = <%= strMoney %>원</h2>