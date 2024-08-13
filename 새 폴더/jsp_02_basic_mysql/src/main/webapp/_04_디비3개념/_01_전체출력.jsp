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
			[문제]
				회원전체의 데이터를 브라우저화면에 출력하시오.					
		*/
		
		/*
			위데이터를 화면에 출력하기 위해서는 배열에 담아야한다.
		*/
		
		String[][] viewList = new String[1000][4];
		int viewSize = 0; // 회원이 몇명인지 체크한다.
	
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
			
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db3?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM student";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				viewList[i][0] = rs.getInt(1) + "";// 꼼수;
				viewList[i][1] = rs.getInt(2) + "";
				viewList[i][2] = rs.getInt(3) + "";
				viewList[i][3] = rs.getInt(4) + "";
				
				System.out.println(rs.getInt(1) + " " + rs.getInt(2) + " " + rs.getInt(3) + " " + rs.getInt(4)  ); 
				i += 1;
			}
			
			viewSize = i;
			
			if(viewSize == 0){
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
				<td>번호</td>
				<td>국어</td>
				<td>수학</td>
				<td>영어</td>
			</tr>
		<% for(int i = 0; i < viewSize; i++) { %>
			<tr>
				<td><%= viewList[i][0] %></td>
				<td><%= viewList[i][1] %></td>
				<td><%= viewList[i][2] %></td>
				<td><%= viewList[i][3] %></td>
			</tr>
		<%	} %>
		</table>
	</div>
		
</body>
</html>