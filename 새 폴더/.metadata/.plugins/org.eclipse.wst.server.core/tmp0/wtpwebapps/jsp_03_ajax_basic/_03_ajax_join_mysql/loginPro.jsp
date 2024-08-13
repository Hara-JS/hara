<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	%>
	
	<%
	Connection conn = null;	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;
	
	int check = -1;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/_03_ajax_join_mysql?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		
		String sql = "SELECT * FROM member WHERE member_id = ? AND member_pw = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			check = 1;
			
			session.setAttribute("log", id);
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null){ conn.close();	}
		if(pstmt != null){ pstmt.close(); }
		if(rs != null){ rs.close();	}
	}	
	
	%>

<p id="check"><%= check %>