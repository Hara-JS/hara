<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
		
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String dbURL = "jdbc:mysql://localhost:3306/_14_join?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	int check = 0;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbId, dbPw);
		
		String sql = "SELECT COUNT(*) FROM member WHERE id=? AND pw=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			check = rs.getInt(1);
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
		pstmt.close();
		rs.close();
	}
	
	System.out.println("[loginPro] check = " + check);
	
	if(check > 0) {
			session.setAttribute("log", id);
			// setMaxInactiveInterval() 메서드는 초 단위
			// 60초(1분) * 100 = 100분
			// 세션의 유효시간을 100분으로 설정하여,
			// 100분 이후에는 자동으로 세션이 삭제된다.
			session.setMaxInactiveInterval(100 * 60);
			
			response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("loginForm.jsp");
	}
	
%>