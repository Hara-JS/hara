<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	int index = Integer.parseInt(request.getParameter("index"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int reStep = Integer.parseInt(request.getParameter("reStep"));
	int reLevel = Integer.parseInt(request.getParameter("reLevel"));

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
	
	boardNumberList[boardSize] = boardLastNumber;
	boardWriterList[boardSize] = writer;
	boardSubjectList[boardSize] = subject;
	boardContentList[boardSize] = content;
	boardReadCountList[boardSize] = 0;	
	
	LocalDateTime time = LocalDateTime.now();	
	int year = time.getYear();
	int month = time.getMonthValue();
	int day = time.getDayOfMonth();
	int hour = time.getHour();
	int min = time.getMinute();
	int second = time.getSecond();
	String boardDate = year + "-" + month + "-" + day + " " + hour + ":" + min + ":" + second;
	boardDateList[boardSize] = boardDate;	
	
	// reLevel값 증가
	for(int i=0; i<boardSize; i++) {
		if(boardRefList[i] == ref && boardLevelList[i] > reLevel) {
			boardLevelList[i] += 1;
		}
	}
	boardRefList[boardSize] = ref;
	boardStepList[boardSize] = reStep + 1;
	boardLevelList[boardSize] = reLevel + 1;
	
	boardSize += 1;
	boardLastNumber += 1;
	
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
%>    















