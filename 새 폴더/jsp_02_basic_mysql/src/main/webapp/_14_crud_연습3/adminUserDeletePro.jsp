<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");

	String dbURL = "jdbc:mysql://localhost:3306/_14_join?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbId, dbPw);
		
		String sql = "DELETE FROM member WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
		pstmt.close();
	}
	
	response.sendRedirect("adminUserList.jsp");
%>
