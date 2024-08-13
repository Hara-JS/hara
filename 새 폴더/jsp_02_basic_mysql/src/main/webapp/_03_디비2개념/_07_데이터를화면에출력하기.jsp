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
			[문제]
				회원전체의 데이터를 브라우저화면에 출력하시오.					
			[정답]
				1001 qwer 1234 홍길동
				1002 abcd 1234 박대길
				1003 hello 1234 김여신
				1004 test 1111 민서희
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
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db2?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				viewList[i][0] = rs.getInt(1) + "";// 꼼수;
				viewList[i][1] = rs.getString(2);
				viewList[i][2] = rs.getString(3);
				viewList[i][3] = rs.getString(4);
				
				System.out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4)  ); 
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
		<h3>회원목록</h3>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>패스워드</td>
				<td>이름</td>
				<td>가입일</td>
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