<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		request.setCharacterEncoding("UTF-8");
		
		
		String log = request.getParameter("log");
		String buyer = request.getParameter("buyer");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
	%> 
	
	<%
		int cartSize = (int)session.getAttribute("cartSize");
		int[] cartNumberList = (int[])session.getAttribute("cartNumberList");
		String[] cartBuyerList = (String[])session.getAttribute("cartBuyerList");
		int[] cartBuyCountList = (int[])session.getAttribute("cartBuyCountList");
		int[] cartBookNumberList = (int[])session.getAttribute("cartBookNumberList");
		
		int deliverySize = (int)(session.getAttribute("deliverySize"));
		int[] deliveryNumberList = (int[])(session.getAttribute("deliveryNumberList"));
		String[] deliveryNameList = (String[])(session.getAttribute("deliveryNameList"));
		String[] deliveryAddrList = (String[])(session.getAttribute("deliveryAddrList"));
		String[] deliveryTelList = (String[])(session.getAttribute("deliveryTelList"));
		
		int orderSize = (int)(session.getAttribute("orderSize"));
		int[] orderNumberList = (int[])(session.getAttribute("orderNumberList"));
		int[] orderDeliveryNumberList = (int[])(session.getAttribute("orderDeliveryNumberList"));
		int[] orderBookNumberList = (int[])(session.getAttribute("orderBookNumberList"));
		int[] orderBuyCountList = (int[])(session.getAttribute("orderBuyCountList"));
		String[] orderBuyerList = (String[])(session.getAttribute("orderBuyerList"));
	%>   
	
	<%
		
		//배송추가
		deliveryNumberList[deliverySize] = deliverySize + 1;
		deliveryNameList[deliverySize] = buyer;
		deliveryAddrList[deliverySize] = addr;
		deliveryTelList[deliverySize] = tel;
		
		//오더추가
		for(int i=0; i<cartSize; i++) {
			if(cartBuyerList[i].equals(log)) {
				orderNumberList[orderSize] = orderSize + 1;
				orderDeliveryNumberList[orderSize] = deliveryNumberList[deliverySize];
				orderBookNumberList[orderSize] = cartBookNumberList[i];
				orderBuyCountList[orderSize] = cartBuyCountList[i];
				orderBuyerList[orderSize] = log;				
				orderSize += 1;
			}
		}
		
		
		
		// 카트삭제
		while(true) {
			int cartIndex = -1;
			for(int i=0; i<cartSize; i++) {
				if(cartBuyerList[i].equals(log)) {
					cartIndex = i;
					break;
				}
			}
			
			if(cartIndex == -1) {
				break;
			} else {
				for(int i=cartIndex; i<cartSize - 1; i++) {
					cartNumberList[i] = cartNumberList[i + 1];
					cartBuyerList[i] = cartBuyerList[i + 1];
					cartBuyCountList[i] = cartBuyCountList[i + 1];
					cartBookNumberList[i] = cartBookNumberList[i + 1];
				}
				
				cartSize -= 1;
			}
		}
		
		
		deliverySize += 1;
		
		session.setAttribute("cartNumberList", cartNumberList);
		session.setAttribute("cartBuyerList", cartBuyerList);
		session.setAttribute("cartBuyCountList", cartBuyCountList);
		session.setAttribute("cartBookNumberList", cartBookNumberList);
		session.setAttribute("cartSize", cartSize);	
	
		session.setAttribute("orderNumberList", orderNumberList);
		session.setAttribute("orderDeliveryNumberList", orderDeliveryNumberList);
		session.setAttribute("orderBookNumberList", orderBookNumberList);
		session.setAttribute("orderBuyCountList", orderBuyCountList);
		session.setAttribute("orderSize", orderSize);
		
		session.setAttribute("deliveryNumberList", deliveryNumberList);
		session.setAttribute("deliveryNameList", deliveryNameList);
		session.setAttribute("deliveryAddrList", deliveryAddrList);
		session.setAttribute("deliveryTelList", deliveryTelList);
		session.setAttribute("deliverySize", deliverySize);
	%>
	
	
	
	
	