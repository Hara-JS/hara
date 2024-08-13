<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/adminHeader.jsp"></jsp:include>	

<div align="center">
	<h3>새 책 등록</h3>
	
	<form id="FILE_FORM" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>대 카테고리</td>
				<td><input type="text" id="bookCategory" name="bookCategory" value="컴퓨터공학"></td>
			</tr>
			<tr>
				<td>소 카테고리</td>
				<td><input type="text" id="bookSubCategory" name="bookSubCategory" value="JAVA"></td>
			</tr>
			<tr>
				<td>책 제목</td>
				<td><input type="text" id="bookName" name="bookName" value="자바의 정석"></td>
			</tr>
			<tr>
				<td>책 가격</td>
				<td><input type="text" id="bookPrice" name="bookPrice" value="25000"></td>
			</tr>
			<tr>
				<td>책 할인률</td>
				<td><input type="text" id="bookDiscount" name="bookDiscount" value="10"></td>
			</tr>
			<tr>
				<td>책 상세 정보</td>
				<td><textarea rows="5" cols="20" id="bookInfo" name="bookInfo">자바의 정석 입니다.</textarea></td>
			</tr>
			<tr>
				<td>책 재고 수량</td>
				<td><input type="text" id="bookStock" name="bookStock" value="10"></td>
			</tr>
			<tr>
				<td>책 이미지</td>
				<td>
					<img id="mainPreview" src="../img/previewbook.svg" width="100px" style="border: 1px solid lightgray"> <br />
					<input type="file" id="bookImage" name="bookImage" onchange="mainImageChange(this)">
				</td>
			</tr>
			<tr>
				<td>책 상세 이미지</td>
				<td>
					<img id="subPreview" src="../img/previewbook.svg" width="100px" style="border: 1px solid lightgray"> <br />
					<input type="file" id="bookContentImage" name="bookContentImage" onchange="subImageChange(this)">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button id="button-adminAddBookPro">추가하기</button>
				</td>
			</tr>
		</table>
	</form>
</div>  



<script>

let mainImageChange = (event) => {
	console.log("file1 = ", event.files);
	console.log("file2 = ", event.files[0]);
	
	
	if (event.files && event.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
        	
        	let $img = document.querySelector("#mainPreview");
        	$img.src = e.target.result;
        	
        }
        reader.readAsDataURL(event.files[0]);
    }
	
}

let subImageChange = (event) => {
	console.log("file1 = ", event.files);
	console.log("file2 = ", event.files[0]);
	
	
	if (event.files && event.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
        	
        	let $img = document.querySelector("#subPreview");
        	$img.src = e.target.result;
        	
        }
        reader.readAsDataURL(event.files[0]);
    }
	
}

let addBook = (event) => {
	event.preventDefault();	
	
	let $bookCategory = document.querySelector("#bookCategory");
	let $bookSubCategory = document.querySelector("#bookSubCategory");
	let $bookName = document.querySelector("#bookName");
	let $bookPrice = document.querySelector("#bookPrice");
	let $bookDiscount = document.querySelector("#bookDiscount");
	let $bookInfo = document.querySelector("#bookInfo");
	let $bookStock = document.querySelector("#bookStock");
	
	if($bookCategory.value == "") {
		$bookCategory.focus();
		alert("대 카테고리를 작성해주세요.");
		return false;
	}
	
	if($bookSubCategory.value == "") {
		$bookSubCategory.focus();
		alert("소 카테고리를 작성해주세요.");
		return false;
	}
	
	if($bookName.value == "") {
		$bookName.focus();
		alert("책 제목을 작성해주세요.");
		return false;
	}
	
	if($bookPrice.value == "") {
		$bookPrice.focus();
		alert("책 가격을 작성해주세요.");
		return false;
	}
	
	if($bookDiscount.value == "") {
		$bookDiscount.focus();
		alert("책 할인률을 작성해주세요.");
		return false;
	}
	
	if($bookInfo.value == "") {
		$bookInfo.focus();
		alert("책 상세 정보를 작성해주세요.");
		return false;
	}
	
	if($bookStock.value == "") {
		$bookStock.focus();
		alert("책 재고 수량을 작성해주세요.");
		return false;
	}
	
       
    let form = $('#FILE_FORM')[0];
	let formData = new FormData(form);
     		      
	$.ajax({
		url: 'adminAddBookPro.jsp',
		processData: false,
		contentType: false,
		data: formData,
		type: 'POST',
		success: function(result){
			alert("책 정보를 추가하였습니다.");
			location.href="adminItemList.jsp";
		},
	}); 
	return true;
	
}

let $adminAddBookPro = document.querySelector("#button-adminAddBookPro");
$adminAddBookPro.addEventListener("click", addBook);


</script>


































  