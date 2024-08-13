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
		int studentNumber = Integer.parseInt(request.getParameter("studentNumber"));
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		if(gender.compareTo("male") == 0) {
			gender = "남";
		} else if(gender.compareTo("female") == 0) {
			gender = "여";
		}

		int kor = Integer.parseInt(request.getParameter("kor"));
		int math = Integer.parseInt(request.getParameter("math"));
	
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		boolean check1 = false;
		boolean check2 = false;
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_13_student_score?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "INSERT student VALUES(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, studentNumber);
			pstmt.setString(2, name);
			pstmt.setString(3, gender);
			int result = pstmt.executeUpdate();
			if(result == 1) {
				check1 = true;
			}
					
		}catch(Exception e){
			e.printStackTrace();
		}finally{
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
			
			String sql = "INSERT score VALUES(?,?,?,0,0,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, studentNumber);
			pstmt.setInt(2, kor);
			pstmt.setInt(3, math);
			int result = pstmt.executeUpdate();
			if(result == 1) {
				check2 = true;
			}
					
		}catch(Exception e){
			e.printStackTrace();
		}finally{
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
	
	<div align="center">
		<%if(check1 && check2){ %>
			입력이 완료되었습니다.
		<%} else{%>
			입력이 실패했습니다. 
		<%} %>
		
		<a href="_1301_main.jsp">메인화면</a>
	</div>
	
</body>
</html>