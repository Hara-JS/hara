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
		// 내장 변수(=객체)
		// request, response, application, out
	
		String info = application.getServerInfo();
		
		String path1 = application.getRealPath(""); 
		// ()안에 경로를 추가로 입력할 수 있다.
		String path2 = application.getRealPath("/img");
		
		// 빨간글씨로 콘솔창에 출력된다.
		application.log("로그 기록 1 : " + path1);  
		application.log("로그 기록 2 : " + path2);  
		
		String path3 = application.getContextPath();
		application.log("프로젝트명 : " + path3);	
	%> 
	  
	<h2>application 내장객체</h2>
	 웹 컨테이너의 이름과 버전 : <%=info%><p>
	<hr>
	웹 어플리케이션 폴더의 로컬 시스템 경로 : <%=path1%> 
	<hr>
	웹 어플리케이션 폴더의 로컬 시스템 경로 : <%=path2%>
	<hr>
	프로젝트명 : <%=path3%>
</body>
</html>