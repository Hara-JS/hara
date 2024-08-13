<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>

</head>
<body>
	<%
		String[] bookCategorySample = {
	      "컴퓨터공학","컴퓨터공학","컴퓨터공학","컴퓨터공학","컴퓨터공학","컴퓨터공학","컴퓨터공학","프로그래밍","프로그래밍","프로그래밍",
	      "프로그래밍","프로그래밍","프로그래밍","프로그래밍","프로그래밍","프로그래밍","프로그래밍","프로그래밍","DB/OS","프로그래밍",   
	      "프로그래밍","프로그래밍","프로그래밍","프로그래밍","컴퓨터공학","DB/OS","프로그래밍","컴퓨터공학","프로그래밍","프로그래밍",   
	      "컴퓨터공학","DB/OS","DB/OS","컴퓨터공학","프로그래밍","컴퓨터공학","컴퓨터공학","컴퓨터공학","프로그래밍","DB/OS",   
	      "DB/OS","DB/OS","컴퓨터공학","프로그래밍","프로그래밍","프로그래밍","컴퓨터공학","프로그래밍","프로그래밍","DB/OS"   
		};
	
		
		int bookSize = bookCategorySample.length;
	
		int[] counts = new int[100];
		String[] bookCategory = new String[100];
		
		int index = 0;
		for(int i=0; i<bookSize; i++) {
			
			boolean check = false;
			for(int j=0; j<index; j++) {
				if(bookCategorySample[i].equals(bookCategory[j])) {
					counts[j] += 1;
					check = true;
					break;
				}
			}
			
			if(check == false) {
				bookCategory[index] = bookCategorySample[i];
				counts[index] = 1;
				index += 1;
			}
		}
	%>
	
	<div align="center">
	<canvas id="myChart" width="400" height="400"></canvas>
	
	<% for(int i=0; i<index; i++) { %>
		<input type="hidden" class="bookCategory" name="<%= bookCategory[i] %>" value="<%= counts[i] %>">
	<% } %>
	
	<script>
	function test(countList, nameList) {
		let myChart = document.getElementById('myChart');
		let ctx = myChart.getContext('2d');
		
		let datasetsValue = [{
            label: '도서 카테고리별 수량',
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
        }];	
		
		let dataValue =  {
	        labels: nameList,
	        datasets: datasetsValue
	    };
		
		let chart = new Chart(ctx, {
		    type: 'bar',
		    data: dataValue,
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
		let list = document.querySelectorAll(".bookCategory");
		
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

</div>
</body>
</html>

















