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
	
		obj = session.getAttribute("lotto");
		int[] lotto = (int[])obj;
		
		obj = session.getAttribute("check");
		boolean[] check = (boolean[])obj;
		
		obj = session.getAttribute("count");
		int count = (int)obj;
	
		obj = session.getAttribute("status");
		int status = (int)obj;
		
		int index = Integer.parseInt(request.getParameter("index"));
		check[index] = true;
		count -= 1;
		
		if(count == 0) {
			int winCount = 0;
			for(int i=0; i<check.length; i++) {
				if(check[i] == true && lotto[i] == 7) {
					winCount++;
				}
			}
			if(winCount == 3) {
				status = 1;
			} else {
				status = 2;
			}
		}
		session.setAttribute("status", status);
		session.setAttribute("count", count);
		session.setAttribute("check", check);
		
		response.sendRedirect("lottoGame.jsp");
	%>
</body>
</html>








