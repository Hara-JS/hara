<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Object obj = session.getAttribute("log");
	String log = (String)obj;
	System.out.println("log = " + log);
	
	int cartSize = (int)session.getAttribute("cartSize");
	int cartLastNumber = (int)session.getAttribute("cartLastNumber");
	int[] cartNumberList = (int[])session.getAttribute("cartNumberList");
	String[] cartBuyerList = (String[])session.getAttribute("cartBuyerList");
	String[] cartItemNameList = (String[])session.getAttribute("cartItemNameList");
	int[] cartBuyPriceList = (int[])session.getAttribute("cartBuyPriceList");
	int[] cartBuyCountList = (int[])session.getAttribute("cartBuyCountList");
	String[] cartItemImageList = (String[])session.getAttribute("cartItemImageList");
	
	String[] myCartItemNameList = new String[1000];
	int[] myCartBuyPriceList = new int[1000];
	int[] myCartBuyCountList = new int[1000];
	String[] myCartItemImageList = new String[1000];
	
	int count = 0;
	for(int i=0; i<cartSize; i++) {
		if(cartBuyerList[i].equals(log)) {
			
			// 동일 상품을 여러번 선택해서 장바구니에 담은 경우,
			int check = -1;
			for(int j=0; j<count; j++){
				if(cartItemNameList[i].equals(myCartItemNameList[j])) {
					check = j;
					break;
				} 
			}
			
			if(check >= 0){
				myCartBuyCountList[check] += cartBuyCountList[i];
			} else {
				myCartItemNameList[count] = cartItemNameList[i];
				myCartBuyPriceList[count] = cartBuyPriceList[i];
				myCartBuyCountList[count] = cartBuyCountList[i];
				myCartItemImageList[count] = cartItemImageList[i];
				count += 1;
			}
		}
	}
	int myCartsize = count;

	int total = 0;
	for(int i=0; i<myCartsize; i++) {
		total += myCartBuyPriceList[i] * myCartBuyCountList[i];
	}
	
	int deliveryPrice = 3000;
%>
<h2>장바구니</h2>
	<hr width="300px" color="purple">
	<br>
<%
	if(log != null) {
	
	for(int i=0; i<myCartsize; i++) {
%>
	<table>
		<tr height="40px">
			<td width="50px" align="center">
				<%= i + 1 %>
			</td>
			<td width="100px" align="center">
				<img alt="상품" src="img/<%= myCartItemImageList[i] %>" height="40px">
			</td>
			<td width="300px">
				<font size="3"><b><%= myCartItemNameList[i] %></b></font>
			</td>
			<td width="100px" align="center">
				<font size="3"><b><%= myCartBuyCountList[i] %></b></font>
			</td>
			<td width="100px">
				<font size="3"><b><%= myCartBuyPriceList[i] * myCartBuyCountList[i] %>원</b></font>
			</td>
			<td width="40px" align="center">
				<a href="07_03_deleteCartPro.jsp?itemName=<%= myCartItemNameList[i] %>">
					<img alt="삭제" src="img/09_delete.png">
				</a>
			</td>
		</tr>
	</table>
	
	<hr size="1" width="680px" color="gray">

<%	} %>
	
	<form method="post" action="#">
		<table>
			<tr height="70px">
				<td width="480px" align="right">
					<font size="3"><b>총 상품금액</b></font>
				</td>
				<td width="200px" align="right">
					<font size="3"><b><%= total %>원</b></font>
				</td>
			</tr>
			<tr height="70px">
				<td width="480px" align="right">
					<font size="3"><b>배송비</b></font>
				</td>
				<td width="200px" align="right">
				<%
					if(total >= 40000 || total <= 0) {
						deliveryPrice = 0;
				%>
					<font size="3"><b>0원</b></font> <br>
				<%	} else { %>
					<font size="3"><b><%= deliveryPrice %>원</b></font> <br>
					<font size="2" color="purple"><%= 40000 - total %>원 추가주문 시, 무료배송</font>
				<%	} %>
				</td>
			</tr>
			<tr height="70px">
				<td width="480px" align="right">
					<font size="4"><b>총 결제금액</b></font>
				</td>
				<td width="200px" align="right">
					<font size="4"><b><%= total + deliveryPrice %>원</b></font>
				</td>
			</tr>
			<tr height="70px">
				<td colspan="2" align="right">
					<input type="image" src="img/08_order.PNG" height="50px">
				</td>
			</tr>
		</table>
	</form>
<%
	} else {
%>	
		<h3>로그인 후 이용할 수 있습니다.</h3>

<%	} %>
















