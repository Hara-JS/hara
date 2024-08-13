<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	
	int memberSize = (int)session.getAttribute("memberSize");
	
	String[] memberIdList = (String[])session.getAttribute("memberIdList");
	String[] memberPwList = (String[])session.getAttribute("memberPwList");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	int check = -1;
	for(int i=0; i<memberSize; i++){
		if(id.equals(memberIdList[i]) && pw.equals(memberPwList[i])) {
			check = 1;
			break;
		}
	}
	if(check == 1){
		session.setAttribute("log", id);
	}	
	%>
<p id="check"><%= check %>