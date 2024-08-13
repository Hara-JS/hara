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
	// 책 정보
	// 아이템 카테고리 샘플 (50개)
	String[] bookCategorySample = {
      "컴퓨터공학","컴퓨터공학","컴퓨터공학","컴퓨터공학","컴퓨터공학","컴퓨터공학","컴퓨터공학","프로그래밍","프로그래밍","프로그래밍",
      "프로그래밍","프로그래밍","프로그래밍","프로그래밍","프로그래밍","프로그래밍","프로그래밍","프로그래밍","DB/OS","프로그래밍",   
      "프로그래밍","프로그래밍","프로그래밍","프로그래밍","컴퓨터공학","DB/OS","프로그래밍","컴퓨터공학","프로그래밍","프로그래밍",   
      "컴퓨터공학","DB/OS","DB/OS","컴퓨터공학","프로그래밍","컴퓨터공학","컴퓨터공학","컴퓨터공학","프로그래밍","DB/OS",   
      "DB/OS","DB/OS","컴퓨터공학","프로그래밍","프로그래밍","프로그래밍","컴퓨터공학","프로그래밍","프로그래밍","DB/OS"   
   };

  	//소분류샘플
 	String[] bookSubCategorySample = {
		"머신러닝/딥러닝","머신러닝/딥러닝","머신러닝/딥러닝","머신러닝/딥러닝","AI","일반/에세이","일반/에세이","HTML/CSS","파이썬","HTML/CSS",
		"Java Script","C/C++","파이썬","C/C++","C/C++","C/C++","C#","C#","IOS/안드로이드","Java Script",
		"파이썬","파이썬","파이썬","Java Script","AI","유닉스/리눅스","파이썬","머신러닝/딥러닝","JSP","JAVA",
		"머신러닝/딥러닝","IOS/안드로이드","IOS/안드로이드","머신러닝/딥러닝","JAVA","일반/에세이","일반/에세이","일반/에세이","파이썬","IOS/안드로이드",
		"IOS/안드로이드","유닉스/리눅스","머신러닝/딥러닝","JSP","JAVA","JAVA","머신러닝/딥러닝","파이썬","JSP","유닉스/리눅스"
 	};
  	
	// 아이템 이름 샘플
  	 String[] bookNameSample = {
        "혼자 공부하는 머신러닝+딥러닝","Must Have 머신러닝·딥러닝 문제해결 전략","파이썬 머신러닝 완벽 가이드","파이썬 머신러닝 판다스 데이터 분석","Do it! 첫 인공지능","비전공자를 위한 이해할 수 있는 IT 지식","비전공자도 이해할 수 있는 AI 지식","Do it! HTML+CSS+자바스크립트 웹 표준의 정석","혼자 공부하는 파이썬","코딩만 따라 해도 웹페이지가 만들어지는 HTML+CSS+자바스크립트",
        "자바스크립트 완벽 가이드","리눅스 C프로그래밍 스킬북","모두의 데이터 분석 with 파이썬","놀랄 만큼 재미있는 C언어 기초 WONDER C","266가지 문제로 정복하는 코딩 인터뷰 in C++","코딩 테스트를 위한 자료 구조와 알고리즘 with C++","C#을 다루는 기술","C# 프로그래밍(2판)","아키텍처를 알아야 앱 개발이 보인다","초보자를 위한 JavaScript 200제",   
        "데이터 과학을 위한 기초수학 with 파이썬","컴퓨팅 사고와 소프트웨어 with 파이썬","파이썬 클린 코드","자바스크립트 프로그래밍 입문","쉽게 배우는 AWS AI 서비스","이것이 우분투 리눅스다(개정판)","Do it! 점프 투 파이썬","모두의 딥러닝","자바 웹을 다루는 기술","Java의 정석",   
        "선형대수와 통계학으로 배우는 머신러닝 with 파이썬","코틀린을 이용한 안드로이드 개발","깡쌤의 안드로이드 프로그래밍 with 자바","코딩은 처음이라 with 딥러닝","생활코딩! 자바 프로그래밍 입문","1일 1로그 100일 완성 IT 지식","IT 지식으로 미래를 읽는다면","디지털 시대에 살아남는 IT 지식","만들면서 배우는 파이썬과 40개의 작품들","웹 표준을 이용한 iOS 앱 개발 트레이닝",   
        "Do it! 스위프트로 아이폰 앱 만들기 입문","모두의 리눅스","모두의 딥러닝","모바일 웹 서비스 구현을 위한 JSP 웹 프로그래밍","명품 JAVA Programming","개념있는 JAVA","이보다 더 쉬울 수 없는 자바 머신러닝 with Weka","이것이 취업을 위한 코딩 테스트다 with 파이썬","자신감 뿜뿜! JSP 웹 프로그래밍 Hard Carry","리눅스 입문자를 위한 명령어 사전"   
   	 }; 
	
	
  	 int[] bookPriceSample = {
	      26000, 38000, 40000, 25000, 13000, 16800, 19800, 30000, 18000, 24000,
	      42000, 25000, 18000, 32000, 35000, 32000, 36000, 26000, 30000, 25000,
	      26000, 25000, 28000, 27000, 30000, 32000, 18000, 24000, 45000, 30000,
	      37500, 30000, 35000, 18000, 27000, 20000, 14000, 16000, 18800, 16000,
	      30000, 25000, 24000, 30000, 33000, 25000, 31000, 34000, 26000, 32000
	 };

	
  	 int[] bookStockSample = {
         10, 9, 3, 2, 1, 0, 7, 6, 1, 3,   
         4, 2, 5, 8, 0, 7, 1, 0, 4, 3,   
         6, 1, 3, 9, 2, 9, 10, 8, 5, 3,
         10, 5, 10, 6, 7, 8, 7, 5, 6, 0,   
         6, 7, 8, 5, 8, 2, 0, 0, 0, 1
  	   };
	
	String[] bookImageSample = {
		"", "", "", "", "", "", "", "", "", "", 
		"", "", "", "", "", "", "", "", "", "", 
		"", "", "", "", "", "", "", "", "", "", 
		"", "", "", "", "", "", "", "", "", "", 
		"", "", "", "", "", "", "", "", "", ""
	};

	
	String[] bookInfoSample = {
		"박해선 저 | 한빛미디어 | 2020년 12월 21일", "신백균 저 | 골든래빗 | 2022년 04월 13일" , "권철민 저 | 위키북스 | 2022년 04월 21일","오승환 저 | 정보문화사 | 2019년 06월 15일", "이애리 저 | 이지스퍼블리싱 | 2022년 04월 01일", "최원영 저 | 티더블유아이지 | 2020년 07월 14일","박상길 저/정진호 그림 | 반니 | 2022년 03월 04일", "고경희 저 | 이지스퍼블리싱 | 2021년 01월 22일" , "윤인성 저 | 한빛미디어 | 2019년 06월 10일","반병현 저 | 생능북스 | 2022년 02월 15일",
		"데이비드 플래너건 저/한선용 역 | 인사이트(insight) | 2022년 03월 31일", "김원표, 박승주 저 | 홍릉 | 2022년 02월 24일", "송석리, 이현아 저 | 길벗 | 2019년 04월 25일", "조성호 저 | 인피니티북스 | 2021년 12월 17일", "아드난 아지즈, 쭝시엔 리, 아미트 프라카시 저/이창현, 김현욱 역 | 인사이트(insight) | 2021년 10월 01일", "존 캐리, 셰리안 도시, 파야스 라잔 저/황선규 역 | 길벗 | 2020년 12월 08일", "존 스킷 저/김명신 역 | 길벗 | 2021년 05월 13일", "윤인성 저 | 한빛아카데미 | 2021년 01월 05일", "옥수환 저 | 비제이퍼블릭(BJ퍼블릭) | 2020년 04월 17일", "고재도, 노지연 저 | 정보문화사 | 2019년 03월 10일", 
		"이병준 저 | 한빛아카데미 | 2021년 01월 06일", "성태응, 홍정희, 이홍래 저 | 인피니티북스 | 2022년 03월 02일", "마리아노 아나야 저/김창수 역 | 터닝포인트 | 2019년 02월 25일", "윤인성 저 | 한빛아카데미 | 2022년 01월 03일", "피터 엘거, 오언 셔너히 저/맹윤호, 임지순 역/곽근봉 감수 | 한빛미디어 | 2022년 04월 15일", "우재남 저 │ 한빛미디어 │ 2020년 11월 02일", "박응용 저 | 이지스퍼블리싱 | 2019년 06월 20일", "조태호 저 | 길벗 | 2022년 03월 31일", "이병승 저 | 길벗 | 2019년 01월 10일", "남궁성 저 | 도우출판 | 2016년 02월 01일", 
		"장철원 저 | 비제이퍼블릭(BJ퍼블릭) | 2021년 01월 26일", "마르친 모스칼라, 이고르 워다 저/최민석 역 | 에이콘출판사 | 2018년 05월 31일", "강성윤 저 | 쌤즈 | 2022년 04월 01일", "이종환 저 | 영진닷컴 | 2022년 04월 25일", "이고잉 저 | 위키북스 | 2022년 02월 09일", "브라이언 W. 커니핸 저/하성창 역 | 인사이트(insight) | 2021년 12월 31일", "윤정구 저 | 다른 | 2022년 03월 03일", "박성묵 저 | 정보문화사 | 2021년 08월 30일", "장문철 저 | 앤써북 | 2022년 02월 28일", "크리스토퍼 레이온 저 / 김지선 역 | 정보문화사 | 2012년 07월 13일", 
		"송호정 , 이범근 저 | 이지스퍼블리싱 | 2022년 02월 28일", "미야케 히데아키 , 오스미 유스케 저 | 이동규 역 | 길벗 | 2021년 12월 24일", "조태호 저 | 길벗 | 2022년 03월 31일", "김현규 , 박유현 저 | 한빛아카데미 | 2021년 08월 23일", "황기태 , 김효수 저 | 생능출판 | 2018년 06월 01일", "시바타 보요 저 | 김성훈 역 | 영진닷컴 | 2019년 01월 10일", "자바라머신러닝 저 | 비제이퍼블릭 | 2021년 01월 29일", "나동빈 저 | 한빛미디어 | 2020년 08월 05일", "신윤환 저 | 생능출판 | 2022년 01월 10일", "가와구치 히로시 , 다야 후미히코 , 미사와 아키라 저 | 서수환 역 | 한빛미디어 | 2021년 07월 07일", 
	};

	String[] bookContentImageSample = {
		"", "", "", "", "", "", "", "", "", "", 
		"", "", "", "", "", "", "", "", "", "", 
		"", "", "", "", "", "", "", "", "", "", 
		"", "", "", "", "", "", "", "", "", "", 
		"", "", "", "", "", "", "", "", "", ""
	};

	int [] bookDiscountSample = {
		10, 10, 10, 10, 10, 10, 10, 10, 10, 10,	
		10, 0, 10, 0, 10, 10, 10, 0, 10, 10,	
		5, 0, 10, 0, 10, 10, 10, 10, 10, 0,
		8, 10, 10, 10, 0, 10, 0, 10, 10, 10,
		5, 7, 10, 5, 10, 10, 10, 10, 0, 0
	};
	
	int [] bookSoldSample = {
		78024, 3288, 1302, 9177, 831, 73413, 23217, 53232, 80499, 3552,	
		4143, 90, 23670, 2208, 1170, 4632, 2874, 6498, 1524, 864,	
		3273, 1872, 3942, 1674, 714, 11148, 117618, 3084, 3162, 31371,
		7542, 66, 0, 330, 780, 35775, 654, 1500, 14856, 0,
		3660, 1464, 3084, 372, 17082, 132, 480, 42039, 783, 4362
	};
	
	// 시작 아이템 저장개수
	int 		bookSize 				= 0;
	int			bookLastNumber			= 1;
	int[] 		bookNumberList 			= new int[1000];
	String[] 	bookCategoryList 		= new String[1000];
	String[] 	bookSubCategoryList 	= new String[1000];
	String[] 	bookNameList 			= new String[1000];
	int[] 		bookPriceList 			= new int[1000];
	int[] 		bookStockList 			= new int[1000];
	String[] 	bookImageList 			= new String[1000];
	String[] 	bookInfoList 			= new String[1000];
	int[] 		bookDiscountList 		= new int[1000];
	int[] 		bookSoldList 			= new int[1000];
	String[] 	bookContentImageList 	= new String[1000];
	
	// 시작아이템 등록 
	// 아이템번호 (1~50)
	// System.out.println("[번호] [카테고리] [소분류] [아이템이름] [가격] [재고] [이미지이름] [아이템정보] [할인률] [팔린개수]");
	for(int i=0; i<50; i++){
		bookNumberList[i] = i + 1;
		bookCategoryList[i] = bookCategorySample[i];
		bookSubCategoryList[i] = bookSubCategorySample[i];
		bookNameList[i] = bookNameSample[i];
		bookPriceList[i] = bookPriceSample[i];
		bookStockList[i] = bookStockSample[i];
		bookImageList[i] = bookImageSample[i];
		bookInfoList[i] = bookInfoSample[i];
		bookDiscountList[i] = bookDiscountSample[i];
		bookSoldList[i] = bookSoldSample[i];
		bookContentImageList[i] = bookContentImageSample[i];
	}	
	
	bookSize = 50;
	bookLastNumber = 51;
	
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
%>	

