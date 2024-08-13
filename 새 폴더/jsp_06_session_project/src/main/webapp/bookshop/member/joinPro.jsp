<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	request.setCharacterEncoding("UTF-8");
	%>    

	<%
	int memberSize = (int)session.getAttribute("memberSize");
	int memberLastNumber = (int)session.getAttribute("memberLastNumber");
	int[] memberNumberList = (int[])session.getAttribute("memberNumberList");
	String[] memberIdList = (String[])session.getAttribute("memberIdList");
	String[] memberPwList = (String[])session.getAttribute("memberPwList");
	String[] memberNameList = (String[])session.getAttribute("memberNameList");
	String[] memberEmailList = (String[])session.getAttribute("memberEmailList");
	String[] memberPhoneList = (String[])session.getAttribute("memberPhoneList");
	String[] memberAddr1List = (String[])session.getAttribute("memberAddr1List");
	String[] memberAddr2List = (String[])session.getAttribute("memberAddr2List");
	String[] memberAddr3List = (String[])session.getAttribute("memberAddr3List");
	String[] memberGenderList = (String[])session.getAttribute("memberGenderList");
	String[] memberRouteList = (String[])session.getAttribute("memberRouteList");
	boolean[] memberMarketingList = (boolean[])session.getAttribute("memberMarketingList");
	
	
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String addr3 = request.getParameter("addr3");
	String gender = request.getParameter("gender");
	String route = request.getParameter("route");
	boolean marketing = Boolean.parseBoolean(request.getParameter("marketing"));
	
	System.out.println("id = " + id);
	System.out.println("pw = " + pw);
	System.out.println("name = " + name);
	System.out.println("email = " + email);
	System.out.println("addr1 = " + addr1);
	System.out.println("addr2 = " + addr2);
	System.out.println("addr3 = " + addr3);
	System.out.println("gender = " + gender);
	System.out.println("route = " + route);
	System.out.println("marketing = " + marketing);
	
	memberNumberList[memberSize] = memberLastNumber;
	memberIdList[memberSize] = id;
	memberPwList[memberSize] = pw;
	memberNameList[memberSize] = name;
	memberEmailList[memberSize] = email;
	memberPhoneList[memberSize] = phone;
	memberAddr1List[memberSize] = addr1;
	memberAddr2List[memberSize] = addr2;
	memberAddr3List[memberSize] = addr3;
	memberGenderList[memberSize] = gender;
	memberRouteList[memberSize] = route;
	memberMarketingList[memberSize] = marketing;
	
	
	memberSize += 1;
	memberLastNumber += 1;
	
	
	session.setAttribute("memberSize", memberSize);
	session.setAttribute("memberLastNumber", memberLastNumber);
	session.setAttribute("memberNumberList", memberNumberList);
	session.setAttribute("memberIdList", memberIdList);
	session.setAttribute("memberPwList", memberPwList);
	session.setAttribute("memberNameList", memberNameList);
	session.setAttribute("memberEmailList", memberEmailList);
	session.setAttribute("memberPhoneList", memberPhoneList);
	session.setAttribute("memberAddr1List", memberAddr1List);
	session.setAttribute("memberAddr2List", memberAddr2List);
	session.setAttribute("memberAddr3List", memberAddr3List);
	session.setAttribute("memberGenderList", memberGenderList);
	session.setAttribute("memberRouteList", memberRouteList);
	session.setAttribute("memberMarketingList", memberMarketingList);
	%>













