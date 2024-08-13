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
				아이디가 hello 인 데이터의 번호와 이름만 출력하시오.
			[정답]
				1003 김여신
				
			[설명]
				이번엔 * 로찾은것이 아니라 특정 데이터 number 와 name 만 찾았으므로 데이터가 2개이다. 	
					
				         1번column , 2번column 
			 	1번 row   []
			 	2번 row   [1003]      ['김여신']
		*/
		
		/*
			위 문제가 있을때, hello 를 직접쿼리문에 넣는것은 비효율적인 코드가된다. 
			
			hello 부분을 변수로 변경할수있다. 
		
			변수로 저장할부분을 ? 를 처리한다. 
					
			String sql = "SELECT number , name FROM member where id=? "; 
			pstmt.setString(1, id);
			
			
			patmt 를 통해 ? 자리에 변수를 넣을수있다. ? 가 여러개면 앞에서 부터 순서대로 넣으면된다. 		
	
			
		*/
		
		
		String id = "hello";
		
	
		Connection conn = null;
	
		PreparedStatement pstmt = null;
	
		ResultSet rs = null;
		
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db2?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT number , name FROM member where id=? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery(); 
			if(rs.next()){
				System.out.println(rs.getInt(1) + " ");
				System.out.print(rs.getString(2) + " ");
				
			}else{
				System.out.println("검색결과가 없습니다. ");
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
</body>
</html>