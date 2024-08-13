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
	String info = application.getServerInfo();
	String path1 = application.getRealPath("");
	String path2 = application.getRealPath("/img");
	
	application.log(path1);
	application.log(path2);
	
	String path3 = application.getContextPath();
	application.log(path3);
	
%>

<%=info %><br>
<%=path1 %><br>
<%=path2 %><br>
<%=path3 %>



</body>
</html>