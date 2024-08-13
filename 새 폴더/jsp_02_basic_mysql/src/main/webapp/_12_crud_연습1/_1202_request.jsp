<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
		폼은 보통 sumbit과 한쌍으로 페이지 이동시 사용한다.
		
		폼내부에 인풋태그의 데이터도 함께 이동한다. 
		
		name 을 반드시 적어줘야하며, 변수라고생각하면된다.
		
		예를들어 input 에 안녕하세요 라고적었다면,
		
		String str="안녕하세요"; 이렇게 생각하면된다. 
		
		?뒤에 표시가된다. 
		
		
		
	 --%>

	<form action="_1202_requestPro.jsp">
		<input type="text" name="str">
		<input type="submit">
	</form>
</body>
</html>