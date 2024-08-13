<%@page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  
<%	
	int 		boardSize 			= 0;
	int 		boardLastNumber 	= 1;
	int[] 		boardNumberList 	= new int[1000];
	String[] 	boardSubjectList 	= new String[1000];
	String[] 	boardContentList 	= new String[1000];
	
	for(int i=0; i<3; i++) {
		boardNumberList[i] = i + 1;
		boardSubjectList[i] = "제목" + boardLastNumber;
		boardContentList[i] = "내용" + boardLastNumber;
		
		boardSize += 1;
		boardLastNumber += 1;
	}
	
	// 게시판정보
	session.setAttribute("boardSize", boardSize);
	session.setAttribute("boardLastNumber", boardLastNumber);
	session.setAttribute("boardNumberList", boardNumberList);
	session.setAttribute("boardSubjectList", boardSubjectList);
	session.setAttribute("boardContentList", boardContentList);
	
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


