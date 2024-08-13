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
	<%--
	골프장1 정답을 완성하시오.
	 --%>
	 
	 <%
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
			

		int teatcherSize = 0; 

		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_11_golf?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT COUNT(*) FROM tbl_teacher_202201";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				teatcherSize  = rs.getInt(1);
			}else{
				System.out.println("검색데이터가 없습니다.");
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
	 
		
		String[][] teacherList = new String[teatcherSize][5];
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_11_golf?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM tbl_teacher_202201";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int i = 0;
			while(rs.next()){
				teacherList[i][0] = rs.getString(1);
				teacherList[i][1] = rs.getString(2);
				teacherList[i][2] = rs.getString(3);
				teacherList[i][3] = rs.getInt(4) + "";
				
				String date = rs.getString(5);
				String year = date.substring(0, 4);
				String month = date.substring(4, 6);
				String day = date.substring(6, 8);
				teacherList[i][4] = year + "년 " + month + "월 " + day + "일";
				
				i += 1;
			}
			
			if(i == 0){
				System.out.println("검색데이터가 없습니다.");
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
	 	<h3>강사조회</h3>
	 	<table border="1">
	 		<tr>
	 			<td>강사코드</td>
	 			<td>강사명</td>
	 			<td>강의명</td>
	 			<td>수강료</td>
	 			<td>강사자격취득일</td>
	 		</tr>
	 	<% for(int i=0; i<teacherList.length; i++) { %>
	 		<tr>
	 			<td><%= teacherList[i][0] %></td>
	 			<td><%= teacherList[i][1] %></td>
	 			<td><%= teacherList[i][2] %></td>
	 			<td><%= teacherList[i][3] %></td>
	 			<td><%= teacherList[i][4] %></td>
	 		</tr>
	 	<% } %>
	 	</table>
	 </div>
</body>
</html>