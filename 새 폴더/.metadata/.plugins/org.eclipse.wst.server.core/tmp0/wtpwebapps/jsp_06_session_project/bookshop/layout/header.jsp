<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>

	<%
		String log = (String)session.getAttribute("log");	
		System.out.println("header.jsp:"+log);
	%>
	<div align="center">
		<table border="1">
			<tr>
				<%if(log == null){ %>
					<td><a href="../../index.jsp">완전 초기화</a></td>	
					<td><a href="../shop/itemList.jsp">쇼핑몰</a></td>	
					<td><a href="../member/joinForm.jsp">회원가입</a></td>
					<td><a href="../member/loginForm.jsp">로그인</a></td>
					<td><a href="../member/kakaoLoginForm.jsp">카카오로그인</a></td>
					<td><a href="../board/boardMain.jsp">게시판</a></td>
					<td><a href="../admin/adminLogin.jsp">ADMIN</a></td>
				<%}else {%>
					<td><%= log %>님, 로그인 중</td>
					<td><a href="../../index.jsp">완전 초기화</a></td>
					<td><a href="../shop/itemList.jsp">쇼핑몰</a></td>	
					<td><a href="../member/logout.jsp">로그아웃</a></td>
					<td><a href="../member/kakaoLogout.jsp">카카오 로그아웃</a></td>
					<td><a href="../shop/cartList.jsp">장바구니</a></td>
					<td><a href="../shop/orderList.jsp">주문내역</a></td>
					<td><a href="../board/boardMain.jsp">게시판</a></td>
				<%} %>
			</tr>
		</table>
	</div>
	
   
	