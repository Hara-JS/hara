<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
      
</head>
<body>
  	<jsp:include page="../layout/adminHeader.jsp"></jsp:include>		
  		
	<div align="center">
		<table border="1">
			<tr>
				<td colspan="4"><h1>관리자메인</h1></td>
			</tr>
			<tr>
				<th>상품 관리</th>
				<td><a href="adminItemList.jsp">전체 상품</a></td>
				<td colspan="2"><a href="adminAddBook.jsp">상품 등록</a></td>
			</tr>
			<tr>
				<th>회원 관리</th>
				<td><a href="adminMemberList.jsp">전체 회원</a></td>
				<td colspan="2"><a href="adminSendEmail.jsp">메시지 보내기</a></td>
			</tr>
			<tr>
				<th>게시판 관리</th>
				<td colspan="3"><a href="adminBoardList.jsp">전체 게시판</a></td>
			</tr>
			<tr>
				<th>통계</th>
				<td><a href="adminStatsItem.jsp">상품 통계</a></td>
				<td><a href="adminStatsSale.jsp">판매 통계</a></td>
				<td><a href="adminStatsMember.jsp">회원 통계</a></td>
			</tr>
		</table>
	</div>
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>