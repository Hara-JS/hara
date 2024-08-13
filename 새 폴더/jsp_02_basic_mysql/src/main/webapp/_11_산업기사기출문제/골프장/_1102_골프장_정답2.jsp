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
	<%--
        골프장2정답을 완성하시오.
	 --%>
	 
	 <%
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
			
		// 회원 정보
		int memeberSize = 0; 

		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_11_golf?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT COUNT(*) FROM tbl_member_202201";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				memeberSize  = rs.getInt(1);
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
	 
		
		String[][] memberList = new String[memeberSize][5];
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_11_golf?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM tbl_member_202201";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int i = 0;
			while(rs.next()){
				memberList[i][0] = rs.getString(1);
				memberList[i][1] = rs.getString(2);
				memberList[i][2] = rs.getString(3);
				memberList[i][3] = rs.getString(4);
				memberList[i][4] = rs.getString(5);
				
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
		
		// 강사 정보
		int teatcherSize = 0; 
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_11_golf?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT COUNT(*) FROM tbl_teacher_202201";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				teatcherSize  = rs.getInt(1);
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
	 
		
		String[][] teacherList = new String[teatcherSize][5];
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_11_golf?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM tbl_teacher_202201";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int i = 0;
			while(rs.next()){
				teacherList[i][0] = rs.getString(1);
				teacherList[i][1] = rs.getString(2);
				teacherList[i][2] = rs.getString(3);
				teacherList[i][3] = rs.getInt(4) + "";
				teacherList[i][4] = rs.getString(5);
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
		
		// 수강 정보
		int classSize = 0; 
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_11_golf?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT COUNT(*) FROM tbl_class_202201";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				classSize  = rs.getInt(1);
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
	 
		String[][] classList = new String[classSize][5];
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_11_golf?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM tbl_class_202201";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int i = 0;
			while(rs.next()){
				classList[i][0] = rs.getString(1);
				classList[i][1] = rs.getString(2);
				classList[i][2] = rs.getString(3);
				classList[i][3] = rs.getInt(4) + "";
				classList[i][4] = rs.getString(5);

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
		
		
		for(int i=0; i<memberList.length; i++) {
			System.out.println(Arrays.toString(memberList[i]));
		}
		System.out.println("-------------------------------------");
		for(int i=0; i<classList.length; i++) {
			System.out.println(Arrays.toString(classList[i]));
		}
		System.out.println("-------------------------------------");
		for(int i=0; i<teacherList.length; i++) {
			System.out.println(Arrays.toString(teacherList[i]));
		}
		System.out.println("-------------------------------------");
		
		
	  String[][] viewList = new String[memberList.length][7];

	    for(int i = 0; i < memberList.length; i++) {
	    	
	    	for(int j = 0; j < classList.length; j++) {
		    	// 수강월
	    		if(memberList[i][0].compareTo(classList[j][1]) == 0) {
	    			String date = classList[j][0];		
	    	    	String year = date.substring(0, 4);
	    	    	String month = date.substring(4, 6);
	    	    	
	    	    	viewList[i][0] = year + "년 " + month + "월";
	    	    	
	    	    	// 강의 장소
	    	    	viewList[i][4] = memberList[i][3];
	    	    	// 수강료
	    	    	viewList[i][5] = classList[i][3];
	    	    	
	    	    	// 강의명
	    	    	for(int k = 0; k < teacherList.length; k++) {
	    	    		if(classList[j][4].compareTo(teacherList[k][0]) == 0) {
	    	    			viewList[i][3] = teacherList[k][2];		
	    	    		}
	    	    	}
	    		}
	    	}
	    
			// 회원번호	    	
	    	viewList[i][1] = memberList[i][0];		
	    	// 회원명
	    	viewList[i][2] = memberList[i][1];	
			// 등급	    	
	    	viewList[i][6] = memberList[i][4];
	    	
	    	Arrays.toString(viewList[i]);
	    }

	 %>
	 
	 <div align="center">
	 	<h3>회원정보조회</h3>
	 	<table border="1">
	 		<tr>
	 			<td>수강월</td>
	 			<td>회원번호</td>
	 			<td>회원명</td>
	 			<td>강의명</td>
	 			<td>강의장소</td>
	 			<td>수강료</td>
	 			<td>등급</td>
	 		</tr>
	 	<% for(int i=0; i<viewList.length; i++) { %>
	 		<tr>
	 			<td><%= viewList[i][0] %></td>
	 			<td><%= viewList[i][1] %></td>
	 			<td><%= viewList[i][2] %></td>
	 			<td><%= viewList[i][3] %></td>
	 			<td><%= viewList[i][4] %></td>
	 			<td><%= viewList[i][5] %></td>
	 			<td><%= viewList[i][6] %></td>
	 		</tr>
	 	<% } %>
	 	</table>
	 </div>
</body>
</html>