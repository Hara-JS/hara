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
	String id = (String)session.getAttribute("log");

	String dbURL = "jdbc:mysql://localhost:3306/_14_join?serverTimezone=UTC&useSSL=false";
	String dbId = "root";
	String dbPw = "root";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String pw = "";
	String name = "";
	String gender = "";

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbId, dbPw);
		
		String sql = "SELECT pw, name, gender FROM member WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			pw = rs.getString(1);
			name = rs.getString(2);
			gender = rs.getString(3);
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
		<h1>회원정보 수정</h1>
		<form method="post" action="updatePro.jsp">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><%= id %></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="pw" value="<%= pw %>"></td>				
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= name %>"></td>				
				</tr>
				<tr>
					<td>성별</td>
					<td>
					<%
						if(gender.equals("남성")) {
					%>
						<input type="radio" name="gender" value="남성" checked="checked">남성
						<input type="radio" name="gender" value="여성">여성
					<%
						} else {
					%>
						<input type="radio" name="gender" value="남성">남성
						<input type="radio" name="gender" value="여성" checked="checked">여성
					<%
						}
					%>
					</td>	
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="입력완료">
					</td>
				</tr>
			</table>
		</form>	
		<br><br>
		<input type="button" value="메인화면" onclick="window.location.href='index.jsp'">	
	</div>
</body>
</html>