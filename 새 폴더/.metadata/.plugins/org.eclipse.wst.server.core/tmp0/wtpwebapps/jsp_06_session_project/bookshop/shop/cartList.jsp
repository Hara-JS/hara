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
		
		String filePath = request.getContextPath() + "/bookshop/uploadFile/";
		
		int cartSize = (int)session.getAttribute("cartSize");
		int cartLastNumber = (int)session.getAttribute("cartLastNumber");
		String[] cartBuyerList = (String[])session.getAttribute("cartBuyerList");
		int[] cartBuyCountList = (int[])session.getAttribute("cartBuyCountList");
		int[] cartBuyPriceList = (int[])session.getAttribute("cartBuyPriceList");
		int[] cartBookNumberList = (int[])session.getAttribute("cartBookNumberList");
		
		int bookSize = (int)(session.getAttribute("bookSize"));
		int bookLastNumber = (int)(session.getAttribute("bookLastNumber"));
		int[] bookNumberList = (int[])(session.getAttribute("bookNumberList"));
		String[] bookCategoryList = (String[] )(session.getAttribute("bookCategoryList"));
		String[] bookNameList = (String[])(session.getAttribute("bookNameList"));
		int[] bookPriceList = (int[])(session.getAttribute("bookPriceList"));
		int[] bookStockList = (int[])(session.getAttribute("bookStockList"));
		String[] bookImageList = (String[])(session.getAttribute("bookImageList"));
		String[] bookInfoList =(String[])(session.getAttribute("bookInfoList"));
		int[] bookDiscountList =(int[])(session.getAttribute("bookDiscountList"));
		int[] bookSoldList =(int[])(session.getAttribute("bookSoldList"));	
		
		String[] myCartBookNameList = new String[1000];
		int[] myCartBuyPriceList = new int[1000];
		int[] myCartBuyCountList = new int[1000];
		String[] myCartBookImageList = new String[1000];	
		
		int total = 0;
		int count = 0;
		for(int i=0; i<cartSize; i++) {
			if(cartBuyerList[i].equals(log)) {
				
				myCartBuyCountList[count] = cartBuyCountList[i];
				
				for(int j=0; j<bookSize; j++) {
					if(cartBookNumberList[i] == bookNumberList[j]) {
						myCartBookNameList[count] = bookNameList[j];
						
						int discountPrice = bookPriceList[j] - bookPriceList[j]*bookDiscountList[j]/100;
						int buyPrice = discountPrice * myCartBuyCountList[count];
						myCartBuyPriceList[count] = buyPrice;
						myCartBookImageList[count] = bookImageList[j];
						
						total += buyPrice;
						count += 1;
					}
				}
			}
		}
	%>
	
	    <jsp:include page="../layout/header.jsp"></jsp:include>	
	
		<div align="center">
		<h1>장바구니</h1>
		
		<% if(count == 0) { %>
			<h1>장바구니가 비었습니다.</h1>
		<% } else { %>
		<table border="1">
		<% for(int i=0; i<count; i++) { %>
				<tr>
					<td><%= i + 1 %></td>
					<td><img src="<%= filePath + myCartBookImageList[i] %>" width="100px"></td>
					<td><%= myCartBookNameList[i] %></td>
					<td><%= myCartBuyCountList[i] %></td>
					<td><%= myCartBuyPriceList[i] %></td>
				</tr>
		<% } %>
				<tr>
					<td>총 상품금액</td>
					<td colspan="5" align="right"><%= total %></td>
				</tr>
				<tr>
					<td>배송비</td>
					<td colspan="5" align="right">
					<% 
						int limitPrice = 40000;
						int deliveryPrice = 3000;
						int addPrice = 0;
						
						// 총 상품 구매 금액이 4만원 이상이면 무료 배송
						if(total >= limitPrice) {
							deliveryPrice = 0;
						} else {
							addPrice = limitPrice - total;
						}
					%>
					<%	if(deliveryPrice == 0) { %>
						0 원
					<% 	} else {  %>
						<%= addPrice %>원 추가 주문 시, 무료 배송
					<%  } %>
					</td>
				</tr>
				<tr>
					<td>총 결제금액</td>
					<td colspan="5" align="right"><%= total + deliveryPrice %>원</td>
				</tr>
				<tr>
					<td  colspan="6" align="right">
						<button onclick="window.location.href='addOrder.jsp'">주문하기</button>
					</td>
				</tr>
			</table>
		<% } %>
	</div>
	
	 <jsp:include page="../layout/footer.jsp"></jsp:include>
	
</body>
</html>