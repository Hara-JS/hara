<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int itemNumber = Integer.parseInt(request.getParameter("itemNumber"));
	
	int itemSize = (int)(session.getAttribute("itemSize"));
	
	int[] itemNumberList = (int[])(session.getAttribute("itemNumberList"));
	int index = 0;
	for(int i=0; i<itemSize; i++) {
		if(itemNumberList[i] == itemNumber) {
			index = i;
			break;
		}
	}
	
	String[] itemCategoryList = (String[] )(session.getAttribute("itemCategoryList"));
	String[] itemNameList = (String[])(session.getAttribute("itemNameList"));
	int[] itemPriceList = (int[])(session.getAttribute("itemPriceList"));
	int[] itemStockList = (int[])(session.getAttribute("itemStockList"));
	String[] itemImageList = (String[])(session.getAttribute("itemImageList"));
	String[] itemInfoList =(String[])(session.getAttribute("itemInfoList"));
	int[] itemDiscountList =(int[])(session.getAttribute("itemDiscountList"));
	int[] itemSoldList =(int[])(session.getAttribute("itemSoldList"));
	
	int discountPrice = itemPriceList[index] - itemPriceList[index] * itemDiscountList[index] / 100;
%>


<form method="post" action="06_01_insertCartPro.jsp">
	<table>
		<tr height="80px">
			<td rowspan="6" width="350px" align="center">
				<img alt="상품" src="img/<%= itemImageList[index] %>" height="350px">
			</td>
			<td colspan="2" width="400px">
				<font size="5"><b><%= itemNameList[index] %></b></font> <br>
				<font size="2"><%= itemInfoList[index] %></font>
			</td>
		</tr>
		<tr height="80px">
			<td colspan="2" width="400px">
			<%	if(itemDiscountList[index] > 0) { %>
				<font size="3" style="text-decoration: line-through;"><b><%= itemPriceList[index] %>원</b></font>
				→
				<font size="4" color="purple"><b><%= discountPrice %>원</b></font> <br>
				<font size="2" color="purple">로그인 후 적립혜택이 적용됩니다.</font>
			<%	} else  { %>
				<font size="4"><b><%= itemPriceList[index] %>원</b></font>
			<%	} %>
			</td>
		</tr>
		<tr height="50px">
			<td width="100px">
				<font size="2"><b>판매 단위</b></font>
			</td>
			<td width="300px">
				<font size="2">1개</font>
			</td>
		</tr>
		<tr height="50px">
			<td width="100px">
				<font size="2"><b>배송 방법</b></font>
			</td>
			<td width="300px">
				<font size="2">샛별배송/택배배송</font>
			</td>
		</tr>
		<tr height="50px">
			<td width="100px">
				<font size="2"><b>포장타입</b></font>
			</td>
			<td width="300px">
				<font size="2">상온/종이포장<br></font>
				<font size="1">택배배송은 에코포장이 스티로폼으로 대체됩니다.</font>
			</td>
		</tr>
		<tr height="50px">
			<td width="100px">
				<font size="2"><b>구매수량</b></font>
			</td>
			<td width="300px">
				<input type="number" name="buyCount" min="1" max="100" value="1">
			</td>
		</tr>
		<tr height="50px">
			<td colspan="3" align="right">
				<%-- 중요!!!! --%>
				<input type="hidden" name="itemNumber" value="<%= itemNumberList[index] %>">
				
				<input type="image" src="img/07_sendcart.PNG" height="50px">
			</td>
		</tr>
	</table>
</form>
 
 
 
 
 
 