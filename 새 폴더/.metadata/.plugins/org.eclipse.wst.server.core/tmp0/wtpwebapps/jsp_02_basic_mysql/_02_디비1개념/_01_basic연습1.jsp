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
	
			[1] lib 폴더에 반드시 jar파일을 첨부한다. 
	
			
			[2] 아래변수3개를 임포트 한다. 
			<%@page import="java.sql.ResultSet"%>
			<%@page import="java.sql.PreparedStatement"%>
			<%@page import="java.sql.Connection"%>
				
			추가로 임포트한개를 더한다. 
			<%@page import="java.sql.DriverManager"%>
			
			순서는 DriverManager 가 컴퓨터에 깔린 mysql 과 연결하고 그연결결과를 
			Connection 에 넘겨준다.
			
			Connection 은 아이디와 비밀번호로 db에 로그인을 한후  SELECT * FROM basic WHERE a=10
			이와같은 쿼리문을 PreparedStatement 에 넘겨준다. 
			
			PreparedStatement 는 쿼리문을 실행시키고 mysql로 접근해 데이터를 추출한후, 
			그 결과 데이터를 ResultSet 에 넘겨준다. 
			
			
			
			디비연결과 같은 작업은 아주 중요한작업이기때문에 반드시 try catch 를 강제적으로 사용해야한다. 
			
			
			디비연결이 끝난후 Connection , PreparedStatement , ResultSet 세개 전부 close를 해야한다.
			디비연결해제느 아주 중요한작업이기때문에 절대로 잊으면안된다. 떄문에
			finally {} 안에 작성하면 무조건실행된다. 
	 --%>

<%	
		
		// [1] db와 연결한고, 쿼리문을 저장한다. [예시] SELECT * FROM basic WHERE a=10
		Connection conn = null;


		// [2] 위의 변수 conn 에게서 쿼리문을 넘겨받고, 쿼리문을 실행할수있다. 
		PreparedStatement pstmt = null;
		
		
		// [3] 쿼리문이 실행되면 db에서 데이터를 다시 자바로 보내주는데 그데이터를 저장하고있다.
		ResultSet rs = null;
		/*
			넘어온데이터는 rs변수에 담겨서오며, 2차원배열형태로 넘어온다. 
			세로를 row 라고하고 , 가로를 column  이라고한다.
		 	넘어온 데이터의 첫번째 row는 비어있다. 
		 	그림으로 표현해보면 아래와 같다. 
		 	
		 			1번column , 2번column , 3번column 
		 	1번 row  []
		 	2번 row  [10]      [1234.45]   ['hello']   
		 	
		*/
		/*
			row이동은 rs.next() 를 사용한다. 
			
			column을 찾을때는 데이터베이스의 자료형을 일치 시켜서 , 앞에서부터 1, 2, 3  순서대로 찾는다.
			rs.getInt(1)    
			rs.getFloat(2)
			rs.getString(3)
		*/
				
		try{
			
			
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db1?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM basic WHERE a=10";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery(); 
			
			rs.next();
			
			int a = rs.getInt(1);
			float b = rs.getFloat(2); // float  이나 double 중 둘다 사용가능하다. 
			//double b = rs.getDouble(2);
			String c = rs.getString(3);
			
			System.out.println(a);
			System.out.println(b);
			System.out.println(c);
			
			
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