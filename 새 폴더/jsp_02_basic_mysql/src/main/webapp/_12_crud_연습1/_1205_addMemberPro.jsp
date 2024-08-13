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
		
		[회원저장]
			지금까지는 SELECT 만 사용했다. 
			처음으로 INSERT 를 사용해보자
			
			"INSERT member VALUES(? , ?)" 
			
			위 와 같이 쿼리를 작성하고 ? 에 들어갈 값을 순서대로 저장한다.
			
		[주의] 익스큐트쿼리가 익스큐트업데이트로 변경된다. 
		
			쿼리 실행문이 바꿨다. SELECT 에서는 	rs = pstmt.executeQuery(); 이와같이 사용했지만,
			
			
						
			INSERT의 경우는 int result = pstmt.executeUpdate(); 로 바뀐다. 
			
			그리고 쿼리를 실행한후 , 다시전달받은 데이터는 int 형으로 성공시 1 실패시 -1을 자바로 전달해준다. 
			
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
			
			String sql = "INSERT member VALUES(? , ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, name);
		
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
		회원등록을 성공했습니다.
	<%} else{%>
		화원등록을 실패했습니다.
	<%} %>
	<a href="_1205_addMember.jsp">되돌아가기</a>
	
</body>
</html>