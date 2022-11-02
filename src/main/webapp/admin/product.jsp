<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
<form action="/product.admin" method="post" enctype="multipart/form-data">

			<fieldset>
				<legend>Attachments</legend>
				<button id="fileAdd" type="button">+</button>

			</fieldset>
			
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
</body>
</html>