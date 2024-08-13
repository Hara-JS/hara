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
			student배열은 이번 학기 중간고사 성적이다.
			가로 한 줄을 기준으로 맨 앞은 번호이고, 뒤에 숫자 3개는
			각각 국어, 수학, 영어 점수이다. 
		*/
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
				회원전체의 데이터를 브라우저화면에 출력하시오.					
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
			
			String sql = "SELECT sum(kor) FROM student";
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
				<td>국어총합</td>
				
			</tr>
		
			<tr>
				<td><%= total %></td>
				
			</tr>
		
		</table>
	</div>
		
</body>
</html>