<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.io.Console"%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%
   	 	String filePathStr = application.getRealPath("/_03_board_mysql/uploadFile");
    	System.out.println(filePathStr);
    	
    	Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
    %>
    
    <% 
	
   	int boardRef = 1;
    	
    try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/_03_board_mysql?serverTimezone=UTC&useSSL=false";
		String dbId = "root";
		String dbPw = "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		
		String sql = " SELECT MAX(board_ref) FROM board ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			boardRef = rs.getInt(1);
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){ conn.close();	}
			if(pstmt != null){ pstmt.close(); }
			if(rs != null){ rs.close();	}
		}
    
    %>
    
    
    <% 
    	
	    try{ 

	    	int maxPostSize= 1024*1024*10;
	    	String encoding="UTF-8";	    		
	     	MultipartRequest mr = new MultipartRequest(request, filePathStr, maxPostSize, encoding, new DefaultFileRenamePolicy());
			
	
 			String 	boardWriterList 	=  mr.getParameter("writer");	
			String 	boardSubjectList 	=  mr.getParameter("subject");
			String 	boardContentList 	=  mr.getParameter("content");
		
			int		boardReadCountList 	=  	0;	
			int		boardRefList 		=   boardRef + 1;
			int		boardStepList 		=  	1;
			int		boardLevelList 		=  	1;
			int		boardRemoveList 	=  	0;
	     	
			
			 try{
					String jdbcUrl = "jdbc:mysql://localhost:3306/_03_board_mysql?serverTimezone=UTC&useSSL=false";
					String dbId = "root";
					String dbPw = "root";
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
					
					String sql = " INSERT INTO board ";
					sql +=	" VALUES(0, ?, ?, ?, now() , ? , ?, ?, ?, ?) ";
			
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1,boardWriterList);
					pstmt.setString(2,boardSubjectList);
					pstmt.setString(3,boardContentList);
					pstmt.setInt(4,boardReadCountList);
					pstmt.setInt(5,boardRefList);
					pstmt.setInt(6,boardStepList);
					pstmt.setInt(7,boardLevelList);
					pstmt.setInt(8,boardRemoveList);
					
					pstmt.executeUpdate();
									
					
					}catch(Exception e){
						e.printStackTrace();
					}finally{
						if(conn != null){ conn.close();	}
						if(pstmt != null){ pstmt.close(); }
						if(rs != null){ rs.close();	}
					}
			
 			%>
 		
	 		<%
		 		int boardNumber = 1;
		 		
		 		try{
						String jdbcUrl = "jdbc:mysql://localhost:3306/_03_board_mysql?serverTimezone=UTC&useSSL=false";
						String dbId = "root";
						String dbPw = "root";
						
						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
						
						String sql = " SELECT max(board_number) from board ";
						pstmt = conn.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						
						if(rs.next()){
							boardNumber = rs.getInt(1);
						}
													
						}catch(Exception e){
							e.printStackTrace();
						}finally{
							if(conn != null){ conn.close();	}
							if(pstmt != null){ pstmt.close(); }
							if(rs != null){ rs.close();	}
						}	
	 		
	 		%>
 		
 		<% 
		    	String item="";
		    	String ofileName="";
		    	String reFileName="";
		    	Enumeration fileList= mr.getFileNames();	 
		    	    	
		    	String sql = "";	    	   	
		    	while(fileList.hasMoreElements()){				//첨부파일 끝까지 계속 반복
		    		
		     	  	item = (String)fileList.nextElement();
		     	   	ofileName=mr.getOriginalFileName(item); 	 //원본 파일명	
		     	  	reFileName=mr.getFilesystemName(item);		// 변경된 파일명 (파일명이 겹치지 않으면 변경안될수도있음)
		     	   	
		     	  	try{
			     	  	String jdbcUrl = "jdbc:mysql://localhost:3306/_03_board_mysql?serverTimezone=UTC&useSSL=false";
						String dbId = "root";
						String dbPw = "root";
						
						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
						
						sql = " INSERT INTO boardimage ";
						sql +=	" VALUES(0, ?, ?) ";
				
						pstmt = conn.prepareStatement(sql);
						
						pstmt.setInt(1,boardNumber);
						pstmt.setString(2,reFileName);			
						pstmt.executeUpdate();									
						
						}catch(Exception e){
							e.printStackTrace();
						}finally{
							if(conn != null){ conn.close();	}
							if(pstmt != null){ pstmt.close(); }
							if(rs != null){ rs.close();	}
						}
		     	} 
    	}
	    catch(Exception e){
	    	e.printStackTrace();
    	}
  
   %>
   

    