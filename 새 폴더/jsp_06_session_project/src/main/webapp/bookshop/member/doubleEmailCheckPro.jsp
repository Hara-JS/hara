<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	Object obj = session.getAttribute("memberEmailList");
	String[] emailList = (String[])obj;
	
	obj = session.getAttribute("memberSize");
	int memberSize = (int)obj;
	
	
	String email = request.getParameter("email");
	
	// 이메일 중복O : -1
	// 이메일 중복X : 1
	int check = 1;
	for(int i=0; i<memberSize; i++) {
		if(emailList[i].equals(email)) {
			check = -1;
			break;
		}
	}
	%>  
<p id="check"><%= check %>