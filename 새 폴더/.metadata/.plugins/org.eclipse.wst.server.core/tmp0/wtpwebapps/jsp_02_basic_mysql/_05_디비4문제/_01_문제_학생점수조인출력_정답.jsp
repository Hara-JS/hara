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
		/*
			student 배열은 순서대로 ["학생번호", "이름", "성별"] 의 데이터 이고, 
			score 배열은 순서대로 ["학생번호", "국어", "수학"] 의 데이터이다.
			
			String[][] student = {	
					{"1001", "이만수", "남"},
					{"1002", "이영희", "여"},
					{"1003", "김민정", "여"},
					{"1004", "이철민", "남"},
					{"1005", "오만석", "남"},
					{"1006", "최이슬", "여"}
				};
				
				int[][] score = {		
					{1001 , 10, 20},
					{1002 , 70, 30},
					{1003 , 64, 65},
					{1004 , 64, 87},
					{1005 , 64, 80},
					{1006 , 14, 90}
				};
		*/
		/*
			[문제] 
				학생번호 , 이름 , 점수 두개를 출력하시오. 
				단, 국어 점수가 높은순으로 내림차순 정렬하시오.
				국어 점수가 같으면 수학점수가 높은순으로 내림차순정렬하시오.
				
			[정답]
				[1002, 이영희, 70, 30]
				[1005, 오만석, 64, 80]
				[1004, 이철민, 64, 87]
				[1003, 김민정, 64, 65]
				[1006, 최이슬, 14, 90]
				[1001, 이만수, 10, 20]	
	
		*/
		
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		
		int studentSize = 0; 
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db4?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT count(*)  FROM student";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				studentSize  = rs.getInt(1);
			}else{
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
		
		
		
		String[][] studentList = new String[studentSize][2];
		
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db4?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT student_number , name FROM student";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				studentList[i][0] = rs.getInt(1) + "";
				studentList[i][1] = rs.getString(2) ; // 문자열
								
				i += 1;
			}
			
			
			if(i == 0){
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
		
		
		int scoreSize = 0; 
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db4?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT count(*)  FROM score";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				scoreSize  = rs.getInt(1);
			}else{
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
		
		String[][] scoreList = new String[scoreSize][2];
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db4?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT kor , math FROM score";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				scoreList[i][0] = rs.getInt(1) + "";
				scoreList[i][1] = rs.getInt(2) + "";
								
				i += 1;
			}
					
			if(i == 0){
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
		
		//단, 국어 점수가 높은순으로 내림차순 정렬하시오.
		//국어 점수가 같으면 수학점수가 높은순으로 내림차순정렬하시오.
		// 정렬 
		
		String[][] viewList = new String[studentSize][4];
		
		for(int i = 0; i < viewList.length; i++){
			viewList[i][0] = studentList[i][0];
			viewList[i][1] = studentList[i][1];
			viewList[i][2] = scoreList[i][0];
			viewList[i][3] = scoreList[i][1];
		}
		
		
		Arrays.sort(viewList , (a , b)->{
			if(a[2].compareTo(b[2]) < 0) {
				return 1;
			}
			else if(a[2].compareTo(b[2]) > 0) {
				return -1;
			}else {
				if(a[1].compareTo(b[3]) < 0) {
					return 1;
				}
				else if(a[1].compareTo(b[3]) > 0) {
					return -1;
				}else {
					return 0;
				}
			}
		});
		
		%>
		
		
		<div align="center">
		<h3>학생정보</h3>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>국어</td>
				<td>영어</td>
			</tr>
		<% for(int i = 0; i < viewList.length; i++) { %>
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