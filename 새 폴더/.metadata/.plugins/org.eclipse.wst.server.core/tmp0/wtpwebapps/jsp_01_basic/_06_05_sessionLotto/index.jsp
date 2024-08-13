<%@page import="java.util.Arrays"%>
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
	
		int[] lotto = new int[7];
		boolean[] check = new boolean[7];
		int count = 3;
		int status = 0;
		
		int red = 3;
		int blue = 4;
		for(int i=0; i<lotto.length; i++) {
			int rNum = ran.nextInt(2);
			
			if(rNum == 0 && red > 0) {
				lotto[i] = 1;
				red--;
			}else if(rNum == 1 && blue > 0) {
				lotto[i] = 7;
				blue--;
			}else {
				i--;
			}
		}
		
		System.out.println(Arrays.toString(lotto));
		
		session.setAttribute("lotto", lotto);
		session.setAttribute("check", check);
		session.setAttribute("count", count);
		session.setAttribute("status", status);
		
		response.sendRedirect("lottoGame.jsp");
	%>
</body>
</html>















