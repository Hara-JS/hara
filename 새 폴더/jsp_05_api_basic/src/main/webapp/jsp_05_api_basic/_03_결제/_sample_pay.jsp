<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<%-- 
		 결제창 연동을 진행할 주문 페이지에 아래 JS 라이브러리를 추가한다.
	--%>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

</head>
<body>
	<div align="center">
		<h1>결제하기</h1>
		<p>주문자명 : <input type="text" id="buyer"></p>
		<p>
			<button id="btn-requestPay">결제하기</button>
		</p>
	</div>
	
	<script>
		let requestPay = (event) => {
			let IMP = window.IMP; 
			
			// 고객자 식별코드
	        IMP.init("imp81883657");
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
	            name : '상품명',
	            amount : 10,
	            buyer_email : 'Iamport@chai.finance',
	            buyer_name : '아임포트 기술지원팀',
	            buyer_tel : '010-1234-5678',
	            buyer_addr : '서울특별시 강남구 삼성동',
	            buyer_postcode : '123-456'
	        }, function (rsp) { 
	            if (rsp.success) {
	                console.log("결제 성공=", rsp);
	            } else {
	                console.log("결제 실패=", rsp);
	            }
	        });			
		}	
		
	
		let $buyer = document.querySelector("#buyer");
		
		let $requestPay = document.querySelector("#btn-requestPay");
		$requestPay.addEventListener("click", requestPay);
		

	</script>
</body>
</html>














