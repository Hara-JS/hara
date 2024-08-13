<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Object obj = session.getAttribute("memberIdList");
	String[] idList = (String[])obj;
	
	obj = session.getAttribute("memberSize");
	int memberSize = (int)obj;
	
	
	String id = request.getParameter("id");
	
	// 아이디 중복O : -1
	// 아이디 중복X : 1
	int check = 1;
	for(int i=0; i<memberSize; i++) {
		if(idList[i].equals(id)) {
			check = -1;
			break;
		}
	}
%>  
<p id="check"><%= check %>