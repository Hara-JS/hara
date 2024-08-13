<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
			 String[][] memberList = {
		        {"3001","이만수"},
		        {"3002","김철민"},
		        {"3003","이영희"},
		        {"3004","조성아"},
		        {"3005","박민재"},
		        {"3006","유재석"}
		    };
	
		    String[][] itemList = {
		        {"100001", "고래밥"},
		        {"100002", "새우깡"},
		        {"100003", "감자깡"},
		        {"100004", "칸쵸"},
		        {"100005", "오징어땅콩"},
		        {"100006", "빼빼로"},
		        {"100007", "고구마깡"},
		        {"100008", "포카칩"}
		    };
	
		    int[][] orderList = {
		        {3001, 100001},
		        {3001, 100002},
		        {3003, 100001},
		        {3002, 100007},
		        {3003, 100006},
		        {3005, 100007},
		        {3002, 100001},
		        {3001, 100003},
		        {3003, 100002},
		        {3001, 100001},
		        {3002, 100003},
		        {3001, 100004},
		        {3003, 100004},
		        {3004, 100001}
		    };
		*/
		/*
			[문제]
	            memberList는 회원목록데이터이다.
	            순서대로 회원번호 , 회원이름 이다.

	            itemList은 쇼핑몰 판매상품데이터이다.
	            순서대로 상품번호 , 상품이름 이다.

	            orderList는 오늘 주문 목록이다. 
	            순서대로 주문한 회원번호, 주문한 상품번호이다.
	            
	            상품별 판매개수를 출력하시오.
	            [상품번호, 상품이름 , 판매개수] 를 출력한다. 
	            단, 판매개수가 0인 상품은 출력하지않는다. 
	            단, 판매개수가 높은순으로 내림차순 출력한다. 
	            판매개수가 같으면 번호가낮은순으로 오름차순한다. 
	            
	        [정답] 
				[100001, 고래밥, 5]
				[100002, 새우깡, 2]
				[100003, 감자깡, 2]
				[100004, 칸쵸, 2]
				[100007, 고구마깡, 2]
				[100006, 빼빼로, 1]
		*/
		
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
			

		int memberSize = 0; 
		

		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db6?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT count(*)  FROM member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				memberSize  = rs.getInt(1);
			}else{
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
		
		
		String[][] memberList = new String[memberSize][2];
		
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db6?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				memberList[i][0] = rs.getInt(1) + "";
				memberList[i][1] = rs.getString(2) ; // 문자열
								
				i += 1;
			}
			
			
			if(i == 0){
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
		
		
		int itemSize = 0; 
		

		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db6?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT count(*)  FROM item";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				itemSize  = rs.getInt(1);
			}else{
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
		
		
		String[][] itemList = new String[itemSize][2];
		
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db6?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM item";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				itemList[i][0] = rs.getInt(1) + "";
				itemList[i][1] = rs.getString(2) ; // 문자열
								
				i += 1;
			}
			
			
			if(i == 0){
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
		
		
		int orderSize = 0; 
		

		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db6?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT count(*)  FROM item_order";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				orderSize  = rs.getInt(1);
			}else{
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
		
		
		int[][] orderList = new int[orderSize][2];
		
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db6?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM item_order";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				orderList[i][0] = rs.getInt(1) ;
				orderList[i][1] = rs.getInt(2) ;
								
				i += 1;
			}
			
			
			if(i == 0){
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
		
	%>
	<div align="center">
		<h3>회원목록</h3>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>이름</td>
			</tr>
		<% for(int i = 0; i < memberSize; i++) { %>
			<tr>
				<td><%= memberList[i][0] %></td>
				<td><%= memberList[i][1] %></td>
			</tr>
		<%	} %>
		</table>
	</div>
	
	<div align="center">
		<h3>아이템목록</h3>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>이름</td>
			</tr>
		<% for(int i = 0; i < itemSize; i++) { %>
			<tr>
				<td><%= itemList[i][0] %></td>
				<td><%= itemList[i][1] %></td>
			</tr>
		<%	} %>
		</table>
	</div>
	
	<div align="center">
		<h3>주문목록</h3>
		<table border="1">
			<tr>
				<td>멤버번호</td>
				<td>아이템번호</td>
			</tr>
		<% for(int i = 0; i < orderSize; i++) { %>
			<tr>
				<td><%= orderList[i][0] %></td>
				<td><%= orderList[i][1] %></td>
			</tr>
		<%	} %>
		</table>
	</div>
	
</body>
</html>