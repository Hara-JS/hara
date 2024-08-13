<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>

	<%
		String log = (String)session.getAttribute("log");	
		System.out.println("header.jsp:"+log);
	%>
	<div align="center">
		<table border="1">
			<tr>
				<%if(log == null){ %>
					<td><a href="index.jsp">완전 초기화</a></td>	
					<td><a href="joinForm.jsp">회원가입</a></td>
					<td><a href="loginForm.jsp">로그인</a></td>
					<td><a href="main.jsp">메인</a></td>
				<%}else {%>
					<td><%= log %>님, 로그인 중</td>
					<td><a href="index.jsp">완전 초기화</a></td>	
					<td><a href="logout.jsp">로그아웃</a></td>
					<td><a href="main.jsp">메인</a></td>
	
				<%} %>
			</tr>
		</table>
	</div>
	
   
	