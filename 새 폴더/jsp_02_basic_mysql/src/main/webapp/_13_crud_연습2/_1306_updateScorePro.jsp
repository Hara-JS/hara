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
		String[][] viewList = new String[1000][6];
		int viewSize = 0; // 회원이 몇명인지 체크한다.
	
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		
		
		boolean check = false;
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/_13_student_score?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM score";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next()){
				viewList[i][0] = rs.getInt(1) + "";// 꼼수;
				viewList[i][1] = rs.getInt(2) + "";
				viewList[i][2] = rs.getInt(3) + "";
				viewList[i][3] = rs.getInt(4) + "";
				viewList[i][4] = rs.getFloat(5) + "";// 꼼수;
				viewList[i][5] = rs.getInt(6) + "";
				i += 1;
			}
			
			viewSize = i;
			
			if(viewSize == 0){
				System.out.println("검색데이터가 없습니다.");
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
		
		for(int i = 0; i < viewSize; i++){
			int kor = Integer.parseInt(viewList[i][1]);
			int math = Integer.parseInt(viewList[i][2]);
			int total = kor + math;
			double avg = (double)total / 2;
			
			int count = 1;
			
			for(int j = 0; j < viewSize; j++){
				int kor2 = Integer.parseInt(viewList[j][1]);
				int math2 = Integer.parseInt(viewList[j][2]);
				int total2 = kor2 + math2;
				if(total < total2){
					count += 1;
				}
			}
			
			viewList[i][3] = total +"";
			viewList[i][4] = String.format("%.2f" , avg);
			viewList[i][5] = count + "";
		}
		
		for(int i = 0; i < viewSize; i++){
			System.out.println(Arrays.toString(viewList[i]));
		
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/_13_student_score?serverTimezone=UTC&useSSL=false";
				String dbId = "root";
				String dbPw = "root";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
				
				String sql = "UPDATE score SET total=? , avg=? ,score_rank=? WHERE student_number=?";
				pstmt = conn.prepareStatement(sql);
				
				int number = Integer.parseInt(viewList[i][0]);
				int total = Integer.parseInt(viewList[i][3]);
				double avg = Double.parseDouble(viewList[i][4]);
				int rank = Integer.parseInt(viewList[i][5]);
				
				System.out.println(number);
				System.out.println(total);
				System.out.println(avg);
				System.out.println(rank);
				
				pstmt.setInt(1, total);
				pstmt.setDouble(2, avg);
				pstmt.setInt(3, rank);
				pstmt.setInt(4, number);
				int result = pstmt.executeUpdate();
				if(result == 1){
					check = true;
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
		}
		
		
		
		
	%>
	<div align="center">
		<%if(check){ %>
			수정이 완료되었습니다.
		<%} else{%>
			수정이 실패했습니다. 
		<%} %>
		
		<a href="_1301_main.jsp">메인화면</a>
	</div>
	
</body>
</html>