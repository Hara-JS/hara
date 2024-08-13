<%@page import="java.time.LocalDateTime"%>
<%@page import="java.io.Console"%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%
  //-----------------------------------------------------------------------------------------------------
		int 		boardSize 			= 	(int)session.getAttribute("boardSize");
		int 		boardLastNumber 	= 	(int)session.getAttribute("boardLastNumber");
		int[] 		boardNumberList 	= 	(int[])session.getAttribute("boardNumberList");
		String[] 	boardSubjectList 	=  	(String[])session.getAttribute("boardSubjectList");
		String[] 	boardContentList 	=  	(String[])session.getAttribute("boardContentList");
		//-----------------------------------------------------------------------------------------------------
		int 		boardImageSize 				= 	(int)session.getAttribute("boardImageSize");
		int 		boardImageLastNumber 		= 	(int)session.getAttribute("boardImageLastNumber");
		int[] 		boardImageNumberList 		= 	(int[])session.getAttribute("boardImageNumberList");
		int[] 		boardImageBoardNumberList 	=  	(int[])session.getAttribute("boardImageBoardNumberList");
		String[] 	boardImageNameList 			=	(String[])session.getAttribute("boardImageNameList");
    
    %>
    
    <% 
	    String filePathStr = application.getRealPath("/_01_fileupload2/uploadFile");
    	System.out.println(filePathStr);
    	
	    try{ 

	    	int maxPostSize= 1024*1024*10;
	    	String encoding="UTF-8";	    		
	     	MultipartRequest mr = new MultipartRequest(request, filePathStr, maxPostSize, encoding, new DefaultFileRenamePolicy());

 			String subject = mr.getParameter("subject");
 			String content = mr.getParameter("content");
 			
 			boardNumberList[boardSize] = boardLastNumber;
 			boardSubjectList[boardSize] = subject;
 			boardContentList[boardSize] = content;
 			
	    	String item="";
	    	String ofileName="";
	    	String reFileName="";
	    	Enumeration fileList= mr.getFileNames();	 
	    	    	
	    	String sql = "";	    	   	
	    	while(fileList.hasMoreElements()){				//첨부파일 끝까지 계속 반복
	    		
	     	  	item = (String)fileList.nextElement();
	     	   	ofileName=mr.getOriginalFileName(item); 	 //원본 파일명	
	     	  	reFileName=mr.getFilesystemName(item);		// 변경된 파일명 (파일명이 겹치지 않으면 변경안될수도있음)
	     	   	
 	 			boardImageNumberList[boardImageSize] = boardImageSize + 1;
 	 			boardImageBoardNumberList[boardImageSize] = boardNumberList[boardSize];
 	 			boardImageNameList[boardImageSize] = reFileName;
				
 	 			boardImageSize += 1;
 	 			boardImageLastNumber += 1;
	     	} 
	    	
	    	
 			boardSize += 1;
	    	boardLastNumber += 1;
	    	
	    	//---------------------------------------------------------------------------
	    	session.setAttribute("boardSize", boardSize);
	    	session.setAttribute("boardLastNumber", boardLastNumber);
	 		session.setAttribute("boardNumberList", boardNumberList);
	 		session.setAttribute("boardSubjectList", boardSubjectList);
	 		session.setAttribute("boardContentList", boardContentList);
	 		//---------------------------------------------------------------------------
	 		session.setAttribute("boardImageSize", boardImageSize);
	 		session.setAttribute("boardImageLastNumber", boardImageLastNumber);
	 		session.setAttribute("boardImageNumberList", boardImageNumberList);
	 		session.setAttribute("boardImageBoardNumberList", boardImageBoardNumberList);
	 		session.setAttribute("boardImageNameList", boardImageNameList);
    	}
	    catch(Exception e){
	    	e.printStackTrace();
    	}
  
   %>
   

    