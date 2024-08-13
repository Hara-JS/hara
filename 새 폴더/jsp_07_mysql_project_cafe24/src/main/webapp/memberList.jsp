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
	<style>
		table {
			width: 350px;
			border-collapse: collapse;
			border-bottom: 1px solid black;
			text-align: center;
		}
		table th {
			background-color: blue;
			color: white;
			height: 30px;
		}
		a {
			text-decoration: none;
			color: black;
		}
		a:hover {
			color: blue;
		}		
	</style>
</head>
<body>
<%
	int memberSize = 0;
	String[] memberIdList = new String[1000];
	String[] memberPwList =  new String[1000];
	String[] memberNameList =  new String[1000];
%>    

<%
	Connection conn = null;	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;
	
	
	try{
		/*
			String jdbcUrl = "jdbc:mysql://localhost:3306/cafe24호스팅아이디?serverTimezone=UTC&useSSL=false"                           
			String dbId = "cafe24호스팅아이디"
			String dbPw = "FTP,DB비밀번호"		
		*/
		String jdbcUrl = "jdbc:mysql://localhost:3306/hara1029?serverTimezone=UTC&useSSL=false";
		String dbId = "hara1029";
		String dbPw = "q1w2e3r4!";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		
		String sql = "SELECT * FROM member0620";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			memberIdList[memberSize] = rs.getString(1);
			memberPwList[memberSize] = rs.getString(2);
			memberNameList[memberSize] = rs.getString(3);
			memberSize += 1;
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null){ conn.close();	}
		if(pstmt != null){ pstmt.close(); }
		if(rs != null){ rs.close();	}
	}
%>

	<div align="center">
		<h1><a href="index.jsp">CAFE24 호스팅 연습예제</a></h1>
		<h3>회원 목록</h3>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
			</tr>
		<% for(int i=0; i<memberSize; i++) { %>
			<tr>
				<td><%= memberIdList[i] %></td>
				<td><%= memberPwList[i] %></td>
				<td><%= memberNameList[i] %></td>
			</tr>
		<% } %>
		</table>
	</div>

</body>
</html>