<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
	
		request.setCharacterEncoding("utf-8");
		
		session.setAttribute("log", null);
		
	
		Object obj = session.getAttribute("adminId");
		String adminId = (String)obj;
		
		obj = session.getAttribute("adminPw");
		String adminPw = (String)obj;
		
		obj = session.getAttribute("adminName");
		String adminName = (String)obj;
		
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		int check = -1;
		if(id.equals(adminId) && pw.equals(adminPw)) {
			check = 1;
		}
		
		if(check == 1){
			session.setAttribute("log", adminName);
		}	
	%>
<p id="check"><%= check %>