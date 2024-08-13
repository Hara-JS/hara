<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<%
	int bookSize = (int)(session.getAttribute("bookSize"));
	
	int[] bookNumberList = (int[])(session.getAttribute("bookNumberList"));
	String[] bookCategoryList = (String[] )(session.getAttribute("bookCategoryList"));
	String[] bookSubCategoryList = (String[] )(session.getAttribute("bookSubCategoryList"));
	String[] bookNameList = (String[])(session.getAttribute("bookNameList"));
	int[] bookPriceList = (int[])(session.getAttribute("bookPriceList"));
	int[] bookStockList = (int[])(session.getAttribute("bookStockList"));
	String[] bookImageList = (String[])(session.getAttribute("bookImageList"));
	String[] bookInfoList =(String[])(session.getAttribute("bookInfoList"));
	int[] bookDiscountList =(int[])(session.getAttribute("bookDiscountList"));
	int[] bookSoldList =(int[])(session.getAttribute("bookSoldList"));	
	
	String filePath = request.getContextPath() + "/bookshop/uploadFile/";
%>

<jsp:include page="../layout/adminHeader.jsp"></jsp:include>		

<div align="center">
	<table border="1" style="border-top: 1px solid #444444; border-collapse: collapse;">	
		<tr>
			<td align="center" width="50px" height="20px" style="background-color : #196ab3;"><font color="white"><b>번호</b></font></td>
			<td align="center" width="100px" style="background-color : #196ab3;"><font color="white">카테고리</font></td>
			<td align="center" width="150px" style="background-color : #196ab3;"><font color="white">소분류</font></td>
			<td align="center" width="50px" style="background-color : #196ab3;"><font color="white">표지</font></td>
			<td align="center" width="500px" style="background-color : #196ab3;"><font color="white">제목</font></td>
			<td align="center" width="50px" style="background-color : #196ab3;"><font color="white">재고</font></td>
			<td align="center" width="80px" style="background-color : #196ab3;"><font color="white">수정하기</font></td>
			<td align="center" width="80px" style="background-color : #196ab3;"><font color="white">삭제하기</font></td>
		</tr>
	<%
		for(int i=0; i<bookSize; i++) {
	%>
		<tr height="30px">
			<td align="center"><%= bookNumberList[i] %></td>
			<td align="center"><%= bookCategoryList[i] %></td>
			<td align="center"><%= bookSubCategoryList[i] %></td>
			<td align="center"><img alt="표지" src="<%= filePath + bookImageList[i] %>" height="50" border="1"></td>
			<td align="left"><%= bookNameList[i] %></td>
			<td align="center"><%= bookStockList[i] %></td>
			<td><button class="button button1" onclick="window.location.href='adminUpdateBook.jsp?bookNumber=<%= bookNumberList[i] %>'">수정</button></td>
			<td><button class="button button2" onclick="window.location.href='adminDeleteBook.jsp?bookNumber=<%= bookNumberList[i] %>'">삭제</button></td>
		</tr>
	<%
		}
	%>
	</table>
</div>