<%	
	int 		boardSize 			= 0;
	int 		boardLastNumber 	= 1;
	int[] 		boardNumberList 	= new int[1000];
	String[] 	boardWriterList 	= new String[1000];
	String[] 	boardSubjectList 	= new String[1000];
	String[] 	boardContentList 	= new String[1000];
	String[] 	boardDateList 		= new String[1000];
	int[] 		boardReadCountList 	= new int[1000];
	
	int         boardRef 			= 1;
	int[]		boardRefList 		= new int[1000];
	int[]		boardStepList 		= new int[1000];
	int[]		boardLevelList 		= new int[1000];
	boolean[]	boardRemoveList		= new boolean[1000];

	
	for(int i=0; i<50; i++) {
		boardNumberList[i] = i + 1;
		boardWriterList[i] = "작성자" + boardLastNumber;
		boardSubjectList[i] = "제목" + boardLastNumber;
		boardContentList[i] = "내용" + boardLastNumber;
		boardDateList[i] = "2024-05-16 14:30:21";
		boardReadCountList[i] = 0;
		
		boardRefList[i] = boardRef;
		boardStepList[i] = 1;
		boardLevelList[i] = 1;
		boardRemoveList[i] = false;
		
		boardRef += 1;
		
		boardSize += 1;
		boardLastNumber += 1;
		
	}
	
	// 게시판정보
	session.setAttribute("boardSize", boardSize);
	session.setAttribute("boardLastNumber", boardLastNumber);
	session.setAttribute("boardNumberList", boardNumberList);
	session.setAttribute("boardWriterList", boardWriterList);
	session.setAttribute("boardSubjectList", boardSubjectList);
	session.setAttribute("boardContentList", boardContentList);
	session.setAttribute("boardDateList", boardDateList);
	session.setAttribute("boardReadCountList", boardReadCountList);
	
	session.setAttribute("boardRef", boardRef);
	session.setAttribute("boardRefList", boardRefList);
	session.setAttribute("boardStepList", boardStepList);
	session.setAttribute("boardLevelList", boardLevelList);
	session.setAttribute("boardRemoveList", boardRemoveList);
	
	
	int 		boardImageSize 				= 0;
	int			boardImageLastNumber		= 1;
	int[] 		boardImageNumberList 		= new int[1000];
	int[] 		boardImageBoardNumberList 	= new int[1000];
	String[] 	boardImageNameList 			= new String[1000];
	
	for(int i=0; i<50; i++) {
		boardImageNumberList[i] = boardImageLastNumber;
		boardImageBoardNumberList[i] = boardImageLastNumber;
		boardImageNameList[i] = "1.jpg";
		
		boardImageSize += 1;
		boardImageLastNumber += 1;
	}
	
	
	session.setAttribute("boardImageSize", boardImageSize);
	session.setAttribute("boardImageLastNumber", boardImageLastNumber);
	session.setAttribute("boardImageNumberList", boardImageNumberList);
	session.setAttribute("boardImageBoardNumberList", boardImageBoardNumberList);
	session.setAttribute("boardImageNameList", boardImageNameList);
	
