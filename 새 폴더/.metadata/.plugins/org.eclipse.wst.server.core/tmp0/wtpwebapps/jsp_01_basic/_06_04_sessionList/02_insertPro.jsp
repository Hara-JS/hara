<%@page import="java.util.Random"%>
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
		Random ran = new Random();
	
		Object obj = null;
		obj = session.getAttribute("max");
		int max = (int)obj;

		obj = session.getAttribute("count");
		int count = (int)obj;
	
		obj = session.getAttribute("list");
		int[] list = (int[])obj;
		
		if(count < max) {
			int rNum = ran.nextInt(100);
			list[count] = rNum;
			count += 1;
			System.out.println("[메세지]추가를 완료하였습니다.");
		}else{
			System.out.println("[메세지]더이상 추가할 수 없습니다.");
		}
		
		list = new int[count + 1];
		
		
		session.setAttribute("count", count);
		session.setAttribute("list", list);
		
		response.sendRedirect("01_list.jsp");
	%>
</body>
</html>


























