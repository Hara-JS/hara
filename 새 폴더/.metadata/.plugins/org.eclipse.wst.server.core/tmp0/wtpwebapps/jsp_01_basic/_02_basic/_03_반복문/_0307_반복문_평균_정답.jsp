<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
	[문제]
   	    철수는 두번의 시험에서 각각 80점과 72점을 받았다.
	    세 번째 시험에서 최소 몇 점이상을 받아야 	        
	    세번의 시험성정의 평균이 82점이상이 될수 있을까?
	[정답]
		94점
--%>

<%
	int score1 = 80;
	int score2 = 72;
	int score3 = 0;
	
	while(true) {
		int total = score1 + score2 + score3;
		double avg = total / 3.0;
		
		if(avg >= 82) {
			break;
		}
		score3 += 1;
	}
%>

<h2><%= score3 %>점</h2>