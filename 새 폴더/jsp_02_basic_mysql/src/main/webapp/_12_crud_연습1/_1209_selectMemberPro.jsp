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
		boolean check = false;
		String [] member =new String[2];

		String str = request.getParameter("memberNumber"); 
		if(str != null){
			int number = Integer.parseInt(str); // int는 형변환을 해야한다. 
			
			Connection conn = null;	
			PreparedStatement pstmt = null;	
			ResultSet rs = null;
				
		
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_12_member?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = "SELECT *  FROM member WHERE member_number=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, number);
				rs = pstmt.executeQuery();
				
				
				if(rs.next()){
					check = true;
					member[0] = rs.getInt(1) + "";
					member[1] = rs.getString(2);
				}
				
				else{
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
		}
		
		
	%>
	
	<h3>검색결과</h3>
	<% if(check){%>
	
		<%=member[0] %>
		<%=member[1] %>
	<%}else{ %>
		회원정보가 없습니다. 
	<%} %>
	
	<a href="_1209_selectMember.jsp">되돌아가기</a>
</body>
</html>