<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	


</head>
<body>
	<%
		String log = (String)session.getAttribute("log");
		
		String filePath = request.getContextPath() + "/bookshop/uploadFile/";
		
		int cartSize = (int)session.getAttribute("cartSize");
		int cartLastNumber = (int)session.getAttribute("cartLastNumber");
		int[] cartNumberList = (int[])session.getAttribute("cartNumberList");
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
		
		String titleAll = "";
		
		int total = 0;
		int count = 0;
		for(int i=0; i<cartSize; i++) {
			if(cartBuyerList[i].equals(log)) {
				
				myCartBuyCountList[count] = cartBuyCountList[i];
				
				for(int j=0; j<bookSize; j++) {
					if(cartBookNumberList[i] == bookNumberList[j]) {
						
						titleAll += bookNameList[j] + ",";
						
						myCartBookNameList[count] = bookNameList[j];
						myCartBuyPriceList[count] = bookPriceList[j] - bookPriceList[j]*bookDiscountList[j]/100;
						myCartBookImageList[count] = bookImageList[j];
						
						total += myCartBuyPriceList[count] * myCartBuyCountList[count];
						count += 1;
					}
				}
			}
		}
%>
  <jsp:include page="../layout/header.jsp"></jsp:include>	

	<div align="center">
		
		<h1>도서 결제하기</h1>
		
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
					<td colspan="4" align="right"><%= total %></td>
				</tr>
				<tr>
					<td>배송비</td>
					<td colspan="4" align="right">
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
					<td>주문자명</td>
					<td colspan="4" align="right"><input type="text" id="buyer"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td colspan="4" align="right"><input type="text" id="tel"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="4" align="right"><input type="text" id="addr"></td>
				</tr>
				<tr>
					<td>총 결제금액</td>
					<td colspan="4" align="right"><%= total + deliveryPrice %>원</td>
				</tr>
				<tr>
					<td colspan="5" align="right">
						<button id="btn-requestPay">결제하기</button>
					</td>
				</tr>
			</table>
	</div>

	 <jsp:include page="../layout/footer.jsp"></jsp:include>

	<script>
	
		let requestPay = (event) => {
			
			let IMP = window.IMP; 
	        IMP.init("imp03800374"); 
	      
	        let today = new Date();   
	        let hours = today.getHours(); // 시
	        let minutes = today.getMinutes();  // 분
	        let seconds = today.getSeconds();  // 초
	        let milliseconds = today.getMilliseconds();
	        let makeMerchantUid = hours +  minutes + seconds + milliseconds;
	        
	        IMP.request_pay({
                pg : 'html5_inicis',
                pay_method : 'card',
                merchant_uid: "IMP"+makeMerchantUid, 
                name : 'ITBOOK',
                amount : 10,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '아임포트 기술지원팀',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                    console.log(rsp);
                    
                    let log = "<%= (String)session.getAttribute("log") %>";
                    
                    $.ajax({
    					type: "post",
    					url: "addOrderPro.jsp",
    					data: {
    						log: log,
    						buyer: $buyer.value,
    						tel: $tel.value,
    						addr: $addr.value
    					},
    					success: function(data) {
    						alert("결제가 완료되었습니다.");
    						location.href="orderList.jsp";
    					},
    					error: function() {
    						alert("addOrderForm error");
    					}
                    });
                    
                } else {
                    console.log(rsp);
                }
            });			
	        
	        
		}
	
		let $requestPay = document.querySelector("#btn-requestPay");
		$requestPay.addEventListener("click", requestPay);
		
		let $buyer = document.querySelector("#buyer");
		let $tel = document.querySelector("#tel");
		let $addr = document.querySelector("#addr");
		
	</script>

</body>
</html>













