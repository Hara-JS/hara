<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<h2>학번, 이름, 학년, 선택과목을 입력하는 폼</h2>

		<form action="_07_muliplexPro.jsp">
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="num"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>학년</td>
					<td>
						<input type="radio" name="grade" value="1">1학년 &nbsp;
						<input type="radio" name="grade" value="2">2학년 &nbsp;
						<input type="radio" name="grade" value="3">3학년 &nbsp;
						<input type="radio" name="grade" value="4" checked>4학년 &nbsp;
					</td>
				</tr>
				<tr>
					<td>선택과목</td>
					<td>
						<select name="subject">
							<option value="JAVA">JAVA</option>
							<option value="JSP">JSP</option>
							<option value="SPRING">SPRING</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
						<input type="checkbox" name="habbies" value="운동">운동
						<input type="checkbox" name="habbies" value="노래">노래
						<input type="checkbox" name="hobbies" value="살인">살인
						<input type="checkbox" name="hobbies" value="추리">추리
					</td>
				</tr>
				<tr>
					<td>메모</td>
					<td><textarea rows="10" cols="50" name="memo"></textarea></td>				
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="작성끝">
					</td>				
				</tr>
			</table>
		</form>
	</div>

</body>
</html>