<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 데이터 초기 셋팅
	//회원 배열
	String[] idList = new String[1000];
	String[] pwList = new String[1000];
	String[] nameList = new String[1000];	
	int memberSize = 0;
	
	idList[0] = "admin";
	pwList[0] = "admin";
	nameList[0] = "admin";
	memberSize += 1;
	
	idList[1] = "qwer";
	pwList[1] = "1234";
	nameList[1] = "김철수";
	memberSize += 1;
	
	idList[2] = "asdf";
	pwList[2] = "4321";
	nameList[2] = "이수정";
	memberSize += 1;
	
	session.setAttribute("idList", idList);
	session.setAttribute("pwList", pwList);
	session.setAttribute("nameList", nameList);
	session.setAttribute("memberSize", memberSize);

	//-------------------------------------------------------------------------------------

	// 아이템 카테고리 샘플 (30개)
	String[] itemCategorySample = {
		"채소", "채소" , "채소","채소", "채소" , "채소","채소", "채소" , "채소","채소", 	// 10
		"해산물","해산물","해산물","해산물","해산물","해산물",						   	// 6
		"육류","육류","육류","육류","육류","육류","육류","육류","육류","육류",		   	// 10
		"전자제품","전자제품","전자제품","전자제품"								   		// 4
	};
		
	// 아이템 이름 샘플
	String[] itemNameSample = {
		"대파", "상추" , "당근","깻잎", "애호박" , "버섯","단호박", "파프리카" , "아스파라거스","양파",
		"자반고등어","연어","오징어","바지락","새우","전복",
		"막창","안심스테이크","닭","닭다리" , "폭립","양념갈비","등갈비구이","치즈돈가스","닭가슴살","차돌박이",
		"그라인더","스팀다리미","헤어드라이기","체중계"
	};	
	
	int[] itemPriceSample = {
		10000, 11000, 12000, 13000, 14000, 15000, 16000, 17000, 18000, 19000,
		20000, 21000, 22000, 23000, 24000, 25000, 26000, 27000, 28000, 29000,
		30000, 31000, 32000, 33000, 34000, 35000, 36000, 27000, 38000, 39000,
	};
	
	int[] itemStockSample = {
			1, 2, 3, 4, 5, 6, 7, 8, 9, 0,	
			1, 2, 3, 4, 5, 6, 7, 8, 9, 0,	
			1, 2, 3, 4, 5, 6, 7, 8, 9, 0,	
	};
	
	String[] itemImageSample = {
			"1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", 
			"11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg", "17.jpg", "18.jpg", "19.jpg", "20.jpg", 
			"21.jpg", "22.jpg", "23.jpg", "24.jpg", "25.jpg", "26.jpg", "27.jpg", "28.jpg", "29.jpg", "30.jpg", 	
	};
	
	String[] itemInfoSample = {
			"대파정보.", "상추정보." , "당근정보.","깻잎정보.", "애호박정보.", "버섯정보.","단호박정보.", "파프리카정보." , "아스파라거스정보.","양파정보.",
			"자반고등어정보.","연어정보.","오징어정보.","바지락정보.","새우정보.","전복정보.",
			"막창정보.","안심스테이크정보.","닭정보.","닭다리정보." , "폭립정보.", "양념갈비정보.","등갈비구이정보.","치즈돈가스정보.","닭가슴살정보.","차돌박이정보.",
			"그라인더정보.","스팀다리미정보.","헤어드라이기정보.","체중계정보."
	};
	
	int [] itemDiscountSample = {
			10, 20, 30, 0, 0, 0, 0, 0, 0, 0,	
			10, 20, 30, 0, 0, 0, 0, 0, 0, 0,	
			10, 20, 30, 0, 0, 0, 0, 0, 0, 0,	
	};
	
	int [] itemSoldSample = {
			1, 2, 3, 4, 5, 6, 7, 8, 9, 0,	
			1, 2, 3, 4, 5, 6, 7, 8, 9, 0,	
			1, 2, 3, 4, 5, 6, 7, 8, 9, 0,	
	};
	
	// 시작 아이템 저장개수
	int itemSize = 30;
	int[] 		itemNumberList 		= new int[1000];
	String[] 	itemCategoryList 	= new String[1000];
	String[] 	itemNameList 		= new String[1000];
	int[] 		itemPriceList 		= new int[1000];
	int[] 		itemStockList 		= new int[1000];
	String[] 	itemImageList 		= new String[1000];
	String[] 	itemInfoList 		= new String[1000];
	int[] 		itemDiscountList 	= new int[1000];
	int[] 		itemSoldList 		= new int[1000];
	
	// 시작아이템 등록 
	// 아이템번호 (1~30)
	System.out.println();
	System.out.println("[번호] [카테고리] [아이템이름] [가격] [재고] [이미지이름] [아이템정보] [할인률] [팔린개수]");
	for(int i=0; i<itemSize; i++){
		itemNumberList[i] = i + 1;
		itemCategoryList[i] = itemCategorySample[i];
		itemNameList[i] = itemNameSample[i];
		itemPriceList[i] = itemPriceSample[i];
		itemStockList[i] = itemStockSample[i];
		itemImageList[i] = itemImageSample[i];
		itemInfoList[i] = itemInfoSample[i];
		itemDiscountList[i] = itemDiscountSample[i];
		itemSoldList[i] = itemSoldSample[i];
		
		System.out.printf("[%3d] ", itemNumberList[i]);
		System.out.printf("[%5s] ", itemCategoryList[i]);
		System.out.printf("[%10s] ", itemNameList[i]);
		System.out.printf("[%5d] ", itemPriceList[i] );
		System.out.printf("[%2d] ", itemStockList[i] );
		System.out.printf("[%6s] ", itemImageList[i] );
		System.out.printf("[%10s] ", itemInfoList[i] );
		System.out.printf("[%2d] ", itemDiscountList[i] );
		System.out.printf("[%2d]" , itemSoldList[i] );
		System.out.println();
	}	
	
	session.setAttribute("itemNumberList", itemNumberList);
	session.setAttribute("itemCategoryList", itemCategoryList);
	session.setAttribute("itemNameList", itemNameList);
	session.setAttribute("itemPriceList", itemPriceList);
	session.setAttribute("itemStockList", itemStockList);
	session.setAttribute("itemImageList", itemImageList);
	session.setAttribute("itemInfoList", itemInfoList);
	session.setAttribute("itemDiscountList", itemDiscountList);
	session.setAttribute("itemSoldList", itemSoldList);
	session.setAttribute("itemSize", itemSize);
	
	//-------------------------------------------------------------------------------------
	
	
	//카트 배열
	int[] cartNumberList = new int[1000];
	String[] cartBuyerList = new String[1000];
	String[] cartItemNameList = new String[1000];
	int[] cartBuyCountList = new int[1000];
	String[] cartItemImageList = new String[1000];
	int[] cartBuyPriceList = new int[1000];
	int cartSize = 0;
	
	int cartLastNumber = cartSize;
	
	session.setAttribute("cartSize", cartSize);	
	session.setAttribute("cartLastNumber", cartLastNumber);	
	session.setAttribute("cartNumberList", cartNumberList);
	session.setAttribute("cartBuyerList", cartBuyerList);
	session.setAttribute("cartItemNameList", cartItemNameList);
	session.setAttribute("cartBuyCountList", cartBuyCountList);
	session.setAttribute("cartBuyPriceList", cartBuyPriceList);
	session.setAttribute("cartItemImageList", cartItemImageList);
	
	session.setAttribute("log", null);
	
	response.sendRedirect("02_01_mainPage.jsp");
%>    
