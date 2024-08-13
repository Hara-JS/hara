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
 	 	String[] bookNameSample = {
 	        "혼자 공부하는 머신러닝+딥러닝","Must Have 머신러닝·딥러닝 문제해결 전략","파이썬 머신러닝 완벽 가이드","파이썬 머신러닝 판다스 데이터 분석","Do it! 첫 인공지능","비전공자를 위한 이해할 수 있는 IT 지식","비전공자도 이해할 수 있는 AI 지식","Do it! HTML+CSS+자바스크립트 웹 표준의 정석","혼자 공부하는 파이썬","코딩만 따라 해도 웹페이지가 만들어지는 HTML+CSS+자바스크립트",
 	        "자바스크립트 완벽 가이드","리눅스 C프로그래밍 스킬북","모두의 데이터 분석 with 파이썬","놀랄 만큼 재미있는 C언어 기초 WONDER C","266가지 문제로 정복하는 코딩 인터뷰 in C++","코딩 테스트를 위한 자료 구조와 알고리즘 with C++","C#을 다루는 기술","C# 프로그래밍(2판)","아키텍처를 알아야 앱 개발이 보인다","초보자를 위한 JavaScript 200제",   
 	        "데이터 과학을 위한 기초수학 with 파이썬","컴퓨팅 사고와 소프트웨어 with 파이썬","파이썬 클린 코드","자바스크립트 프로그래밍 입문","쉽게 배우는 AWS AI 서비스","이것이 우분투 리눅스다(개정판)","Do it! 점프 투 파이썬","모두의 딥러닝","자바 웹을 다루는 기술","Java의 정석",   
 	        "선형대수와 통계학으로 배우는 머신러닝 with 파이썬","코틀린을 이용한 안드로이드 개발","깡쌤의 안드로이드 프로그래밍 with 자바","코딩은 처음이라 with 딥러닝","생활코딩! 자바 프로그래밍 입문","1일 1로그 100일 완성 IT 지식","IT 지식으로 미래를 읽는다면","디지털 시대에 살아남는 IT 지식","만들면서 배우는 파이썬과 40개의 작품들","웹 표준을 이용한 iOS 앱 개발 트레이닝",   
 	        "Do it! 스위프트로 아이폰 앱 만들기 입문","모두의 리눅스","모두의 딥러닝","모바일 웹 서비스 구현을 위한 JSP 웹 프로그래밍","명품 JAVA Programming","개념있는 JAVA","이보다 더 쉬울 수 없는 자바 머신러닝 with Weka","이것이 취업을 위한 코딩 테스트다 with 파이썬","자신감 뿜뿜! JSP 웹 프로그래밍 Hard Carry","리눅스 입문자를 위한 명령어 사전"   
 	   	 }; 
	
		int[] bookStockSample = {
			10, 9, 3, 2, 1, 0, 7, 6, 1, 3,   
			4, 2, 5, 8, 0, 7, 1, 0, 4, 3,   
			6, 1, 3, 9, 2, 9, 10, 8, 5, 3,
			10, 5, 10, 6, 7, 8, 7, 5, 6, 0,   
			6, 7, 8, 5, 8, 2, 0, 0, 0, 1
		};
	
		
		int bookSize = bookNameSample.length;
	%>
	
	<div align="center">
	<canvas id="myChart" width="1200" height="500"></canvas>
	
	<% for(int i=0; i<bookSize; i++) { %>
		<input type="hidden" class="bookSales" name="<%= bookNameSample[i] %>" value="<%= bookStockSample[i] %>">
	<% } %>
	
	<script>
	function test(countList, nameList) {
		let myChart = document.getElementById('myChart');
		let ctx = myChart.getContext('2d');
		
		let datasetsValue = [{
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
		let list = document.querySelectorAll(".bookSales");
		
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

















