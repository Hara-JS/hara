<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int bookNumber = Integer.parseInt(request.getParameter("bookNumber"));

	int bookSize = (int)(session.getAttribute("bookSize"));
	
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
	
	
	int index = 0;
	for(int i=0; i<bookSize; i++) {
		if(bookNumberList[i] == bookNumber) {
			index = i;
			break;
		}
	}
	
	for(int i=index; i<bookSize - 1; i++) {
		bookNumberList[i] = bookNumberList[i + 1];
		bookCategoryList[i] = bookCategoryList[i + 1];
		bookSubCategoryList[i] = bookSubCategoryList[i + 1];
		bookNameList[i] = bookNameList[i + 1];
		bookPriceList[i] = bookPriceList[i + 1];
		bookStockList[i] = bookStockList[i + 1];
		bookImageList[i] = bookImageList[i + 1];
		bookContentImageList[i] = bookContentImageList[i + 1];
		bookInfoList[i] = bookInfoList[i + 1];
		bookDiscountList[i] = bookDiscountList[i + 1];
		bookSoldList[i] = bookSoldList[i + 1];
	}
	bookSize -= 1;
	
	session.setAttribute("bookSize", bookSize);
	session.setAttribute("bookNumberList", bookNumberList);
	session.setAttribute("bookCategoryList", bookCategoryList);
	session.setAttribute("bookSubCategoryList", bookSubCategoryList);
	session.setAttribute("bookNameList", bookNameList);
	session.setAttribute("bookPriceList", bookPriceList);
	session.setAttribute("bookStockList", bookStockList);
	session.setAttribute("bookImageList", bookImageList);
	session.setAttribute("bookInfoList", bookInfoList);
	session.setAttribute("bookDiscountList", bookDiscountList);
	session.setAttribute("bookSoldList", bookSoldList);
	session.setAttribute("bookContentImageList", bookContentImageList);
	
	response.sendRedirect("adminItemList.jsp");
%> 




