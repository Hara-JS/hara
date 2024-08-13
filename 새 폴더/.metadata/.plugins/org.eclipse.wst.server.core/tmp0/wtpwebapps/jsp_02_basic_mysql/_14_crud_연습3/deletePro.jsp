<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("log");
	String myPw = request.getParameter("pw");
	
	String dbURL = "jdbc:mysql://localhost:3306/_14_join?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int check = -1;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbId, dbPw);
		
		String sql = "SELECT pw FROM member WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String memberPw = rs.getString(1);
			if(memberPw.equals(myPw)) {
				check = 1;
			}
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
		pstmt.close();
		rs.close();
	}

	System.out.println("[deletePro] check = " + check);
	
	if(check == -1) {
		response.sendRedirect("deleteForm.jsp");
	} else {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbId, dbPw);
			
			String sql = "DELETE FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			session.invalidate();			
			response.sendRedirect("index.jsp");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
			pstmt.close();
		}
	}
%>










