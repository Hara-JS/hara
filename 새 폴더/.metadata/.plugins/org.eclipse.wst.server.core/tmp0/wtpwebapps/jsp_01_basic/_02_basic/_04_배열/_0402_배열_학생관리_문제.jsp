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
		        numbers배열은 학생 다섯 명의 번호이다.
		        scores배열은 위 학생들의 수학 점수이다.
		        60점 이상은 합격이다.
		        [조건1] 전체학생들의 번호와 점수를 추력하시오.
		        [조건2] 합격한학생은 "[합격]" , 불합격한학생은 "[불합격]" 을  점수옆에 출력하시오.
		        [조건3] 전체 학생들의 점수와 평균을 출력하시오.
		        [조건4] 합격생들이 몇 명인지를 출력하시오.
		    [정답]
		        1001번 10점 [불합격]
		        1002번 32점 [불합격]
		        1003번 65점 [합격]
		        1004번 90점 [합격]
		        1005번 89점 [합격]
		        합격생 수 = 3명
		        총점 = 286점, 평균 = 57.2점
		*/
		
		int[] numbers = {1001, 1002, 1003, 1004, 1005};
		int[] scores  = {  10,   32,   65,   90,   89};
		int size = numbers.length;
		
	    double total = 0;
	    double avg = 0;
	
	    int count = 0;
	%>
	
</body>
</html>