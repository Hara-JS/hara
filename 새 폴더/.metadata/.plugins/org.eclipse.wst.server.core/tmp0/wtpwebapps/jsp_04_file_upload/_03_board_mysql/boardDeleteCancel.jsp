<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<%
	
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
	%>

<%
	int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/_03_board_mysql?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		
		String sql = " UPDATE board SET board_remove = 0 WHERE board_number = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardNumber);
		pstmt.executeUpdate();	
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){ conn.close();	}
			if(pstmt != null){ pstmt.close(); }
			if(rs != null){ rs.close();	}
		}			
		
	response.sendRedirect("boardMain.jsp");
%>    






