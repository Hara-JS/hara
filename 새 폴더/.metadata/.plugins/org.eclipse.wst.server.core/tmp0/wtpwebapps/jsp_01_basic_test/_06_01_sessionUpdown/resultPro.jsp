<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
session.setAttribute("cheat", 1);

Object obj = session.getAttribute("com");
int com = (int) obj;
%>

com = <%=com %>

<a href="updownGame.jsp"><input type="button" value="뒤로 가기"></a>