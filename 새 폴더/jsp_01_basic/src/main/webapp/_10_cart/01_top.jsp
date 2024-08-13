<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 로그인한 회원의 id 가져오기
	Object obj = session.getAttribute("log");
	String log = (String)obj;
	
	String name = "";
	if(log != null) {
		obj = session.getAttribute("idList");
		String[] idList = (String[])obj;
	
		obj = session.getAttribute("nameList");
		String[] nameList = (String[])obj;
		
		obj = session.getAttribute("memberSize");
		int memberSize = (int)obj;
		
		for(int i=0; i<memberSize; i++) {
			if(idList[i].equals(log)) {
				name = nameList[i];
				break;
			}
		}
	}
%>

<div align="right">
	<%-- 로그아웃 상태 --%>
<%	if(log == null) { %>
	<font size="2"><a href="#">회원가입</a></font>&nbsp;
	<img alt="메뉴선" src="img/01_top.jpg">&nbsp;
	<font size="2"><a href="03_01_loginPage.jsp">로그인</a></font>&nbsp;
	<img alt="메뉴선" src="img/01_top.jpg">&nbsp;
<%	} else { %>
	<%-- 로그인 상태 --%>
	<%= name %>님&nbsp;<img alt="메뉴선" src="img/01_top.jpg">&nbsp;
	<font size="2"><a href="07_01_cartPage.jsp">주문확인</a></font>&nbsp;
	<img alt="메뉴선" src="img/01_top.jpg">&nbsp;
	<font size="2"><a href="03_04_logoutPro.jsp">로그아웃</a></font>&nbsp;
	<img alt="메뉴선" src="img/01_top.jpg">&nbsp;
<%	} %>
	<font size="2"><a href="#">고객센터</a></font>
</div>

<a href="02_01_mainPage.jsp">
	<img alt="메인고로" src="img/02_logo.png" height="90px">
</a>

<table>
	<tr height="50px">
		<th width="180px">
			<a href="04_01_shopAllPage.jsp">전체상품 보기</a>
		</th>
		<th width="10px">
			<img alt="메뉴선" src="img/01_top.jpg">
		</th>
		<th width="180px">
			<a href="#">신상품</a>
		</th>
		<th width="10px">
			<img alt="메뉴선" src="img/01_top.jpg">
		</th>
		<th width="180px">
			<a href="#">베스트</a>
		</th>
		<th width="10px">
			<img alt="메뉴선" src="img/01_top.jpg">
		</th>
		<th width="180px">
			<a href="#">알뜰쇼핑</a>
		</th>
		<th width="10px">
			<img alt="메뉴선" src="img/01_top.jpg">
		</th>
		<th width="180px">
			<a href="#">이벤트</a>
		</th>
		<th width="10px">
			<img alt="메뉴선" src="img/01_top.jpg">
		</th>
		<th width="40px">
			<a href="07_01_cartPage.jsp">
				<img alt="장바구니" src="img/03_cart.png" width="30px">
			</a>
		</th>
	</tr>
</table>





