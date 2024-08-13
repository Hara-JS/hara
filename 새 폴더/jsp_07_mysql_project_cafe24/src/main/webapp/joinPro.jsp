<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");

	Connection conn = null;	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;
	
	
	try{
		/*
			String jdbcUrl = "jdbc:mysql://localhost:3306/cafe24호스팅아이디?serverTimezone=UTC&useSSL=false"                           
			String dbId = "cafe24호스팅아이디"
			String dbPw = "FTP,DB비밀번호"		
		*/
		String jdbcUrl = "jdbc:mysql://localhost:3306/hara1029?serverTimezone=UTC&useSSL=false";
		String dbId = "hara1029";
		String dbPw = "q1w2e3r4!";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		
		String sql = "INSERT INTO member0620 VALUES(?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null){ conn.close();	}
		if(pstmt != null){ pstmt.close(); }
	}
	
	response.sendRedirect("memberList.jsp");
%>    