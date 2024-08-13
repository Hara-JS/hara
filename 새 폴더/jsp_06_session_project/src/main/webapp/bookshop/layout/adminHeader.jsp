<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>

	<%
		String log = (String)session.getAttribute("log");	
		System.out.println("header.jsp:"+log);
	%>
	
    <div id=header>
		<div class="topmenu" align="center">	
			<%if(log == null){ %>	
				<%
					response.sendRedirect("../page/adminMainPage.jsp");
				%>
			<%}else{ %>
				<table border="1">
					<tr>
						<td><a href="adminMain.jsp">&nbsp;메인으로&nbsp;</a></td>
						<td><a href="adminLogout.jsp">&nbsp;로그아웃&nbsp;</a></td>
					</tr>
				</table>
				<hr />
	        </div>
			<%} %>
		</div>

			
	</div>
	
	