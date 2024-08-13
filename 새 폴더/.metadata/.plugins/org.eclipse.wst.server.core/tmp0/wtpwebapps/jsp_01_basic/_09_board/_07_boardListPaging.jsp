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
		Object obj = session.getAttribute("count");
		int count = (int)obj;
		
		obj = session.getAttribute("noList");
		String[] noList = (String[])obj;
		
		obj = session.getAttribute("writerList");
		String[] writerList = (String[])obj;
		
		obj = session.getAttribute("regDateList");
		String[] regDateList = (String[])obj;
	
		obj = session.getAttribute("subjectList");
		String[] subjectList = (String[])obj;
		
		obj = session.getAttribute("contentsList");
		String[] contentsList = (String[])obj;
		
		// 전체 게시글 수
		int 전체게시글수 = count;
		// 한 페이지에 보여줄 게시글 수
		int 한페이지에보여줄게시글수 = 5;
		// 현재 페이지 번호
		int 현재페이지번호 = 1;
		if(request.getParameter("현재페이지번호") != null) {
			현재페이지번호 = Integer.parseInt(request.getParameter("현재페이지번호"));
		}
		// 현재 페이지의 게시글 시작 인덱스 번호
		int 시작인덱스번호 = (현재페이지번호 - 1) * 한페이지에보여줄게시글수;
		// 현재 페이지의 게시글 마지막 인덱스 번호
		int 마지막인덱스번호 = 시작인덱스번호 + 한페이지에보여줄게시글수;
		if(마지막인덱스번호 > 전체게시글수) {
			마지막인덱스번호 = 전체게시글수;
		}
	%>
	
	전체 게시글 수 : <%= count %>개
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>제목</th>
			<th>내용</th>
			<th>삭제</th>
		</tr>
	<%	for(int i=시작인덱스번호; i<마지막인덱스번호; i++) {	%>
		<tr>
			<td><%= i + 1 %></td>		
			<td><%= writerList[i] %></td>	
			<td><%= regDateList[i] %></td>	
			<td>
				<a href="_05_updateBoard.jsp?index=<%= i %>"><%= subjectList[i] %></a>
			</td>		
			<td><%= contentsList[i] %></td>	
			<td>
				<button onclick="window.location.href='_06_deleteBoard.jsp?index=<%= i %>'">삭제하기</button>
			</td>	
		</tr>
	<%	} %>
		<tr>
			<td colspan="6">
				<button onclick="window.location.href='_00_main.jsp'">메인화면</button>
			</td>
		</tr>
	</table>
	<%
		// 전체 페이지 수
		int 전체페이지수 = 전체게시글수 / 한페이지에보여줄게시글수;
		if(전체게시글수 % 한페이지에보여줄게시글수 > 0) {
			전체페이지수 += 1;
		}
		System.out.println("전체페이지수 = " + 전체페이지수);
		// 한 페이지에 보여줄 페이지 개수
		int 한페이지에보여줄페이지개수 = 3;
		// 현재 페이지의 페이지 시작 번호
		int 페이지시작번호 = 1;
		if(request.getParameter("페이지시작번호") != null) {
			페이지시작번호 = Integer.parseInt(request.getParameter("페이지시작번호"));
		}
		// 현재 페이지의 페이지 마지막 번호
		int 페이지마지막번호 = 페이지시작번호 + 한페이지에보여줄페이지개수 - 1;
		if(페이지마지막번호 > 전체페이지수) {
			페이지마지막번호 = 전체페이지수;
		}
		System.out.println("페이지마지막번호 = " + 페이지마지막번호);
	%>
	
	<%	if(페이지시작번호 + 1 > 한페이지에보여줄페이지개수) { %>
			<a href="_07_boardListPaging.jsp?페이지시작번호=<%= 페이지시작번호 - 한페이지에보여줄페이지개수 %>&현재페이지번호=<%= 페이지시작번호 - 한페이지에보여줄페이지개수 %>">[이전]</a>
	<%	} %>
	<%	for(int i=페이지시작번호; i<=페이지마지막번호; i++) { %>
			<a href="_07_boardListPaging.jsp?페이지시작번호=<%= 페이지시작번호 %>&현재페이지번호=<%= i %>">[<%= i %>]</a>
	<%	} %>
	<%	if(페이지마지막번호 < 전체페이지수) { %>
			<a href="_07_boardListPaging.jsp?페이지시작번호=<%= 페이지시작번호 + 한페이지에보여줄페이지개수 %>&현재페이지번호=<%= 페이지시작번호 + 한페이지에보여줄페이지개수 %>">[이후]</a>
	<%	} %>
</body>
</html>









