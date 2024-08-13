<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
   
    
<%
	System.out.println("bookNumberList = " + session.getAttribute("bookNumberList"));

	int[] bookNumberList = (int[])(session.getAttribute("bookNumberList"));
	String[] bookCategoryList = (String[] )(session.getAttribute("bookCategoryList"));
	String[] bookSubCategoryList = (String[] )(session.getAttribute("bookSubCategoryList"));
	String[] bookNameList = (String[])(session.getAttribute("bookNameList"));
	int[] bookPriceList = (int[])(session.getAttribute("bookPriceList"));
	int[] bookStockList = (int[])(session.getAttribute("bookStockList"));
	String[] bookImageList = (String[])(session.getAttribute("bookImageList"));
	String[] bookContentImageList = (String[])(session.getAttribute("bookContentImageList"));
	String[] bookInfoList =(String[])(session.getAttribute("bookInfoList"));
	int[] bookDiscountList =(int[])(session.getAttribute("bookDiscountList"));
	int[] bookSoldList =(int[])(session.getAttribute("bookSoldList"));
	
	
	int bookSize = (int)(session.getAttribute("bookSize"));
	
	String filePath = request.getContextPath() + "/bookshop/uploadFile/";
%>
       
    <jsp:include page="../layout/header.jsp"></jsp:include>		
    
    	<div align="center">
    	<h1>메인 페이지</h1>
    	<table border="1">
    		<tr>
    			<td colspan="6"><h1>전체 도서 목록</h1></td>
    		</tr>
    		<% int index = 0; %>
    		<% while(index < bookSize) { %>
    		<tr>
    			<% for(int j=0; j<6; j++) { %>
    			<% if(index + j >= bookSize) break; %>
    				<td width="150px" height="150px" align="center">
    				<% if(bookStockList[index + j] > 0) { %>
    					<a href="itemInfo.jsp?bookNumber=<%= bookNumberList[index + j] %>"><img src="<%= filePath + bookImageList[index + j] %>" width="100px" style="border: 1px solid lightgray"></a>
    				<% } else { %>
    					<img src="<%= filePath + bookImageList[index + j] %>" width="100px" style="border: 1px solid lightgray; opacity: 20%">
    				<% } %>
    				</td>
    			<% } %>
    		</tr>
    		<tr>
    			<% for(int j=0; j<6; j++) { %>
    				<% if(index + j >= bookSize) break; %>
    				<td>
    					<% if(bookStockList[index + j] > 0) { %>
	    					<a href="itemInfo.jsp?bookNumber=<%= bookNumberList[index + j] %>"><%= bookNameList[index + j] %></a>
    					<% } else { %>
    						<%= bookNameList[index + j] %> 
    					<% } %>
    				</td>
    			<% } %>
    		</tr>
    		<tr>
    			<% for(int j=0; j<6; j++) { %>
    			<% int discountPrice = bookPriceList[index + j] - bookPriceList[index + j] * bookDiscountList[index + j] / 100; %>
    				<% if(index + j >= bookSize) break; %>
    				<% if(bookStockList[index + j] <= 0) { %>
    					<td><b>품절</b></td>
    				<%  } else if(bookDiscountList[index + j] > 0) { %>
    				<td><%= bookPriceList[index + j] %> -> <%= discountPrice %></td>
    				<% } else { %>
    				<td><%= bookPriceList[index + j] %></td>
    				<% } %>
    			<% } %>
    		</tr>
    		<% index += 6; %>
    		<%	} %>
    	</table>
    	</div>	
    
    <jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
    

    
    
  
    