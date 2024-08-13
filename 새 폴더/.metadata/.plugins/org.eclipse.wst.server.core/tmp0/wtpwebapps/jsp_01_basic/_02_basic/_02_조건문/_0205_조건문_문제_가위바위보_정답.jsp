<%@page import="java.util.Random"%>
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
			[1] com은 0~2 사이의 숫자를 랜덤 저장한다. 
			[2] me는  0~2 사이의 숫자를 랜덤 저장한다. 
			[3] 가위, 바위, 보를 0, 1, 2 숫자로 대신 표현한다.
			[4] com과 me를 비교해서 me를 기준으로 "비김" "승리" "패배"를 출력하시오.
	*/
			int com = 0;
			int me = 0;
			
			Random ran = new Random();
			com = ran.nextInt(3);
			me = ran.nextInt(3);
			System.out.println(me + ", " + com);
	%>
		<%=String.format("%d  ,  %d" , me , com) %>
		<hr/>
		
		<%if(me == com){ %>
			<%="비겼다." %>
		<%} %>
		<%if(me == 0 && com == 2){ %>
			<%="이겼다." %>
		<%} %>
		<%if(me == 1 && com == 0){ %>
			<%="이겼다." %>
		<%} %>
		<%if(me == 2 && com == 1){ %>
			<%="이겼다." %>
		<%} %>
		<%if(me == 0 && com == 1){ %>
			<%="졌다." %>
		<%} %>
		<%if(me == 1 && com == 2){ %>
			<%="졌다." %>
		<%} %>
		<%if(me == 2 && com == 0){ %>
			<%="졌다." %>
		<%} %>
	
</body>
</html>