<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int memberSize = (int)session.getAttribute("memberSize");
	int memberLastNumber = (int)session.getAttribute("memberLastNumber");
	int[] memberNumberList = (int[])session.getAttribute("memberNumberList");
	String[] memberIdList = (String[])session.getAttribute("memberIdList");
	String[] memberPwList = (String[])session.getAttribute("memberPwList");
	String[] memberNameList = (String[])session.getAttribute("memberNameList");
	String[] memberEmailList = (String[])session.getAttribute("memberEmailList");
	String[] memberPhoneList = (String[])session.getAttribute("memberPhoneList");
	String[] memberAddr1List = (String[])session.getAttribute("memberAddr1List");
	String[] memberAddr2List = (String[])session.getAttribute("memberAddr2List");
	String[] memberAddr3List = (String[])session.getAttribute("memberAddr3List");
	String[] memberGenderList = (String[])session.getAttribute("memberGenderList");
	String[] memberRouteList = (String[])session.getAttribute("memberRouteList");
	boolean[] memberMarketingList = (boolean[])session.getAttribute("memberMarketingList");
	
	
	String[] genderList = {"선택안함", "남자", "여자"};
	String[] routeList = {"기타", "인터넷 검색", "지인 권유", "SNS", "광고"};
%>    

<jsp:include page="../layout/adminHeader.jsp"></jsp:include>	

<div align="center">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
			<td>연락처</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>남은주소</td>
			<td>성별</td>
			<td>유입경로</td>
			<td>마케팅 수신동의</td>
			<td>삭제</td>
		</tr>
	<% for(int i=0; i<memberSize; i++) { %>
		<tr>
			<td><%= memberIdList[i] %></td>
			<td><%= memberPwList[i] %></td>
			<td><%= memberNameList[i] %></td>
			<td><%= memberEmailList[i] %></td>
			<td><%= memberPhoneList[i] %></td>
			<td><%= memberAddr1List[i] %></td>
			<td><%= memberAddr2List[i] %></td>
			<td><%= memberAddr3List[i] %></td>
			<% int genderIndex = Integer.parseInt(memberGenderList[i]);	%>
			<td><%= genderList[genderIndex] %></td>
			<% int routeIndex = Integer.parseInt(memberRouteList[i]); %>
			<td><%= routeList[routeIndex] %></td>
			<td><%= memberMarketingList[i] %></td>
			<td><button>삭제</button></td>
		</tr>
	<% } %>
	</table>
</div>