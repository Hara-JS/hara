<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		int bookNumber = Integer.parseInt(request.getParameter("bookNumber"));
	%>
	
	<%
		int bookSize = (int)(session.getAttribute("bookSize"));
		int bookLastNumber = (int)(session.getAttribute("bookLastNumber"));
		
		int[] bookNumberList = (int[])(session.getAttribute("bookNumberList"));
		String[] bookCategoryList = (String[] )(session.getAttribute("bookCategoryList"));
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
		
		String filePath = request.getContextPath() + "/bookshop/uploadFile/";
	
	%>	
    <jsp:include page="../layout/header.jsp"></jsp:include>		
	<div align="center">
		<h1>도서 상세 페이지</h1>
		
		<table border="1">
			<tr>
				<td colspan="3" align="center">
					<h2><%= bookNameList[index] %></h2>
					<%-- addCartPro.jsp 페이지로 넘길 데이터 저장 --%>
					<input type="hidden" id="index" value="<%= index %>">
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center"><h3><%= bookInfoList[index] %></h3></td>
			</tr>
			<tr>
				<td rowspan="7"><img src="<%= filePath + bookImageList[index] %>" width="300px"></td>
				<td  colspan="2" align="right">정가 <%= bookPriceList[index] %></td>
			</tr>
			<tr>
				<td colspan="2" align="right">판매가 <%= bookPriceList[index] - bookPriceList[index] * bookDiscountList[index] / 100 %></td>
			</tr>
			<tr>
				<td>판매단위</td>
				<td align="right">1개</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td align="right">무료배송</td>
			</tr>
			<tr>
				<td>배송일정</td>
				<td align="right">
				<% if(bookStockList[index] > 0) { %>
					지금 주문하면 다음날 오후 도착 예정
				<% } else { %>
					재입고 이후 순차 배송예정								
				<% } %>
					<br />
					[바로드림] 인터넷으로 주문하고 매장에서 직접 수령 가능
				</td>
			</tr>
			<tr>
				<td>구매수량</td>
				<td align="right">
				<% if(bookStockList[index] > 0) { %>
					<input type="number" id="buyCount" min="1" max="100" value="1">
				<% } else { %>
					품절
				<% } %>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<% if(bookStockList[index] > 0) { %>
					<button id="btn-addCart">장바구니 담기</button>
				<% } else { %>
					재입고 예정
				<% } %>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center"><h2>상품정보</h2></td>
			</tr>
			<tr>
				<td align="center" colspan="3">
					<img src="<%= filePath + bookContentImageList[index] %>" width="400px">
				</td>
			</tr>
		</table>
		
	</div>
	
	
	
    <jsp:include page="../layout/footer.jsp"></jsp:include>
	
	
	
	
	<script>
		let addCart = (event) => {
			let log = "<%= (String)session.getAttribute("log") %>";
			
			if(log === "null") {
				alert("로그인 후 이용가능합니다.");
				location.href="../member/loginForm.jsp";
				return false;
			}
			
			$.ajax({
				type: "post",
				url: "addCartPro.jsp",
				data: {
					index: $index.value,
					buyCount: $buyCount.value,
					log: log
				},
				success: function(data) {
					
					let str = '<p id="check">';
					let length = str.length;
					let startIndex = data.indexOf(str);
					
					let checkValue = data.substr(startIndex + length);
					
					console.log("data = " + data);
					console.log("length = " + length);
					console.log("startIndex = " + startIndex);
					console.log("[checkValue = " + checkValue + "]");
					
					if(checkValue.trim() == "-1") {
						alert("장바구니에 담겼습니다.");
						location.href="cartList.jsp";
					} else {
						alert("상품 재고수량이 " + checkValue.trim() + "개 남았습니다. 관리자에게 문의해주세요.");
					}
				},
				error: function() {
					alert("bookInfo error");
				}
			});
			
		}
		
		let $addCart = document.querySelector("#btn-addCart");
		$addCart.addEventListener("click", addCart);
		
		
		let $index = document.querySelector("#index");
		let $buyCount = document.querySelector("#buyCount");
		
	</script>
	
	
	
	
	
	
	
	
	
	
	    