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
		String[] 	boardWriterList 	=  	(String[])session.getAttribute("boardWriterList");
		String[] 	boardSubjectList 	=  	(String[])session.getAttribute("boardSubjectList");
		String[] 	boardContentList 	=  	(String[])session.getAttribute("boardContentList");
		String[] 	boardDateList 		=  	(String[])session.getAttribute("boardDateList");
		int[] 		boardReadCountList 	=  	(int[])session.getAttribute("boardReadCountList");
		int 		boardRef			= 	(int)session.getAttribute("boardRef");
		int[]		boardRefList 		=  	(int[])session.getAttribute("boardRefList");
		int[]		boardStepList 		=  	(int[])session.getAttribute("boardStepList");
		int[]		boardLevelList 		=  	(int[])session.getAttribute("boardLevelList");
		boolean[]	boardRemoveList 	=  	(boolean[])session.getAttribute("boardRemoveList");
		
		//-----------------------------------------------------------------------------------------------------
		int 		boardImageSize 				= 	(int)session.getAttribute("boardImageSize");
		int 		boardImageLastNumber 		= 	(int)session.getAttribute("boardImageLastNumber");
		int[] 		boardImageNumberList 		= 	(int[])session.getAttribute("boardImageNumberList");
		int[] 		boardImageBoardNumberList 	=  	(int[])session.getAttribute("boardImageBoardNumberList");
		String[] 	boardImageNameList 			=	(String[])session.getAttribute("boardImageNameList");
    
    %>
    
    <% 
	    String filePathStr = application.getRealPath("/_02_board_session/uploadFile");
    	System.out.println(filePathStr);
    	
	    try{ 

	    	int maxPostSize= 1024*1024*10;
	    	String encoding="UTF-8";	    		
	     	MultipartRequest mr = new MultipartRequest(request, filePathStr, maxPostSize, encoding, new DefaultFileRenamePolicy());

 			String writer = mr.getParameter("writer");
 			
 			String subject = mr.getParameter("subject");
 			
 			String content = mr.getParameter("content");
 			
 			boardNumberList[boardSize] = boardLastNumber;
 			boardWriterList[boardSize] = writer;
 			boardSubjectList[boardSize] = subject;
 			boardContentList[boardSize] = content;
 			
 			LocalDateTime time = LocalDateTime.now();	
			int year = time.getYear();
			int month = time.getMonthValue();
			int day = time.getDayOfMonth();
			int hour = time.getHour();
			int min = time.getMinute();
			int second = time.getSecond();
 			String boardDate = year + "-" + month + "-" + day + " " + hour + ":" + min + ":" + second;
 			
 			boardDateList[boardSize] = boardDate;		
 			boardReadCountList[boardSize] = 0;			
 			boardRefList[boardSize] = boardRef + 1;
		
 			boardStepList[boardSize] = 1;
 			boardLevelList[boardSize] = 1;
 			
 			
 			
 			
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
	    	
	    	
	    	boardRef += 1;
 			boardSize += 1;
	    	boardLastNumber += 1;
	    	
	    	//---------------------------------------------------------------------------
	    	session.setAttribute("boardSize", boardSize);
	    	session.setAttribute("boardLastNumber", boardLastNumber);
	 		session.setAttribute("boardNumberList", boardNumberList);
	 		session.setAttribute("boardWriterList", boardWriterList);
	 		session.setAttribute("boardSubjectList", boardSubjectList);
	 		session.setAttribute("boardContentList", boardContentList);
	 		session.setAttribute("boardDateList", boardDateList);
	 		session.setAttribute("boardReadCountList", boardReadCountList);	 		
	 		session.setAttribute("boardRef", boardRef);
	 		session.setAttribute("boardRefList", boardRefList);
	 		session.setAttribute("boardStepList", boardStepList);
	 		session.setAttribute("boardLevelList", boardLevelList);
	 		session.setAttribute("boardRemoveList", boardRemoveList);
	 		
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
   

    