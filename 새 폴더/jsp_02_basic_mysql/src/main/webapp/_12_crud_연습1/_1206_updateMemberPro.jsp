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
		
		[회원수정]
			String sql = "UPDATE member set member_name=? WHERE member_number=?";
			
		[주의]
			데이터를 순서대로 넣어야하니 name 이 1번이고 number가 2번이다. 
	 --%>


	<%
		String str = request.getParameter("memberNumber");
		int number = Integer.parseInt(str);
		String name = request.getParameter("memberName");
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
			
		boolean check = false;
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_12_member?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "UPDATE member SET member_name=? WHERE member_number=?";
			pstmt = conn.prepareStatement(sql);
			// 순서를 잘생각해야한다.
			pstmt.setString(1, name);
			pstmt.setInt(2, number);
		
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
		회원수정을 성공했습니다.
	<%} else{%>
		화원수정을 실패했습니다.
	<%} %>
	<a href="_1206_updateMember.jsp">되돌아가기</a>
	
</body>
</html>