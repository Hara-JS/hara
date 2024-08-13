<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String log = (String)session.getAttribute("log");

	String itemName = request.getParameter("itemName");

	int cartSize = (int)session.getAttribute("cartSize");
	int cartLastNumber = (int)session.getAttribute("cartLastNumber");
	int[] cartNumberList = (int[])session.getAttribute("cartNumberList");
	String[] cartBuyerList = (String[])session.getAttribute("cartBuyerList");
	String[] cartItemNameList = (String[])session.getAttribute("cartItemNameList");
	int[] cartBuyPriceList = (int[])session.getAttribute("cartBuyPriceList");
	int[] cartBuyCountList = (int[])session.getAttribute("cartBuyCountList");
	String[] cartItemImageList = (String[])session.getAttribute("cartItemImageList");	

	int count = 0;
	for(int i=0; i<cartSize; i++) {
		if(cartBuyerList[i].equals(log) && cartItemNameList[i].equals(itemName)) {
			count += 1;
		}
	}
	
	int temp = count;
	
	int index = 0;
	while(true) {
		
		if(temp == 0) {
			break;
		}
		
		if(cartBuyerList[index].equals(log) && cartItemNameList[index].equals(itemName)) {
			for(int i=index; i<cartSize - 1; i++) {
				cartBuyerList[i] = cartBuyerList[i + 1];
				cartItemNameList[i] = cartItemNameList[i + 1];
				cartBuyPriceList[i] = cartBuyPriceList[i + 1];
				cartBuyCountList[i] = cartBuyCountList[i + 1];
				cartItemImageList[i] = cartItemImageList[i + 1];
			}
			temp -= 1;
		} else {
			index += 1;
		}
	}
	
	cartSize -= count;
	
	session.setAttribute("cartNumberList", cartNumberList);
	session.setAttribute("cartBuyerList", cartBuyerList);
	session.setAttribute("cartItemNameList", cartItemNameList);
	session.setAttribute("cartBuyCountList", cartBuyCountList);
	session.setAttribute("cartItemImageList", cartItemImageList);
	session.setAttribute("cartSize", cartSize);	
	session.setAttribute("cartLastNumber", cartLastNumber);	
	
	response.sendRedirect("07_01_cartPage.jsp");
%>



