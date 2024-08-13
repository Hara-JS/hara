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
		String[][] viewList = new String[1000][6];
		int viewSize = 0; // 회원이 몇명인지 체크한다.
	
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
			
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_13_student_score?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM score";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				viewList[i][0] = rs.getInt(1) + "";// 꼼수;
				viewList[i][1] = rs.getInt(2) + "";
				viewList[i][2] = rs.getInt(3) + "";
				viewList[i][3] = rs.getInt(4) + "";
				viewList[i][4] = rs.getFloat(5) + "";// 꼼수;
				viewList[i][5] = rs.getInt(6) + "";
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
		<h3>점수정보</h3>
		<table border="1">
			<tr align="center">
				<td>번호</td>
				
				<td>국어</td>
				<td>수학</td>
				<td>총합</td>
				<td>평균</td>
				<td>등수</td>
			</tr>
		<% for(int i = 0; i < viewSize; i++) { %>
			<tr align="center">
				<td><%= viewList[i][0] %></td>
				<td><%= viewList[i][1] %></td>
				<td><%= viewList[i][2] %></td>
				<td><%= viewList[i][3] %></td>
	
				<td><%= viewList[i][4] %></td>
				<td><%= viewList[i][5] %></td>
			</tr>
		<%	} %>
			
			<tr align="center">
				<td colspan="6">
					<a href="_1301_main.jsp">메인화면</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>