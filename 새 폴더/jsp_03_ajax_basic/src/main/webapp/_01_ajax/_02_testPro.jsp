<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");		
		/*
			0 1 -1 등으로 원하는 결과를 체크한다. 
			우리는 아래 p태그로 확인할예정이며, 태그나 값은 자유로 설정한다. 
		*/
		int check = 1; 
		if(id.equals("test1234")){
			check = -1;
		}else{
			check = 1;
		}
	%>    
	
	
<p id="check"><%= check %>













