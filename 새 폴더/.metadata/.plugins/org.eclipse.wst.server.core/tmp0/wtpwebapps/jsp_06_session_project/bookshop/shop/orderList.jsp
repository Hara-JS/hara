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
		String log = (String)session.getAttribute("log");
		
		int orderSize = (int)(session.getAttribute("orderSize"));
		int[] orderNumberList = (int[])(session.getAttribute("orderNumberList"));
		int[] orderDeliveryNumberList = (int[])(session.getAttribute("orderDeliveryNumberList"));
		int[] orderBookNumberList = (int[])(session.getAttribute("orderBookNumberList"));
		int[] orderBuyCountList = (int[])(session.getAttribute("orderBuyCountList"));
		String[] orderBuyerList = (String[] )(session.getAttribute("orderBuyerList"));
		
		int bookSize = (int)(session.getAttribute("bookSize"));
		int[] bookNumberList = (int[])(session.getAttribute("bookNumberList"));
		String[] bookCategoryList = (String[] )(session.getAttribute("bookCategoryList"));
		String[] bookNameList = (String[])(session.getAttribute("bookNameList"));
		int[] bookPriceList = (int[])(session.getAttribute("bookPriceList"));
		int[] bookStockList = (int[])(session.getAttribute("bookStockList"));
		String[] bookImageList = (String[])(session.getAttribute("bookImageList"));
		String[] bookInfoList =(String[])(session.getAttribute("bookInfoList"));
		int[] bookDiscountList =(int[])(session.getAttribute("bookDiscountList"));
		int[] bookSoldList =(int[])(session.getAttribute("bookSoldList"));	
		
		String[] viewBookImageList = new String[1000];
		String[] viewBookNameList = new String[1000];
		int[] viewBookBuyCountList = new int[1000];
		int[] viewBookBuyPriceList = new int[1000];
		int[] viewOrderDeliveryNumberList = new int[1000];
		int viewCount = 0;
		for(int i=0; i<orderSize; i++) {
			if(orderBuyerList[i].equals(log)) {
				viewBookBuyCountList[viewCount] = orderBuyCountList[i];
				viewOrderDeliveryNumberList[viewCount] = orderDeliveryNumberList[i];
				for(int j=0; j<bookSize; j++) {
					if(orderBookNumberList[i] == bookNumberList[j]) {
						viewBookImageList[viewCount] = bookImageList[j];
						viewBookNameList[viewCount] = bookNameList[j];
						
						int discountPrice = bookPriceList[j] - bookPriceList[j]*bookDiscountList[j]/100;
						int buyPrice = discountPrice * viewBookBuyCountList[viewCount];
						viewBookBuyPriceList[viewCount] = buyPrice;
	
						viewCount += 1;
					}
				}
			}
		}
	%>  
	
	    <jsp:include page="../layout/header.jsp"></jsp:include>	
	
		<div align="center">
		
		<h1>주문 목록</h1>
		<%
			int lineCount = 0;
		%>
		<% if(viewCount == 0) { %>
			<h1>주문 정보가 없습니다.</h1>
		<% } else { %>
			<table border="1">
			<% for(int i=0; i<viewCount; i++) { %>
				<%if(lineCount != viewOrderDeliveryNumberList[i]){ 
					lineCount = viewOrderDeliveryNumberList[i];%>
					<tr>
						<td colspan="5"><hr/></td>
					</tr>
				<% }%>
				<tr>
					<td><%= i + 1 %></td>
					<td><%= viewBookImageList[i] %></td>
					<td><%= viewBookNameList[i] %></td>
					<td><%= viewBookBuyCountList[i] %></td>
					<td><%= viewBookBuyPriceList[i] %></td>
				</tr>
			<% } %>
			</table>
		<% } %>
	</div>	
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
</body>
</html>