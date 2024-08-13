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
				
				String sql = "SELECT * FROM student WHERE student_number=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, number);
				rs = pstmt.executeQuery();
				if(rs.next()){
					student[0] = rs.getInt(1) + "";
					student[1] = rs.getString(2);
					student[2] = rs.getString(3) ;
				}
				else{
					System.out.println("검색데이터가 없습니다.");
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
			
			
			System.out.println(student[0]);
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_13_student_score?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = "SELECT * FROM score WHERE student_number=?"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, number);
				rs = pstmt.executeQuery();
				
				
				if(rs.next()){
					student[3] = rs.getInt(2) + "";
					student[4] = rs.getInt(3) + "";
					student[5] = rs.getInt(4) + "";
					student[6] = rs.getFloat(5) +"";
					student[7] = rs.getInt(6) +"";
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
		<h3>학생정보</h3>
		<table border="1">
			<tr align="center">
				<td>번호</td>
				<td>이름</td>
				<td>성별</td>
				<td>국어</td>
				<td>수학</td>
				<td>총합</td>
				<td>평균</td>
				<td>등수</td>
			</tr>
			<tr align="center">
		<% for(int i = 0; i < student.length; i++) { %>
				<td><%= student[i] %></td>
			
		<%	} %>
			</tr>
			
			<tr align="center">
				<td colspan="11">
					<a href="_1301_main.jsp">메인화면</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>