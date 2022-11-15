<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>K-Health</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="container px-5 py-5">
		<form action="/product.admin" method="post"
			enctype="multipart/form-data">

			<div class="header"><h2>신규 판매상품 등록</h2></div>
			
			<div class="py-2">
				<input type="text" placeholder="제품 이름 입력" name="product_name">
			</div>

			<div class="py-2">
				<input type="text" placeholder="제품 가격 입력" name="product_price">
			</div>

			<div class="py-2">
				<input type="text" placeholder="제품 최초 재고 수 입력" name="product_count">
			</div>
<div class="py-2">
			<textarea name="product_explain" placeholder="제품 설명 입력"
				style="min-width: 500px; min-height: 100px"></textarea>
				</div>
			
				<h2>제품 이미지 파일 등록</h2>
				<button id="fileAdd" type="button">+</button>
				

			

			<button>제출</button>


			<script>
				let count = 0;
				$("#fileAdd").on("click", function() {

					if ($("input[type=file]").length > 4) {
						alert("파일은 최대 5개까지만 업로드 가능합니다.");
						return;

					}

					let fileDiv = $("<div>");

					let inputFile = $("<input>");
					inputFile.attr("type", "file");
					inputFile.attr("name", "file" + count++);

					let delBtn = $("<a>");
					delBtn.html("x");
					delBtn.addClass("line-del");
					delBtn.on("click", function() {
						$(this).parent().remove();
					})

					fileDiv.append(inputFile);
					fileDiv.append(delBtn);

					$("#fileAdd").parent().append(fileDiv);
				})
			</script>
		</form>
	</div>
</body>
</html>