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
		
		String str = request.getParameter("studentNumber");
		String[] student = new String[8];
		
		boolean check1 = false;
		boolean check2 = false;
		
		if(str != null && str.compareTo("") != 0){
			
			int number = Integer.parseInt(str);
			
			System.out.println(number);
		
			Connection conn = null;	
			PreparedStatement pstmt = null;	
			ResultSet rs = null;
				
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_13_student_score?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = "DELETE FROM student WHERE student_number=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, number);
				int result = pstmt.executeUpdate();
				if(result == 1) {
					check1 = true;
				}
						
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
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_13_student_score?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = "DELETE FROM score WHERE student_number=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, number);
				int result = pstmt.executeUpdate();
				if(result == 1) {
					check2 = true;
				}
						
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
			
		}
	%>
	
	<div align="center">
		<%if(check1 && check2){ %>
			삭제가 완료되었습니다.
		<%} else {%>
			삭제가 실패했습니다. 
		<%} %>
		
		<a href="_1301_main.jsp">메인화면</a>
	</div>
	
</body>
</html>