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
	<%--
		https://www.chartjs.org/
	 --%>
	 
	 
	<div align="center">
		<canvas id="myChart" width="400" height="400"></canvas>
	</div>
	
	<script>
	function test() {
		
		/*
			1. 캔버스를 찾는다.
			2. 캔버스에서 그림을 그리는 도구인 ctx를 생성한다.
			3. chart의 옵션을 작성한다.
				1) type : 'bar' 고정된다.
				2) data : {} 별도의 변수를 생성해 전달한다.
				3) options : {} 고정된다.
			4. dataValue
				1) labels : 막대그래프 하단에 표기할 이름 배열을 지정한다.
				2) datasets: [{}] : 별도의 변수를 생성해 전달한다.
			5. datasetsValue
				1) label : 그래프 상단에 주제를 지정한다.
				2) data : 그래프의 개수를 배열로 저장한다.
				3) backgroundColor : 막대그래프의 배경색을 배열 값으로 고정한다.
				4) borderColor : 막대그래프의 외관 선의 색상을 배열 값으로 고정한다.
				5) borderWidth : 막대그래의 외곽 선의 두께로 1로 고정한다.
		*/
		
		let myChart = document.getElementById('myChart');
		let ctx = myChart.getContext('2d');
		
		let datasetsValue = [{
            label: '샘플 데이터',
            data: [20, 50, 100, 80],
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
	        labels: ['사과', '배', '수박', '토마토'],
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
	
	test();
	</script>
	
</body>
</html>

















