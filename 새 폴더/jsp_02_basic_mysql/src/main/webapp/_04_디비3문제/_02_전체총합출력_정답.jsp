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
		/*
			[학생정보]
				int[][] student = {
				    {1001, 100, 20, 32},         // 152
				    {1002,  40, 43, 12},         // 95
				    {1003,  60, 21, 42},         // 123
				    {1004,  76, 54, 55},         // 185
				    {1005,  23, 11, 76}          // 110
				};	

			위와같은 데이터의 디비를 생성해보자.
		
			[문제]
					전체과목의 총합을 출력하시오.			
		*/
		
		int total = 0;
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
			
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db3?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT sum(kor) + sum(math) + sum(eng) FROM student";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				total = rs.getInt(1);
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
	%>
	<div align="center">
		<h3>학생정보</h3>
		<table border="1">
			<tr>
				<td>전체총합</td>
				
			</tr>
		
			<tr>
				<td><%= total %></td>
				
			</tr>
		
		</table>
	</div>
		
</body>
</html>