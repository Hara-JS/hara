<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

<%	
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
					
		try{
			
			
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db1?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM basic WHERE c='bye'";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(); 
			
			rs.next();
			
			int a = rs.getInt(1);
			float b = rs.getFloat(2);
			String c = rs.getString(3);
			
			System.out.println(a);
			System.out.println(b);
			System.out.println(c);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			// [중요] db 사용후엔 반드시 닫아줘야한다. 
			
			if(conn != null){
				conn.close();			
			}
			if(pstmt != null){
				pstmt.close();	
			}
			if(rs != null){
				rs.close();
			}
		}
	%>
</body>
</html>