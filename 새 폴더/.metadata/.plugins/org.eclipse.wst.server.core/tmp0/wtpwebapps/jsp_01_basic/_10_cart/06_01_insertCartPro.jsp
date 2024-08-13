<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Object obj = session.getAttribute("log");
	String log = (String)obj;
	
	// 로그아웃 상태
	if(log == null) {
		response.sendRedirect("03_01_loginPage.jsp");
	} 
	// 로그인 상태
	else {
		// 1. 상품 번호
		int itemNumber = Integer.parseInt(request.getParameter("itemNumber"));
		// 2. 구매 수량
		int buyCount = Integer.parseInt(request.getParameter("buyCount"));
		//--------------------------------------------------------------------
		int itemSize = (int)(session.getAttribute("itemSize"));
		int[] itemNumberList = (int[])(session.getAttribute("itemNumberList"));
		int index = 0;
		for(int i=0; i<itemSize; i++) {
			if(itemNumberList[i] == itemNumber) {
				index = i;
				break;
			}
		}
		
		String[] itemCategoryList = (String[] )(session.getAttribute("itemCategoryList"));
		String[] itemNameList = (String[])(session.getAttribute("itemNameList"));
		int[] itemPriceList = (int[])(session.getAttribute("itemPriceList"));
		int[] itemStockList = (int[])(session.getAttribute("itemStockList"));
		String[] itemImageList = (String[])(session.getAttribute("itemImageList"));
		String[] itemInfoList =(String[])(session.getAttribute("itemInfoList"));
		int[] itemDiscountList =(int[])(session.getAttribute("itemDiscountList"));
		int[] itemSoldList =(int[])(session.getAttribute("itemSoldList"));
		
		int discountPrice = itemPriceList[index] - itemPriceList[index] * itemDiscountList[index] / 100;
		//--------------------------------------------------------------------
		int cartSize = (int)session.getAttribute("cartSize");
		int cartLastNumber = (int)session.getAttribute("cartLastNumber");
		int[] cartNumberList = (int[])session.getAttribute("cartNumberList");
		String[] cartBuyerList = (String[])session.getAttribute("cartBuyerList");
		String[] cartItemNameList = (String[])session.getAttribute("cartItemNameList");
		int[] cartBuyPriceList = (int[])session.getAttribute("cartBuyPriceList");
		int[] cartBuyCountList = (int[])session.getAttribute("cartBuyCountList");
		String[] cartItemImageList = (String[])session.getAttribute("cartItemImageList");
		
		cartNumberList[cartSize] = cartLastNumber + 1;
		cartBuyerList[cartSize] = log;
		cartItemNameList[cartSize] = itemNameList[index];
		cartBuyPriceList[cartSize] = discountPrice;
		cartBuyCountList[cartSize] = buyCount;
		cartItemImageList[cartSize] = itemImageList[index];
		
		cartSize += 1;
		cartLastNumber += 1;

		//--------------------------------------------------------------------		
		session.setAttribute("cartSize", cartSize);	
		session.setAttribute("cartLastNumber", cartLastNumber);	
		session.setAttribute("cartNumberList", cartNumberList);
		session.setAttribute("cartBuyerList", cartBuyerList);
		session.setAttribute("cartItemNameList", cartItemNameList);
		session.setAttribute("cartBuyPriceList", cartBuyPriceList);
		session.setAttribute("cartBuyCountList", cartBuyCountList);
		session.setAttribute("cartItemImageList", cartItemImageList);
		
		response.sendRedirect("07_01_cartPage.jsp");
	}
%>




