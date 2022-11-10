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

<style>
.card-registration .select-arrow {
	top: 13px;
}

.bg-grey {
	background-color: #eae8e8;
}

@media ( min-width : 992px) {
	.card-registration-2 .bg-grey {
		border-top-right-radius: 16px;
		border-bottom-right-radius: 16px;
	}
}

@media ( max-width : 991px) {
	.card-registration-2 .bg-grey {
		border-bottom-left-radius: 16px;
		border-bottom-right-radius: 16px;
	}
}
/* tr { */
/*    border-color: transparent; */
/* } */
.table {
	border-radius: 0.5rem;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js">
	
</script>
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
						<li class="nav-item"><a class="nav-link" href="">Tips</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/market/MarketDummy.jsp">Market</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/qna/QnaDummy.jsp">Q&A</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/login/LoginDummy.jsp">Login</a></li>
					</ul>
				</div>
			</div>
			<c:choose>
				<c:when test="${loginID != null}">
					<!-- 로그인을 한 사용자 -->
					<a style="color: white">${loginID }님 안녕하세요? &nbsp; &nbsp;
						&nbsp;</a>
				</c:when>
			</c:choose>
		</nav>



		<section class="h-100 h-custom" style="background-color: #f6ffdc;">
			<div class="container py-5 mb-5 h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-12">
						<div class="card card-registration card-registration-2"
							style="border-radius: 15px;">
							<div class="card-body p-0">
								<div class="row g-0">
									<div class="col-lg-8">
										<div class="p-5">
											<div
												class="d-flex justify-content-between align-items-center mb-5">
												<h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
												<h6 class="mb-0 text-muted">3 items</h6>
											</div>
											<hr class="my-4">



											<c:choose>

												<c:when test="${not empty wishlist}">
													<c:forEach var="i" items="${wishlist }" varStatus="status">

														<div
															class="row mb-4 d-flex justify-content-between align-items-center">
															<div class="col-md-2 col-lg-2 col-xl-2">
																<img src="/image/${i.product_image_oriName }"
																	class="img-fluid rounded-3" alt="Cotton T-shirt">
															</div>
															<div class="col-md-3 col-lg-3 col-xl-3">

																<h6 class="text-black mb-0">${i.product_name }</h6>
															</div>
															<div class="col-md-3 col-lg-3 col-xl-2 d-flex">
																<button class="btn btn-link px-2"
																	onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
																	<i class="fas fa-minus"></i>
																</button>

																<input class="form1 totalAmount" min="0" name="quantity"
																	value="${i.product_wish_count }" type="number"
																	class="form-control form-control-sm" />

																<button class="btn btn-link px-2"
																	onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
																	<i class="fas fa-plus"></i>
																</button>
															</div>
															<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
																<h6 class="mb-0 totalPrice">${i.product_price }</h6>
															</div>
															<div class="col-md-1 col-lg-1 col-xl-1 text-end">
																<a href="#!" class="text-muted"><i
																	class="fas fa-times"></i></a>
															</div>
														</div>
													</c:forEach>
												</c:when>

												<c:otherwise>
													<div>장바구니가 비어 있습니다.</div>
												</c:otherwise>

											</c:choose>




											<hr class="my-4">

											<div class="pt-5">
												<h6 class="mb-0">
													<a href="#!" class="text-body"><i
														class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a>
												</h6>
											</div>
										</div>
									</div>
									<div class="col-lg-4 bg-grey">
										<div class="p-5">
											<h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
											<hr class="my-4">

											<div class="d-flex justify-content-between mb-4">
												<h5 class="text-uppercase">items 3</h5>
												<h5>€ 132.00</h5>
											</div>

											<h5 class="text-uppercase mb-3">Shipping</h5>

											<div class="mb-4 pb-2">
												<select class="select">
													<option value="1">Standard-Delivery- €5.00</option>
													<option value="2">Two</option>
													<option value="3">Three</option>
													<option value="4">Four</option>
												</select>
											</div>

											<h5 class="text-uppercase mb-3">Give code</h5>

											<div class="mb-5">
												<div class="form-outline">
													<input type="text" id="form3Examplea2"
														class="form-control form-control-lg" /> <label
														class="form-label" for="form3Examplea2">Enter your
														code</label>
												</div>
											</div>

											<hr class="my-4">

											<div class="d-flex justify-content-between mb-5">
												<h5 class="text-uppercase">Total price</h5>
												<h5>€ 137.00</h5>
											</div>

											<button type="button" class="btn btn-dark btn-block btn-lg"
												data-mdb-ripple-color="dark">Register</button>

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

	<script>
		$(function() {
			
			let amount = document.getElementsByClassName("totalAmount");
			let price = document.getElementsByClassName("totalPrice");
			
			
			
			let target = amount[0].value
			console.log(amount[0].value);
			console.log(amount[1].value);
			
				 	   
			let jsonamount = JSON.stringfy(amount);
			
				 	   $.ajax({
				 		 type:"post",
				 		 url:"/wishlist.ajax",
				 		 data : {
					 			"amount" : jsonamount,
					 			"price" : price
					 	   },
				 		 dataType:"json",
				 		 success : function(resp){
							console.log(resp);
				 		 },
				 		 error : function(resp){
				 			 alert("에러 발생!");
				 		 }
				 	   })
		});
	</script>
</body>
</html>