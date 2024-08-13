<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String log = request.getParameter("log");
		
		int index = Integer.parseInt(request.getParameter("index"));
		int buyCount = Integer.parseInt(request.getParameter("buyCount"));
		
		int bookSize = (int)(session.getAttribute("bookSize"));
		
		int[] bookNumberList = (int[])(session.getAttribute("bookNumberList"));
		String[] bookCategoryList = (String[] )(session.getAttribute("bookCategoryList"));
		String[] bookNameList = (String[])(session.getAttribute("bookNameList"));
		int[] bookPriceList = (int[])(session.getAttribute("bookPriceList"));
		int[] bookStockList = (int[])(session.getAttribute("bookStockList"));
		String[] bookImageList = (String[])(session.getAttribute("bookImageList"));
		int[] bookDiscountList =(int[])(session.getAttribute("bookDiscountList"));
		int[] bookSoldList =(int[])(session.getAttribute("bookSoldList"));	
		
		// check 값이 양의 정수일 경우, 재고 부족으로 구매 불가
		int check = bookStockList[index];
		if(buyCount <= bookStockList[index]) {
			check = -1;
			
			int cartSize = (int)session.getAttribute("cartSize");
			int cartLastNumber = (int)session.getAttribute("cartLastNumber");
			int[] cartNumberList = (int[])session.getAttribute("cartNumberList");
			String[] cartBuyerList = (String[])session.getAttribute("cartBuyerList");
			int[] cartBuyCountList = (int[])session.getAttribute("cartBuyCountList");
			int[] cartBookNumberList = (int[])session.getAttribute("cartBookNumberList");
			
			cartNumberList[cartSize] = cartLastNumber;
			cartBuyerList[cartSize] = log;
			cartBuyCountList[cartSize] = buyCount;
			cartBookNumberList[cartSize] = bookNumberList[index];
			
			cartSize += 1;
			cartLastNumber += 1;
			
			bookStockList[index] -= buyCount;
			bookSoldList[index] += buyCount;
			
			session.setAttribute("cartSize", cartSize);	
			session.setAttribute("cartLastNumber", cartLastNumber);	
			session.setAttribute("cartNumberList", cartNumberList);
			session.setAttribute("cartBuyerList", cartBuyerList);
			session.setAttribute("cartBuyCountList", cartBuyCountList);
			session.setAttribute("cartBookNumberList", cartBookNumberList);
			
			session.setAttribute("bookStockList", bookStockList);
			session.setAttribute("bookSoldList", bookSoldList);
		} 
	%>
	<p id="check"><%= check %>


