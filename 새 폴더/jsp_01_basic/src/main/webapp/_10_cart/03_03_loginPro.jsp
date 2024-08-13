<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Object obj = session.getAttribute("idList");
	String[] idList = (String[])obj;
	
	obj = session.getAttribute("pwList");
	String[] pwList = (String[])obj;
	
	obj = session.getAttribute("memberSize");
	int memberSize = (int)obj;

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	boolean check = false;
	for(int i=0; i<memberSize; i++) {
		if(idList[i].equals(id) && pwList[i].equals(pw)) {
			check = true;
			break;
		}
	}

	// 로그인 성공
	if(check) {
		session.setAttribute("log", id);
		System.out.println("로그인 성공!");
		response.sendRedirect("02_01_mainPage.jsp");
	} 
	// 로그인 실패
	else {
		application.log("로그인 실패!");
		response.sendRedirect("03_01_loginPage.jsp");
	}
%>












