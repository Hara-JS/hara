<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	session.setAttribute("cheat", 1); 
	
	Object obj = session.getAttribute("com");
	int com = (int)obj;
%>
<h2>com = <%= com %></h2>

<a href="updownGame.jsp">뒤로가기</a>
