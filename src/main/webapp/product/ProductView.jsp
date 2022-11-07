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
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
<!-- 결제모듈 API -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>

</head>

<body class="d-flex flex-column h-100">

<form action="/item.buy?product_seq=${dto.product_seq }" method="post">
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
							href="/tips/TipsDummy.jsp">Tips</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/market/MarketDummy.jsp">Market</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/qna/QnaDummy.jsp">Q&A</a></li>
						<li class="nav-item"><a class="nav-link" href="">Login</a></li>
					</ul>
				</div>
			</div>
			<c:choose>
				<c:when test="${loginID != null}">
					<!-- 로그인을 한 사용자 -->
					<a style="color: white">${loginID }님 안녕하세요? &nbsp; &nbsp;
						&nbsp;</a>
					<input type="button" id="logout" style="WIDTH: 60pt; HEIGHT: 20pt"
						value="로그아웃">
				</c:when>
				<c:when test="${loginID == null}">
					<!-- 로그인을 한 사용자 -->
					<a style="color: white"></a>
				</c:when>
			</c:choose>
		</nav>


		<!-- Product section-->
		
		<section class="py-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="col-md-6">
						<img class="card-img-top mb-5 mb-md-0"
							src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
					</div>

					<div class="col-md-6">
						<div class="small mb-1">SKU: BST-498</div>
						<h1 class="display-5 fw-bolder">${dto.product_name }</h1>
						<div class="fs-5 mb-5" >
							<span>${dto.product_price } 원</span>
						</div>
						<p class="lead">Lorem ipsum dolor sit amet consectetur
							adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi
							consequatur obcaecati excepturi alias magni, accusamus eius
							blanditiis delectus ipsam minima ea iste laborum vero?</p>
						<div class="d-flex">

							<div>
								
									<input type="text" name="amount" style="max-width: 3rem" value="1"> <input
										type="button" value="+"
										onClick="javascript:this.form.amount.value++;"> <input
										type="button" value="-"
										onClick="javascript:this.form.amount.value--;">
									
							</div>
							<br> <br>
							<div>
								<button class="btn btn-outline-dark flex-shrink-0" type="button">
									<i class="bi-cart-fill me-1"></i> 장바구니
								</button>
							<input
									type="submit" class="btn btn-outline-dark flex-shrink-0"
									id="buy" value="구매하기">
							</div>
						</div>

					</div>
		</section>

		<!-- review section -->
		<section class="py-5">

			<div class="row d-flex justify-content-center px-md-5 mx-md-5">
				<div class="container px-4 px-lg-5 my-5">
					<div class="card shadow-0 border"
						style="background-color: #f0f2f5;">
						<div class="card-body p-4">
							<div class="form-outline mb-4">

								<input type="text" id="addANote" class="form-control"
									placeholder="Type comment..." />

							</div>

							<div class="card mb-4">
								<div class="card-body">
									<p>Type your note, and hit enter to add it</p>

									<div class="d-flex justify-content-between">
										<div class="d-flex flex-row align-items-center">

											<p class="small mb-0 ms-2">Martha</p>
										</div>
										<div class="d-flex flex-row align-items-center">
											<p class="small text-muted mb-0">Upvote?</p>
											<i class="far fa-thumbs-up mx-2 fa-xs text-black"
												style="margin-top: -0.16rem;"></i>
											<p class="small text-muted mb-0">3</p>
										</div>
									</div>
								</div>
							</div>

							<div class="card mb-4">
								<div class="card-body">
									<p>Type your note, and hit enter to add it</p>

									<div class="d-flex justify-content-between">
										<div class="d-flex flex-row align-items-center">

											<p class="small mb-0 ms-2">Johny</p>
										</div>
										<div class="d-flex flex-row align-items-center">
											<p class="small text-muted mb-0">Upvote?</p>
											<i class="far fa-thumbs-up mx-2 fa-xs text-black"
												style="margin-top: -0.16rem;"></i>
											<p class="small text-muted mb-0">4</p>
										</div>
									</div>
								</div>
							</div>

							<div class="card mb-4">
								<div class="card-body">
									<p>Type your note, and hit enter to add it</p>

									<div class="d-flex justify-content-between">
										<div class="d-flex flex-row align-items-center">

											<p class="small mb-0 ms-2">Mary Kate</p>
										</div>
										<div class="d-flex flex-row align-items-center text-primary">
											<p class="small mb-0">Upvoted</p>
											<i class="fas fa-thumbs-up mx-2 fa-xs"
												style="margin-top: -0.16rem;"></i>
											<p class="small mb-0">2</p>
										</div>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-body">
									<p>Type your note, and hit enter to add it</p>

									<div class="d-flex justify-content-between">
										<div class="d-flex flex-row align-items-center">

											<p class="small mb-0 ms-2">Johny</p>
										</div>
										<div class="d-flex flex-row align-items-center">
											<p class="small text-muted mb-0">Upvote?</p>
											<i class="far fa-thumbs-up ms-2 fa-xs text-black"
												style="margin-top: -0.16rem;"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>










	<!-- Footer-->
	<footer class="bg-dark py-4 mt-auto ">
		<div class="container px-5 ">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row ">
				<div class="text-center">
					<div class="small m-0 text-white">대표자 : 임근혁 | 담당자 : 윤성민 | 책임자
						: 유한호 | 관리자 : 이진혁 | 개발자 : 이승택 | 총관리 : 권준구</div>
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


</form>
</body>

</html>