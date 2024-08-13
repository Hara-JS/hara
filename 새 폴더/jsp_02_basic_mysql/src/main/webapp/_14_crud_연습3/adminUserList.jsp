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
	String dbURL = "jdbc:mysql://localhost:3306/_14_join?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int count = 0;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbId, dbPw);
		
		String sql = "SELECT COUNT(*) FROM member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt(1);
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
		pstmt.close();
		rs.close();
	}
	
	String[] idList = new String[count];
	String[] pwList = new String[count];
	String[] nameList = new String[count];
	String[] genderList = new String[count];
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbId, dbPw);
		
		String sql = "SELECT * FROM member"; 
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		int index = 0;
		while(rs.next()) {
			idList[index] = rs.getString(1);
			pwList[index] = rs.getString(2);
			nameList[index] = rs.getString(3);
			genderList[index] = rs.getString(4);
			
			index += 1;
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		conn.close();
		pstmt.close();
		rs.close();
	}
%>

	<div align="center">
		<h1>관리자 페이지(회원 정보 확인하기)</h1>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>패스워드</td>
				<td>이름</td>
				<td>성별</td>
				<td>삭제</td>
			</tr>
		
		<%
			for(int i=0; i<count; i++) {
		%>
			<tr>
				<td><%= idList[i] %></td>
				<td><%= pwList[i] %></td>
				<td><%= nameList[i] %></td>
				<td><%= genderList[i] %></td>
				<td><input type="button" value="삭제" onclick="location.href='adminUserDeletePro.jsp?id=<%= idList[i] %>'"></td>
			</tr>
		<%		
			}
		%>
		</table>
		
		<br><br>
		
		<input type="button" value="관리자페이지" onclick="location.href='adminMain.jsp'">
	</div>
</body>
</html>