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
				회원전체의 데이터를 출력하시오.
			
			[정답]
				1001 qwer 1234 홍길동
				1002 abcd 1234 박대길
				1003 hello 1234 김여신
				1004 test 1111 민서희
		*/
		
		/*
			이전까지는 결과데이터의 row는 한개였다. 
			회원전체라면 데이터의 모습을 아래와같다. 
			rs.next()를 반복문에 서 실행하면 자연스럽게 row가 1씩 증가하면서 전부 검색할수있다. 
			
			
					 1번column , 2번column , 3번column , 4번column
		 	1번 row  []
		 	2번 row  [1001]      ['qwer']   ['1234']   ['홍길동']
 			3번 row  [1002]      ['abcd']   ['1234']   ['박대길']
			4번 row  [1003]      ['hello']  ['1234']   ['김여신']
			5번 row  [1004]      ['test']   ['1111']   ['민서희']
		*/
	
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
			while(rs.next()){
				System.out.println(rs.getInt(1) + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4)  ); 
				
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