%>	

<%
	// 장바구니 정보
	int[] cartNumberList 		= new int[1000];
	String[] cartBuyerList 		= new String[1000];
	int[] cartBuyCountList 		= new int[1000];
	int[] cartBookNumberList 	= new int[1000];
	
	int cartSize = 0;
	int cartLastNumber = 1;
	
	session.setAttribute("cartSize", cartSize);	
	session.setAttribute("cartNumberList", cartNumberList);
	session.setAttribute("cartLastNumber", cartLastNumber);
	session.setAttribute("cartBuyerList", cartBuyerList);
	session.setAttribute("cartBuyCountList", cartBuyCountList);
	session.setAttribute("cartBookNumberList", cartBookNumberList);
%>

<%
	// 배송정보
	int deliverySize = 0;
	int deliveryLastNumber = 1;
	int[] deliveryNumberList		= new int[1000];
	String[] deliveryNameList		= new String[1000];
	String[] deliveryAddrList		= new String[1000];
	String[] deliveryTelList		= new String[1000];
	
	session.setAttribute("deliverySize", deliverySize);
	session.setAttribute("deliveryLastNumber", deliveryLastNumber);
	session.setAttribute("deliveryNumberList", deliveryNumberList);
	session.setAttribute("deliveryNameList", deliveryNameList);
	session.setAttribute("deliveryAddrList", deliveryAddrList);
	session.setAttribute("deliveryTelList", deliveryTelList);
%>


<%
	// 결제 정보
	int orderSize = 0;
	int orderLastNumber = 1;
	int[] orderNumberList		 	= new int[1000];
	int[] orderDeliveryNumberList	= new int[1000];
	int[] orderBookNumberList		= new int[1000];
	int[] orderBuyCountList			= new int[1000];
	String[] orderBuyerList			= new String[1000];
	
	session.setAttribute("orderSize", orderSize);
	session.setAttribute("orderLastNumber", orderLastNumber);
	session.setAttribute("orderNumberList", orderNumberList);
	session.setAttribute("orderDeliveryNumberList", orderDeliveryNumberList);
	session.setAttribute("orderBookNumberList", orderBookNumberList);
	session.setAttribute("orderBuyCountList", orderBuyCountList);
	session.setAttribute("orderBuyerList", orderBuyerList);
%>
	
<%
	response.sendRedirect("bookshop/shop/itemList.jsp");
%>


