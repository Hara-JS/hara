

<%@page import="java.util.Arrays"%>
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
				String[][] userList = { 
					{"1001","김철수"},
					{"1002","이만수"},
					{"1003","이영희"}
				};
	
				int[][] pointList = {
					{1001, 1},
					{1002, 3},
					{1001, 4},
					{1003, 2},
					{1003, 2}
				};
				
				
				    userList는 회원들의 정보이다. 
				    첫번째값은 회원번호이고, 두번째 값은 이름이다.
				    
				    pointList는 회원들의 점수 기록표이다. 
				    첫번째 값은 회원번호이고, 두번째 값은 포인트이다.
				    여러번 누적된 회원들도있다. 
				    
				[문제]
				    회원별로 포인트를 전부 더해서           
				    포인트 점수가 가장높은 회원의 점수와 이름을 구하시오.
				
				[정답]
				    5 김철수    
			*/
			Connection conn = null;	
			PreparedStatement pstmt = null;	
			ResultSet rs = null;
				

			int userSize = 0; 
			

			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db5?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = "SELECT count(*)  FROM user";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					userSize  = rs.getInt(1);
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
			
			
			String[][] userList = new String[userSize][2];
			
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db5?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = "SELECT * FROM user";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int i = 0;
				while(rs.next()){
					userList[i][0] = rs.getInt(1) + "";
					userList[i][1] = rs.getString(2) ; // 문자열
									
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
			
			int pointSize = 0; 
			

			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db5?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = "SELECT count(*)  FROM point";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					pointSize  = rs.getInt(1);
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
			
			// 둘다 정수이면 정수형으로 받아도된다.
			int[][] pointList = new int[pointSize][2];
			
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/jsp_db5?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = "SELECT * FROM point";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int i = 0;
				while(rs.next()){
					pointList[i][0] = rs.getInt(1);
					pointList[i][1] = rs.getInt(2);
									
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
			
			
			 int[] totalList = new int[3];

			    for(int i = 0; i < userList.length; i++){
			        for(int j = 0; j < pointList.length; j++){
			        	int userNumber = Integer.parseInt(userList[i][0]);
			            if(userNumber == pointList[j][0]){
			         
			            	totalList[i] += pointList[j][1];
			            }
			        }
			    }

			    System.out.println(Arrays.toString(totalList));
			    
			    int mx = totalList[0];
			    int mxi = 0;
			    for(int i = 0; i < totalList.length; i++){
			        if(mx < totalList[i]){
			            mx = totalList[i];
			            mxi = i;
			        }
			    }
			    System.out.println(mx + " " + userList[mxi][1]);
			
			
		%>
		<div align="center">
			<%=mx + " " + userList[mxi][1] %>
		</div>
		
</body>
</html>