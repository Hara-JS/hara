<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
	%>

	<%
	request.setCharacterEncoding("UTF-8");

	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int reStep = Integer.parseInt(request.getParameter("reStep"));
	int reLevel = Integer.parseInt(request.getParameter("reLevel"));
	
	%>
	
	<% 
		// 수정 level 수정 
		System.out.println(boardNumber + " " + reLevel);
	
	try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_03_board_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = " UPDATE board SET board_level = board_level + 1 WHERE board_ref = ? AND board_level > ? ";
			
	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, reLevel);
			
			
			pstmt.executeUpdate();
							
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(conn != null){ conn.close();	}
				if(pstmt != null){ pstmt.close(); }
				if(rs != null){ rs.close();	}
			}
	
	
		%>    
	
	
	<% 
		 try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_03_board_mysql?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = " INSERT INTO board ";
			sql +=	" VALUES(0, ?, ?, ?, now() , ? , ?, ?, ?, ?) ";
	
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,writer);
			pstmt.setString(2,subject);
			pstmt.setString(3,content);
			pstmt.setInt(4,0);
			pstmt.setInt(5,ref);
			pstmt.setInt(6,reStep + 1);
			pstmt.setInt(7,reLevel + 1);
			
			pstmt.setInt(8,0);
			
			pstmt.executeUpdate();
							
			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(conn != null){ conn.close();	}
				if(pstmt != null){ pstmt.close(); }
				if(rs != null){ rs.close();	}
			}
	%>    

	











