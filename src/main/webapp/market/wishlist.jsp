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

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
   {
   -webkit-appearance: none;
   margin: 0;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js">
   
</script>
</head>
<body class="d-flex flex-column h-100">
<<<<<<< HEAD
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
				<c:choose>
					<c:when test="${loginID != null}">
						<!-- 로그인을 한 사용자 -->
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
								<li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
								<li class="nav-item"><a class="nav-link"href="/contact/contact.jsp">About us</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/list.tips?cpage=1">Tips</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/list.market?cpage=1">Market</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/list.qna?cpage=1">Q&A</a></li>


								<!-- dropdown -->
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" style="color: white" href="#"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">
										${loginID }님 </a>
									<ul class="dropdown-menu dropdown-menu-dark">
										<li class="dropdown-item"><a href="/mypage.mem"
											style="color: white; text-decoration: none;">Mypage</a></li>
										<li><a class="dropdown-item" style="color: white;" href="/list.wish?cpage=1">장바구니</a></li>
<!-- 										<li><a class="dropdown-item" style="color: white;" -->
<!-- 											href="#">뭐 넣지</a></li> -->
										<li>
											<hr class="dropdown-divider">
										</li>
										<li><input type="button" class="btn btn-link" id="logout"
											style="color: white; text-decoration: none;" value="로그아웃"></li>
									</ul></li>
							</ul>
						</div>

					</c:when>
					<c:when test="${loginID == null}">
						<!-- 로그인을 안한 사용자 -->
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
								<li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
								<li class="nav-item"><a class="nav-link"href="/contact/contact.jsp">About us</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/list.tips?cpage=1">Tips</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/list.market?cpage=1">Market</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/list.qna?cpage=1">Q&A</a></li>
								<li class="nav-item"><a class="nav-link"
									href="login/LoginDummy.jsp">Login</a></li>
								<li class="nav-item"><a class="nav-link"
									href="login/SigninDummy.jsp">Signin</a></li>
								<li></li>
							</ul>
						</div>
					</c:when>
				</c:choose>
				</div>
		</nav>



		<section class="py-5" style="background-color: white;">
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
												<h1 class="fw-bold mb-0 text-black">장바구니</h1>
												
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

																<h6 class="text-black mb-0 product_name">${i.product_name }</h6>
															</div>
															<div class="col-md-3 col-lg-3 col-xl-2 d-flex">

																<input class="form1 totalAmount" min="0" name="quantity"
																	value="${i.product_wish_count }" type="number"
																	class="form-control form-control-sm" style="width: 40px;" />

																<button class="btn btn-link px-2 amountMinusBtn"
																	onclick="this.parentNode.querySelector('input[type=number]').stepDown();javascript:refresh();">
																	<i class="bi bi-dash-lg"></i>
																</button>

																<button class="btn btn-link px-2 amountPlusBtn"
																	onclick="this.parentNode.querySelector('input[type=number]').stepUp();javascript:refresh();">
																	<i class="bi bi-plus-lg"></i>
																</button>
															</div>
															<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
																<h6 class="mb-0 totalPrice">${i.product_price }</h6>
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
													<a href="javascript:deleteAll();" class="text-body"><i
														class="fas fa-long-arrow-alt-left me-2" 
														></i>장바구니 비우기</a>
												</h6>
											</div>
										</div>
									</div>
									<div class="col-lg-4 bg-grey">
										<div class="p-5">
											<h3 class="fw-bold mb-5 mt-2 pt-1">결제정보</h3>
											<hr class="my-4">

<!-- 											<div class="d-flex justify-content-between mb-4"> -->
<!-- 												<h5 class="text-uppercase">items 3</h5> -->
<!-- 												<h5>€ 132.00</h5> -->
<!-- 											</div> -->

											<h5 class="text-uppercase mb-3">쿠폰</h5>

											<div class="mb-4 pb-2">
												<select class="select">
													<option value="1">선택</option>
													<option value="2">사용할 수 있는 쿠폰이 없습니다.</option>

												</select>
											</div>

											<h5 class="text-uppercase mb-3">할인 코드</h5>

											<div class="mb-5">
												<div class="form-outline">
													<input type="text" id="form3Examplea2"
														class="form-control form-control-lg" /> <label
														class="form-label" for="form3Examplea2">코드를 입력하세요</label>
												</div>
											</div>

											<hr class="my-4">

											<div class="d-flex justify-content-between mb-5">
												<h5 class="text-uppercase">최종 가격</h5>
												<h5 id="totalPriceArea"></h5>
												<h5>원</h5>
												<input type="hidden" id=hiddenPriceArea> 
												
											</div>

											<button type="button" class="btn btn-dark btn-block btn-lg"
												data-mdb-ripple-color="dark" id="buyBtn">구매하기</button>

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
	
		$("#buyBtn").on("click",function(){
			let abc = $("#totalPriceArea").text();
			//console.log(abc);
			location.href="/buy.wish?totalPrice="+abc+"";
		})
	
		$(function() {

			//let amount = document.getElementsByClassName("totalAmount");
			//let price = document.getElementsByClassName("totalPrice");
			let amount = $(".totalAmount");
			let price = $(".totalPrice");
			let name = $(".product_name");
			
			let amountarr = [];
			let pricearr = [];
			let namearr = [];
			
			for (let i = 0; i < amount.length; i++) {
				
				amountarr[i] = amount[i].value
				namearr[i] = name[i].innerText;
			}

			for (let j = 0; j < price.length; j++) {
				
				pricearr[j] = price[j].innerText;
			}

			console.log(amountarr);
			console.log(pricearr);
			console.log(namearr);
			console.log("+++++++")

			let jsonamountarr = JSON.stringify(amountarr);
			let jsonpricearr = JSON.stringify(pricearr);
			let jsonnamearr = JSON.stringify(namearr);
			
			$.ajax({
				type : "post",
				url : "/wishlist.ajax",
				data : {
					"amount" : jsonamountarr,
					"price" : jsonpricearr,
					"name" : jsonnamearr
				},
				dataType : "json",
				success : function(resp) {
					let targetamountarr = JSON.parse(resp.amountarr);
					let targetpricearr = JSON.parse(resp.pricearr);

					let priceSum = 0;

					for (let i = 0; i < targetamountarr.length; i++) {

						priceSum += parseInt(targetamountarr[i].replace(/\,/g,
								''), 10)
								* parseInt(
										targetpricearr[i].replace(/\,/g, ''),
										10);
						console.log(priceSum);
					}

					// 							for(let i=0;i<targetpricearr.length;i++){
					// 								console.log(targetpricearr[i]);
					// 							}

					console.log("_---------");

					//let sum0 = parseInt(targetamountarr[1].replace(/\,/g,''), 10)*parseInt(targetpricearr[1].replace(/\,/g,''), 10);

					//console.log(sum0);	
					let priceResult = priceSum.toString().replace(
							/\B(?=(\d{3})+(?!\d))/g, ',');
					$("#totalPriceArea").text(priceResult);
					
				},
				error : function(resp) {
					alert("에러 발생!");
				},
			})
		});


		function refresh(){
			console.log("refresh");
			
			let amount = $(".totalAmount");
			let price = $(".totalPrice");
			let name = $(".product_name");
			
			let amountarr = [];
			let pricearr = [];
			let namearr = [];
			
			for (let i = 0; i < amount.length; i++) {
				
				amountarr[i] = amount[i].value;
				namearr[i] = name[i].innerText;
			}

			for (let j = 0; j < price.length; j++) {
				
				pricearr[j] = price[j].innerText;
				namearr[j] = name[j].innerText;
			}
			console.log(namearr);
			console.log(amountarr);
			console.log(pricearr);
			console.log("+++++++")

			let jsonamountarr = JSON.stringify(amountarr);
			let jsonpricearr = JSON.stringify(pricearr);
			let jsonnamearr = JSON.stringify(namearr);
			
			$.ajax({
				type : "post",
				url : "/wishlist.ajax",
				data : {
					"amount" : jsonamountarr,
					"price" : jsonpricearr,
					"name" : jsonnamearr
				},
				dataType : "json",
				success : function(resp) {
					let targetamountarr = JSON.parse(resp.amountarr);
					let targetpricearr = JSON.parse(resp.pricearr);

					let priceSum = 0;

					for (let i = 0; i < targetamountarr.length; i++) {

						priceSum += parseInt(targetamountarr[i].replace(/\,/g,
								''), 10)
								* parseInt(
										targetpricearr[i].replace(/\,/g, ''),
										10);
						console.log(priceSum);
					}

					// 							for(let i=0;i<targetpricearr.length;i++){
					// 								console.log(targetpricearr[i]);
					// 							}

					console.log("_---------");

					//let sum0 = parseInt(targetamountarr[1].replace(/\,/g,''), 10)*parseInt(targetpricearr[1].replace(/\,/g,''), 10);

					//console.log(sum0);	
					let priceResult = priceSum.toString().replace(
							/\B(?=(\d{3})+(?!\d))/g, ',');
					$("#totalPriceArea").text(priceResult);
				},
				error : function(resp) {
					alert("에러 발생!");
				},
			})
		}
		


		
		function deleteAll(){
			
			let reallyDelete = confirm("정말로 장바구니 목록을 비우시겠습니까?");
			
			if(reallyDelete){
				location.href = "/deleteall.wish";
			}else{
				return;
			}
		}
		

		$("#logout").on("click", function () {
            location.href = "/logout.mem";
         })

   </script>
</body>
</html>