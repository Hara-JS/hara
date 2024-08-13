<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int bookSize = (int)(session.getAttribute("bookSize"));
	String[] bookNameList = (String[])(session.getAttribute("bookNameList"));
	int[] bookStockList = (int[])(session.getAttribute("bookStockList"));

%>





<jsp:include page="../layout/adminHeader.jsp"></jsp:include>

<div align="center">
	<canvas id="myChart" width="1200" height="500"></canvas>
	
	<% for(int i=0; i<bookSize; i++) { %>
		<input type="hidden" class="book" name="<%= bookNameList[i] %>" value="<%= bookStockList[i] %>">
	<% } %>
</div>



<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script>

	
	function test(countList, nameList) {
		let myChart = document.getElementById('myChart');
		let ctx = myChart.getContext('2d');
		
		
		let chart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: nameList,
		        datasets: [{
		            label: '도서 판매 현황',
		            data: countList,
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 1
		        }]
		    },
		    options: {
		    	responsive: false,
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    } 
		});
	}
	
</script>
<script>
	let list = document.querySelectorAll(".book");
	
	let countList = [];
	let nameList = [];
	for(let i=0; i<list.length; i++) {
		countList.push(list[i].value);
		nameList.push(list[i].name);
	}
	console.log("countList = " + countList);
	console.log("nameList = " + nameList);
	
	test(countList, nameList);
</script>
















