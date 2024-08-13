<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));

	int 		boardSize 			= 	(int)session.getAttribute("boardSize");
	int 		boardLastNumber 	= 	(int)session.getAttribute("boardLastNumber");
	
	int[] 		boardNumberList 	= 	(int[])session.getAttribute("boardNumberList");
	String[] 	boardWriterList 	=  	(String[])session.getAttribute("boardWriterList");
	String[] 	boardSubjectList 	=  	(String[])session.getAttribute("boardSubjectList");
	String[] 	boardContentList 	=  	(String[])session.getAttribute("boardContentList");
	String[] 	boardDateList 		=  	(String[])session.getAttribute("boardDateList");
	int[] 		boardReadCountList 	=  	(int[])session.getAttribute("boardReadCountList");
	
	int			boardRef			= 	(int)session.getAttribute("boardRef");
	int[]		boardRefList 		=  	(int[])session.getAttribute("boardRefList");
	int[]		boardStepList 		=  	(int[])session.getAttribute("boardStepList");
	int[]		boardLevelList 		=  	(int[])session.getAttribute("boardLevelList");
	boolean[]	boardRemoveList 	=  	(boolean[])session.getAttribute("boardRemoveList");
	
	int 		boardImageSize 				= 	(int)session.getAttribute("boardImageSize");
	int[] 		boardImageNumberList 		= 	(int[])session.getAttribute("boardImageNumberList");
	int[] 		boardImageBoardNumberList 	=  	(int[])session.getAttribute("boardImageBoardNumberList");
	String[] 	boardImageNameList 			=	(String[])session.getAttribute("boardImageNameList");
	
	int boardIndex = 0;
	for(int i=0; i<boardSize; i++) {
		if(boardNumberList[i] == boardNumber) {
			boardIndex = i;
			break;
		}
	}
	
	boardRemoveList[boardIndex] = true;
	
	int boardImageIndex = -1;
	for(int i=0; i<boardImageSize; i++) {
		if(boardImageBoardNumberList[i] == boardNumber) {
			boardImageIndex = i;
			break;
		}
	}
	
	if(boardImageIndex >= 0) {
		for(int i=boardImageIndex; i<boardImageSize - 1; i++) {
			boardImageNumberList[i] = boardImageNumberList[i + 1];
			boardImageBoardNumberList[i] = boardImageBoardNumberList[i + 1];
			boardImageNameList[i] = boardImageNameList[i + 1];
		}
	}
	
	boardImageSize -= 1;
	
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
	
	response.sendRedirect("boardMain.jsp");
%>    






