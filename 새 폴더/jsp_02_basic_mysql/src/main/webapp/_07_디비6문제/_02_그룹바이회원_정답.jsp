<%@page import="java.util.Arrays"%>
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
	            
	            회원별 판매개수를 출력하시오.
	            [회원번호, 회원이름, 구입개수] 를 출력한다. 
	            단, 구입개수가 0인 회원은 출력하지않는다. 
	            단, 구입개수가 높은순으로 내림차순 출력한다. 
	            구입개수가 같으면 번호가낮은순으로 오름차순한다. 
	            
	        [정답] 
	        		[3001, 이만수, 5]
       				[3003, 이영희, 4]
       				[3002, 김철민, 3]
       				[3004, 조성아, 1]
       				[3005, 박민재, 1]
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
		
		
		  String[][] viewList = new String[memberList.length][3];

		    for(int i = 0; i < viewList.length; i++){
		    	viewList[i][0] = memberList[i][0];
		    	viewList[i][1] = memberList[i][1];
		    	viewList[i][2] = "0";
		    }

		     for(int i = 0; i < viewList.length; i++){
		    	System.out.println(Arrays.toString(viewList[i]));
		    }
		    System.out.println(); 

		    for(int i = 0; i < viewList.length; i++){
		        for(int j = 0; j < orderList.length; j++){
		        	int number = Integer.parseInt(viewList[i][0]);
		            if(number == orderList[j][0]){
		            	int count = Integer.parseInt(viewList[i][2]);
		            	count += 1;
		                viewList[i][2] = count + "";
		            }
		        }
		    }

		    Arrays.sort(viewList, (a, b) -> {
		    	if(a[2].compareTo(b[2]) < 0) {
		    		return 1;
		    	} else if(a[2].compareTo(b[2]) > 0) {
		    		return -1;
		    	} else {
		    		if(a[0].compareTo(b[0]) < 0) {
		    			return -1;
		    		} else if(a[0].compareTo(b[0]) > 0) {
		    			return 1;
		    		} else {
		    			return 0;
		    		}
		    	}
		    	
		    });
		    
		    for(int i = 0; i < viewList.length; i++){
		    	System.out.println(Arrays.toString(viewList[i]));
		    }
		    System.out.println(); 
		
	%>
	<div align="center">
		<h3>회원목록</h3>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>수량</td>
			</tr>
		<% for(int i = 0; i < viewList.length; i++) { %>
				<%if(viewList[i][2] != "0") {%>		
		
				<tr>
					<td><%= viewList[i][0] %></td>
					<td><%= viewList[i][1] %></td>
					<td><%= viewList[i][2] %></td>
				</tr>
			<%} %>
		<%	} %>
		</table>
	</div>
	
	
	
</body>
</html>