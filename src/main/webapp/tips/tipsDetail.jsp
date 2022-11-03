<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>K-Health</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.1.js">
	
</script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
	integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL"
	crossorigin="anonymous"></script>
<script>
	Kakao.init('2644b324a18137f288c55737e196f4ac'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<nav
			class="navbar navbar-expand-lg navbar-dark bg-dark position: fixed; top: 0px;">
			<div class="container px-5 " id="sticky-wrapper"
				class="sticky-wrapper">
				<a class="navbar-brand" href="/index.jsp"><img
					src="/image/khealth logo.png" height="100px"></a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="">Intro</a></li>
						<li class="nav-item"><a class="nav-link" href="">Contact</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/list.tips">Tips</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/market/MarketDummy.jsp">Market</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/qna/QnaDummy.jsp">Q&A</a></li>
						<li class="nav-item"><a class="nav-link" href="">Login</a></li>
					</ul>
				</div>
			</div>
		</nav>





		<!-- Page Content-->
		<form action="">
		<input type=hidden name="tips_seq" value="${i.tips_seq}">
			<section class="py-5">
				<div class="container px-5 my-5">
					<div class="row gx-5">
						<div class="col-lg-3">
							<div class="d-flex align-items-center mt-lg-5 mb-4">
								<img class="img-fluid rounded-circle"
									src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
								<div class="ms-3">
									<div class="fw-bold">${dto.tips_writer}</div>
									<div class="text-muted">News, Business</div>
								</div>
							</div>
						</div>
						<div class="col-lg-9">

							<article>

								<header class="mb-4">

									<h1 class="fw-bolder mb-1">${dto.tips_title}</h1>

									<div class="text-muted fst-italic mb-2">${dto.tips_write_date}</div>

								</header>

								<figure class="mb-4">
									<img class="img-fluid rounded"
										src="https://dummyimage.com/900x400/ced4da/6c757d.jpg"
										alt="..." />
								</figure>

								<section class="mb-5">
									<h2 class="fw-bolder mb-4 mt-5">${dto.tips_title}</h2>
									<p class="fs-5 mb-4">${dto.tips_contents}</p>
								</section>
							</article>
						</div>
					</div>
				</div>
			</section>
		</form>
	</main>


	<div class="row">
		<div class="col">

			<button type="button" id="golist" class="btn btn-secondary"
				style="float: right">목록으로</button>
			<button type="button" id="tipsmodify" class="btn btn-secondary"
				style="float: right">글 수정</button>
			<button type="button" id="tipsdelete" class="btn btn-secondary"
				style="float: right">글 삭제</button>


			<script>
				$("#golist").on("click", function() {
					location.href = "list.tips"
				})

				$("#tipsdelete").on("click", function() {
					confirm("삭제하시겠습니까?");
					location.href = "/delete.tips?tips_seq=${dto.tips_seq }";
				})
				
				$("#tipsmodify").on("click", function() {
					location.href = "/gomodify.tips?tips_seq=${dto.tips_seq }"
				})
			</script>


		</div>








		<!-- Footer-->
		<footer class="bg-dark py-4 mt-auto ">
			<div class="container px-5 ">
				<div
					class="row align-items-center justify-content-between flex-column flex-sm-row ">
					<div class="text-center">
						<div class="small m-0 text-white">대표자 : 임근혁 | 담당자 : 윤성민 |
							책임자 : 유한호 | 관리자 : 이진혁 | 개발자 : 이승택 | 총관리 : 권준구</div>
						<div class="small m-0 text-white"></div>
						<div class="small m-0 text-white">케이헬스 주식회사
							(www.k-health.com) | 사업자등록번호 : 851-12-34567</div>
						<div class="small m-0 text-white">Copyright &copy; K-Health
							Corp. All rights reserved.</div>
						<div class="small m-0 text-white">서울특별시 중구 남대문로 120 대일빌딩 3층</div>

						<img src="/image/instagram.png" height="20px"> <span
							class="text-white mx-1">&middot;</span> <img
							src="/image/facebook.png" height="20px"> <span
							class="text-white mx-1">&middot;</span> <img
							src="/image/youtube.png" height="20px"> <span
							class="/image/text-white mx-1">&middot;</span> <img
							src="/image/twitter.png" height="20px">
					</div>
				</div>
			</div>
		</footer>
		<!-- Bootstrap core JS-->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="/js/scripts.js"></script>
</body>

</html>