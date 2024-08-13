<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
		int bookSize = (int)(session.getAttribute("bookSize"));
		int bookLastNumber = (int)(session.getAttribute("bookLastNumber"));
		
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
    %>
    
    <%
	    String filePathStr = application.getRealPath("/bookshop/uploadFile");
		System.out.println(filePathStr);
	
    try{ 
    	int maxPostSize= 1024*1024*10;
    	String encoding="UTF-8";	    		
     	MultipartRequest mr = new MultipartRequest(request, filePathStr, maxPostSize, encoding, new DefaultFileRenamePolicy());

		String bookCategory = mr.getParameter("bookCategory");
		String bookSubCategory = mr.getParameter("bookSubCategory");
		String bookName = mr.getParameter("bookName");
		int bookPrice = Integer.parseInt(mr.getParameter("bookPrice"));
		int bookDiscount = Integer.parseInt(mr.getParameter("bookDiscount"));
		String bookInfo = mr.getParameter("bookInfo");
		int bookStock = Integer.parseInt(mr.getParameter("bookStock"));
		
		
		System.out.println("bookCategory : " + bookCategory);
		System.out.println("bookSubCategory : " + bookSubCategory);
		System.out.println("bookName : " + bookName);
		System.out.println("bookPrice : " + bookPrice);
		System.out.println("bookDiscount : " + bookDiscount);
		System.out.println("bookInfo : " + bookInfo);
		System.out.println("bookStock : " + bookStock);
	
		
		bookNumberList[bookSize] = bookLastNumber;
		bookCategoryList[bookSize] = bookCategory;
		bookSubCategoryList[bookSize] = bookSubCategory;
		bookNameList[bookSize] = bookName;
		bookPriceList[bookSize] = bookPrice;
		bookDiscountList[bookSize] = bookDiscount;
		bookInfoList[bookSize] = bookInfo;
		bookStockList[bookSize] = bookStock;
		
		
		
	
    	String item="";
    	String ofileName="";
    	String reFileName="";
    	Enumeration fileList= mr.getFileNames();	 
    	    	
    	int i = 0;
    	String sql = "";	    	   	
    	while(fileList.hasMoreElements()){				//첨부파일 끝까지 계속 반복
    		
     	  	item = (String)fileList.nextElement();
     	   	ofileName=mr.getOriginalFileName(item); 	 //원본 파일명	
     	  	reFileName=mr.getFilesystemName(item);		// 변경된 파일명 (파일명이 겹치지 않으면 변경안될수도있음)
     	   	
     	  	System.out.println("origin = " + ofileName);
 			System.out.println("re = " + reFileName);
 			
 			if(i == 0) {
 				bookImageList[bookSize] = reFileName;
 			} else if(i == 1) {
 				bookContentImageList[bookSize] = reFileName;
 			}
 			
 			i += 1;
     	} 
    	
    	
    	bookSize += 1;
    	bookLastNumber += 1;
    	
    	session.setAttribute("bookSize", bookSize);
    	session.setAttribute("bookLastNumber", bookLastNumber);
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
	}
    catch(Exception e){
    	e.printStackTrace();
	}
    
    

    
    %>    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    