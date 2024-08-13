<%@page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  
  
  


<%	
	int 		boardSize 			= 0;
	int 		boardLastNumber 	= 1;
	int[] 		boardNumberList 	= new int[1000];
	String[] 	boardWriterList 	= new String[1000];
	String[] 	boardSubjectList 	= new String[1000];
	String[] 	boardContentList 	= new String[1000];
	String[] 	boardDateList 		= new String[1000];
	int[] 		boardReadCountList 	= new int[1000];
	
	int         boardRef 			= 1;
	int[]		boardRefList 		= new int[1000];
	int[]		boardStepList 		= new int[1000];
	int[]		boardLevelList 		= new int[1000];
	boolean[]	boardRemoveList		= new boolean[1000];

	
	for(int i=0; i<50; i++) {
		boardNumberList[i] = i + 1;
		boardWriterList[i] = "작성자" + boardLastNumber;
		boardSubjectList[i] = "제목" + boardLastNumber;
		boardContentList[i] = "내용" + boardLastNumber;
		boardDateList[i] = "2024-05-16 14:30:21";
		boardReadCountList[i] = 0;
		
		boardRefList[i] = boardRef;
		boardStepList[i] = 1;
		boardLevelList[i] = 1;
		boardRemoveList[i] = false;
		
		boardRef += 1;
		
		boardSize += 1;
		boardLastNumber += 1;
		
	}
	
	// 게시판정보
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
	
	
	int 		boardImageSize 				= 0;
	int			boardImageLastNumber		= 1;
	int[] 		boardImageNumberList 		= new int[1000];
	int[] 		boardImageBoardNumberList 	= new int[1000];
	String[] 	boardImageNameList 			= new String[1000];
	
	session.setAttribute("boardImageSize", boardImageSize);
	session.setAttribute("boardImageLastNumber", boardImageLastNumber);
	session.setAttribute("boardImageNumberList", boardImageNumberList);
	session.setAttribute("boardImageBoardNumberList", boardImageBoardNumberList);
	session.setAttribute("boardImageNameList", boardImageNameList);
	
%>	
   
<%
	response.sendRedirect("boardMain.jsp");
%>


