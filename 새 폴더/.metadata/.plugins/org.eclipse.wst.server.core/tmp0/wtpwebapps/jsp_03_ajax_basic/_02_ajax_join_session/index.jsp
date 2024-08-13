<%@page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
<%
	session.setAttribute("log", null);

	// 관리자 정보
	String adminId = "admin";
	String adminPw = "admin";
	String adminName = "관리자";
	String adminEmail = "admin@naver.com";
	
	session.setAttribute("adminId", adminId);
	session.setAttribute("adminPw", adminPw);
	session.setAttribute("adminName", adminName);
	session.setAttribute("adminEmail", adminEmail);
%>
	
<%
	// 회원 정보
	int memberSize 					= 0;
	int memberLastNumber 			= 1;
	int[]	 memberNumberList 		= new int[1000];
	String[] memberIdList 			= new String[1000];
	String[] memberPwList 			= new String[1000];
	String[] memberNameList 		= new String[1000];
	String[] memberEmailList 		= new String[1000];
	String[] memberPhoneList		= new String[1000];
	String[] memberAddr1List		= new String[1000];
	String[] memberAddr2List		= new String[1000];
	String[] memberAddr3List		= new String[1000];
	String[] memberGenderList		= new String[1000];
	String[] memberRouteList		= new String[1000];
	boolean[] memberMarketingList	= new boolean[1000];
		
	memberIdList[memberSize] = "qwer1234";
	memberPwList[memberSize] = "Qwer1234!";
	memberNameList[memberSize] = "홍길동";
	memberEmailList[memberSize] = "qwer@naver.com";
	memberPhoneList[memberSize] = "01012345678";
	memberAddr1List[memberSize] = "02830";
	memberAddr2List[memberSize] = "서울 성북구 아리랑로 3";
	memberAddr3List[memberSize] = "100동 209호";
	memberGenderList[memberSize] = "1";
	memberRouteList[memberSize] = "1";
	memberMarketingList[memberSize] = true;
	memberSize += 1;
	
	memberIdList[memberSize] = "abcd1234";
	memberPwList[memberSize] = "Abcd1234!";
	memberNameList[memberSize] = "김수정";
	memberEmailList[memberSize] = "abcd@naver.com";
	memberPhoneList[memberSize] = "01012345678";
	memberAddr1List[memberSize] = "02830";
	memberAddr2List[memberSize] = "서울 성북구 아리랑로 3";
	memberAddr3List[memberSize] = "100동 209호";
	memberGenderList[memberSize] = "2";
	memberRouteList[memberSize] = "1";
	memberMarketingList[memberSize] = false;
	memberSize += 1;

	memberIdList[memberSize] = "hello1234";
	memberPwList[memberSize] = "Hello1234!";
	memberNameList[memberSize] = "박철수";
	memberEmailList[memberSize] = "hello@naver.com";
	memberPhoneList[memberSize] = "01012345678";
	memberAddr1List[memberSize] = "02830";
	memberAddr2List[memberSize] = "서울 성북구 아리랑로 3";
	memberAddr3List[memberSize] = "100동 209호";
	memberGenderList[memberSize] = "1";
	memberRouteList[memberSize] = "1";
	memberMarketingList[memberSize] = true;
	memberSize += 1;
	
	memberLastNumber = 4;
	
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

	
<%
	response.sendRedirect("main.jsp");
%>


