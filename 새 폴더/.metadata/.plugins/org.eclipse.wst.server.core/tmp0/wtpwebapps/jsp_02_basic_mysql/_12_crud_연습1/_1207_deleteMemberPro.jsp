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
		
		[회원삭제]
			String sql = "DELETE FROM member WHERE member_number=?";
	 --%>


	<%
		String str = request.getParameter("memberNumber");
		int number = Integer.parseInt(str);
		
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
			
		boolean check = false;
		String [] member =new String[2];
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_12_member?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "DELETE FROM member WHERE member_number=?";
			pstmt = conn.prepareStatement(sql);
			// 순서를 잘생각해야한다.
			pstmt.setInt(1, number);
		
			int result = pstmt.executeUpdate();
			if(result == 1){
				check = true;
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
	<%if(check){ %>
		회원삭제를 성공했습니다.
	<%} else{%>
		화원삭제를 실패했습니다.
	<%} %>
	<a href="_1207_deleteMember.jsp">되돌아가기</a>
	
</body>
</html>