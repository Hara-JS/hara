<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Object obj = null;
		
		obj = session.getAttribute("max");
		int max = (int)obj;
		
		obj = session.getAttribute("count");
		int count = (int)obj;
		
		obj = session.getAttribute("list");
		int[] list = (int[])obj;
		
		int index = Integer.parseInt(request.getParameter("index"));
		
		for(int i=index; i<count - 1; i++){
			list[i] = list[i + 1];
		}
		count -= 1;
		
		session.setAttribute("count", count);
		session.setAttribute("list", list);
		
		response.sendRedirect("01_list.jsp");
	%>
</body>
</html>