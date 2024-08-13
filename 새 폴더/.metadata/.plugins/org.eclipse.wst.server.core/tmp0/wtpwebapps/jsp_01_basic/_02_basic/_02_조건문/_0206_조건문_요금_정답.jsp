<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
	[문제]
		택시 기본요금은 10,000원입니다.			  		
		기본 요금으로는 10km까지 이동 가능합니다. 					
		10km이상 이동시 추가요금이 발생합니다. 					
		추가요금은 3km이동 할때마다 2,300원씩 요금이 추가됩니다.							
		23km 이동거리의 총요금을 출력하시오.
	[정답]
		21,500원		
--%>

<%
	int basicFare = 10000;
	int basicDistance = 10;
	
	int addFare = 2300;
	int addDistance = 3;
	
	int distance = 23;
	
	int total = basicFare;
	if(distance > 10) {
		int addMove = (distance - basicDistance) / addDistance;
		
		if((distance - 10) % addDistance != 0) {
			addMove += 1;
		}
		
		total += addMove * addFare;
	}
%>
<h2>총 요금 = <%= total %>원</h2>