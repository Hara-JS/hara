<%@page import="java.util.Arrays"%>
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
	
		int memberSize = 0; // 회원이 몇명인지 체크한다.
					
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_13_student_score?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT count(*) FROM student";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				memberSize = rs.getInt(1);
			
			}
			
			
			if(memberSize == 0){
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
	
		String[][] memberList = new String[memberSize][3];
	
		
			
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_13_student_score?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM student";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int i = 0;
			while(rs.next()){
				memberList[i][0] = rs.getInt(1) + "";// 꼼수;
				memberList[i][1] = rs.getString(2) + "";
				memberList[i][2] = rs.getString(3) + "";		
				i += 1;
			}
			
			
			if(memberSize == 0){
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
		for(int i = 0; i < memberList.length; i++){
			System.out.println(Arrays.toString(memberList[i]));
		}
		
		int scoreSize = 0; // 회원이 몇명인지 체크한다.
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_13_student_score?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT count(*) FROM score";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				scoreSize = rs.getInt(1);		
			}		
			
			if(scoreSize == 0){
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
	
		String[][] scoreList = new String[scoreSize][6];
	
		
			
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
				scoreList[i][0] = rs.getInt(1) + "";// 꼼수;
				scoreList[i][1] = rs.getInt(2) + "";
				scoreList[i][2] = rs.getInt(3) + "";
				scoreList[i][3] = rs.getInt(4) + "";
				scoreList[i][4] = rs.getFloat(5) + "";// 꼼수;				
				scoreList[i][5] = rs.getInt(6) + "";
				i += 1;
			}
			
			
			if(scoreSize == 0){
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
		
		for(int i = 0; i < scoreList.length; i++){
			System.out.println(Arrays.toString(scoreList[i]));
		}
		
		String[][] viewList  = new String[memberSize][13];
		
		for(int i = 0; i < memberSize; i++){
			for(int j = 0; j < scoreSize; j++){
				int memberNumber = Integer.parseInt(memberList[i][0]);
				int scoreNumber = Integer.parseInt(scoreList[j][0]);
				if(memberNumber == scoreNumber){
					viewList[i][0] = memberList[i][0];
					viewList[i][1] = memberList[i][1];
					viewList[i][2] = memberList[i][2];
										
					viewList[i][3] = scoreList[j][1];
					viewList[i][4] = scoreList[j][2];
					viewList[i][5] = scoreList[j][3];
					viewList[i][6] = scoreList[j][4];
					viewList[i][7] = scoreList[j][5];
						
					
				}
			}
		}
	
	%>

	<div align="center">
		<h3>학생과 시험 정보</h3>
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
		<% for(int i = 0; i < viewList.length; i++) { %>
			<tr align="center">
				<td><%= viewList[i][0] %></td>
				<td><%= viewList[i][1] %></td>				
				<td><%= viewList[i][2] %></td>
				
				<td><%= viewList[i][3] %></td>
				<td><%= viewList[i][4] %></td>
				<td><%= viewList[i][5] %></td>
				<td><%= viewList[i][6] %></td>
				
				<td><%= viewList[i][7] %></td>
				
			</tr>
		<%	} %>
			
			<tr align="center">
				<td colspan="11">
					<a href="_1301_main.jsp">메인화면</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>