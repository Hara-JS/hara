<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>

  <style>
        table, tr, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        #content-join, #content-login {
            margin: 0 auto;
            width: 600px;
        }
        #title, #joinPro, #loginPro {
            text-align: center;
        }
    </style>
	<%
		String log = (String)session.getAttribute("log");	
		System.out.println("header.jsp:"+log);
	%>
	<div align="center">
		<table border="1">
			<tr>
				<%if(log == null){ %>
					<td><a href="joinForm.jsp">회원가입</a></td>
					<td><a href="loginForm.jsp">로그인</a></td>
					<td><a href="main.jsp">메인</a></td>
				<%}else {%>
					<td><%= log %>님, 로그인 중</td>
					<td><a href="logout.jsp">로그아웃</a></td>
					<td><a href="main.jsp">메인</a></td>
	
				<%} %>
			</tr>
		</table>
	</div>
	
	<br><br><br><br>
   
	