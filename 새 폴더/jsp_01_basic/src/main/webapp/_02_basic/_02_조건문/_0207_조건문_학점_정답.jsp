<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
	[문제]
	  	아래 score 시험점수에 해당하는 학점을 출력하시오.
	  	아래는 점수표이다.
	  	
	  	[점수표]
  		100~91 이면 A학점,
  		90~81  이면 B학점,
 		80이하는 "재시험"
	  		
  		단, 만점이거나, A학점과 B학점의 일의 자리가 7점이상이면 + 추가하시오.
  		A학점과 B학점의 일의 자리가 3점이하이면 - 추가하시오.	
  		
  		점수가 92점일 경우의 학점을 얼마인지 구하시오.
  	[정답]
  		A-
--%>

<%
	int score = 100;
%>

<%
	int units = score % 10;
	
	String result = "";
	if(score == 100) {
		result = "A+";
	} else if(91 <= score && score < 100) {
		result = "A";
		if(units >= 7) {
			result += "+";
		}else if(units <= 3){
			result += "-";
		}
	} else if(81 <= score && score <= 90) {
		result = "B";
		if(units >= 7) {
			result += "+";
		}else if(units <= 3){
			result += "-";
		}
	} else if(score <= 80) {
		result = "재시험";
	}
%>

<h2>결과 = <%= result %></h2>