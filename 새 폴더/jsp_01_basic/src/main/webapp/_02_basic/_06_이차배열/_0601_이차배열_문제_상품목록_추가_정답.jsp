<%@page import="java.util.Arrays"%>
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
		/*
			itemData는 이번달 과일판매목록이다. 
			데이터 순서는 번호,이름,가격,판매개수 이다.
			마지막 "0" 은 각 아이템별 총매출가격이다.
			
		    [문제] 
				각 상품별 매출 총합을 각각 배열의 뒤에 추가하시오.
			[정답] 
				[1001, 사과, 3000, 32, 96000]
				[1002, 배, 2000, 12, 24000]
				[1003, 딸기, 4000, 42, 168000]
				[1004, 바나나, 1500, 55, 82500]
		*/
		String[][] itemData = {
		    {"1001", "사과" , "3000", "32" , "0"},         
		    {"1002", "배"  , "2000", "12" , "0"},        
		    {"1003", "딸기" , "4000", "42" , "0"},         
		    {"1004", "바나나", "1500", "55" , "0"},      
		};
	
		int total = 0;
		for(int i = 0; i < itemData.length; i++){
		    int a = Integer.parseInt(itemData[i][2]);
		    int b = Integer.parseInt(itemData[i][3]);
		    int result = a * b;
		    itemData[i][4] = result + ""; // 꼼수이다.
		}
		
		for(int i = 0; i < itemData.length; i++){
			System.out.println(Arrays.toString(itemData[i]));
		}
	%>
	
	<div align="center">
		<h3>이번 달 과일 판매 목록</h3>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>가격</td>
				<td>판매 개수</td>
				<td>총 매출</td>
			</tr>
		<% for(int i = 0; i < itemData.length; i++) { %>
			<tr>
				<td><%= itemData[i][0] %></td>
				<td><%= itemData[i][1] %></td>
				<td><%= itemData[i][2] %></td>
				<td><%= itemData[i][3] %></td>
				<td><%= itemData[i][4] %></td>
			</tr>
		<%	} %>
		</table>
	</div>
</body>
</html>














