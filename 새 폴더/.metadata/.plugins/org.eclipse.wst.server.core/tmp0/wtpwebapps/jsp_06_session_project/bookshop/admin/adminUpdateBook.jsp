<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int bookNumber = Integer.parseInt(request.getParameter("bookNumber"));

	int bookSize = (int)(session.getAttribute("bookSize"));
	
	int[] bookNumberList = (int[])(session.getAttribute("bookNumberList"));
	String[] bookCategoryList = (String[] )(session.getAttribute("bookCategoryList"));
	String[] bookSubCategoryList = (String[] )(session.getAttribute("bookSubCategoryList"));
	String[] bookNameList = (String[])(session.getAttribute("bookNameList"));
	int[] bookPriceList = (int[])(session.getAttribute("bookPriceList"));
	int[] bookStockList = (int[])(session.getAttribute("bookStockList"));
	String[] bookImageList = (String[])(session.getAttribute("bookImageList"));
	String[] bookContentImageList = (String[])(session.getAttribute("bookContentImageList"));
	String[] bookInfoList =(String[])(session.getAttribute("bookInfoList"));
	int[] bookDiscountList =(int[])(session.getAttribute("bookDiscountList"));
	int[] bookSoldList =(int[])(session.getAttribute("bookSoldList"));	
	
	
	int index = 0;
	for(int i=0; i<bookSize; i++) {
		if(bookNumberList[i] == bookNumber) {
			index = i;
			break;
		}
	}
	
	String imagePath =  request.getContextPath();
	imagePath += "/bookshop/uploadFile/";
	System.out.println(imagePath);
%>

<jsp:include page="../layout/adminHeader.jsp"></jsp:include>	

<div align="center">
	<h3>책 수정하기</h3>
	
	<form id="FILE_FORM" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>대 카테고리</td>
				<td><input type="text" id="bookCategory" name="bookCategory" value="<%= bookCategoryList[index] %>"></td>
			</tr>
			<tr>
				<td>소 카테고리</td>
				<td><input type="text" id="bookSubCategory" name="bookSubCategory" value="<%= bookSubCategoryList[index] %>"></td>
			</tr>
			<tr>
				<td>책 제목</td>
				<td><input type="text" id="bookName" name="bookName" value="<%= bookNameList[index] %>"></td>
			</tr>
			<tr>
				<td>책 가격</td>
				<td><input type="text" id="bookPrice" name="bookPrice" value="<%= bookPriceList[index] %>"></td>
			</tr>
			<tr>
				<td>책 할인률</td>
				<td><input type="text" id="bookDiscount" name="bookDiscount" value="<%= bookDiscountList[index] %>"></td>
			</tr>
			<tr>
				<td>책 상세 정보</td>
				<td><textarea rows="5" cols="20" id="bookInfo" name="bookInfo"><%= bookInfoList[index] %></textarea></td>
			</tr>
			<tr>
				<td>책 재고 수량</td>
				<td><input type="text" id="bookStock" name="bookStock" value="<%= bookStockList[index] %>"></td>
			</tr>
			<tr>
				<td>책 이미지</td>
				<td>
					<img id="mainPreview" src="<%= imagePath + bookImageList[index] %>" width="100px"> <br />
					<input type="file" id="bookImage" name="bookImage" onchange="mainImageChange(this)">
				</td>
			</tr>
			<tr>
				<td>책 상세 이미지</td>
				<td>
					<img id="subPreview" src="<%= imagePath + bookContentImageList[index] %>" width="100px"> <br />
					<input type="file" id="bookContentImage" name="bookContentImage" onchange="subImageChange(this)">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button id="button-adminBookUpdatePro">수정하기</button>
					
					<input type="hidden" id="index" name="index" value="<%= index %>">
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


	let modifyBook = (event) => {
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
			url: 'adminUpdateBookPro.jsp',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			success: function(result){
				alert("책 정보를 수정하였습니다.");
				location.href="adminItemList.jsp";
			},
		}); 
		return true;
		
	}
	
	let $adminBookUpdatePro = document.querySelector("#button-adminBookUpdatePro");
	$adminBookUpdatePro.addEventListener("click", modifyBook);
	
</script>











  