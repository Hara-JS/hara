<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int itemSize = (int)(session.getAttribute("itemSize"));
	
	int[] itemNumberList = (int[])(session.getAttribute("itemNumberList"));
	String[] itemCategoryList = (String[] )(session.getAttribute("itemCategoryList"));
	String[] itemNameList = (String[])(session.getAttribute("itemNameList"));
	int[] itemPriceList = (int[])(session.getAttribute("itemPriceList"));
	int[] itemStockList = (int[])(session.getAttribute("itemStockList"));
	String[] itemImageList = (String[])(session.getAttribute("itemImageList"));
	String[] itemInfoList =(String[])(session.getAttribute("itemInfoList"));
	int[] itemDiscountList =(int[])(session.getAttribute("itemDiscountList"));
	int[] itemSoldList =(int[])(session.getAttribute("itemSoldList"));
%>

<h2>전체 상품</h2>
<hr width="300px" color="purple">
<br>

<table>
<%
for(int i=0; i<itemSize; i++) {
	
	// 할인된 가격
	int discountPrice = itemPriceList[i] - itemPriceList[i] * itemDiscountList[i] / 100;
	
	if(i % 3 == 0) {
%>	
	<tr height="250px">
<%		} %>
	<td width="400px" align="center">
		<a href="05_01_itemPage.jsp?itemNumber=<%= itemNumberList[i] %>">
		<%	if(itemStockList[i] > 0) { %>
			<img alt="상품" src="img/<%= itemImageList[i] %>" width="250px">
		<%	} else { %>
			<img alt="상품" src="img/<%= itemImageList[i] %>" width="250px" style="opacity: 20%">
		<%	} %>
		</a> <br>
		<p><font size="5"><b><%= itemNameList[i] %></b></font></p>
		<%	if(itemStockList[i] > 0) { %>
			<%	if(itemDiscountList[i] > 0) { %>
				<p>
					<font size="4" style="text-decoration: line-through;"><%= itemPriceList[i] %>원</font>
					→
					<font size="4" color="purple"><b><%= discountPrice %>원</b></font>
				</p>
			<%	} else { %>
					<font size="4"><%= itemPriceList[i] %>원</font>
			<%	} %>
		<%	} else { %>
				<font size="4" color="red"><b>품절</b></font>
		<%	} %>
		<p>
			<font size="2"><%= itemInfoList[i] %></font>
		</p>
	</td>

<%		if(i % 3 == 2) { %>
	</tr>
<%	
	}
}
%>
</table>






