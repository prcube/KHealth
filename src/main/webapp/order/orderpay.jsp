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
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
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
				<c:choose>
					<c:when test="${loginID != null}">
						<!-- 로그인을 한 사용자 -->
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
								<li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
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
										<li><a class="dropdown-item" style="color: white;"
											href="#">장바구니</a></li>
										<li><a class="dropdown-item" style="color: white;"
											href="#">뭐 넣지</a></li>
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


		<script
			src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script
			src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!------ Include the above in your HEAD tag ---------->

		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<div
					class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
					<div
						class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<address>
									<strong>배송지 정보</strong> <br> ${dao.zip } <br>
									${dao.address1 }<br> ${dao.address2 } <br> <abbr
										title="Phone">Phone:</abbr> ${dao.number }
								</address>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 text-right">
								<p>
									<em>주문번호 #: 34522677W</em>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="text-center">
								<h1>주문내역</h1>
							</div>
							</span>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>상품</th>
										<th>수량</th>
										<th class="text-center">가격</th>
										<th class="text-center">합</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td class="col-md-7"><h4>
												<em> </em> ${dto.product_name }
											</h4></td>
										<td class="col-md-2" style="text-align: center">${amount }</td>
										<td class="col-md-2 text-center">${dto.product_price }원</td>
										<td class="col-md-1 text-center"></td>




										<td><script>
											//콤마 제거
											const numberStr = "${dto.product_price }";
											const number = numberStr.replace(
													/,/g, "");
											var result = number * $
											{
												amount
											};
											// 수량과 금액 곱한 후 결과 값에 콤마 다시 추가
											var sum = result
													.toString()
													.replace(
															/\B(?=(\d{3})+(?!\d))/g,
															',');
											document.write(sum.toString());
										</script>원</td>
									</tr>

									<tr>

										<td class="text-center"><h4>
												<strong>결제금액: </strong>
											</h4></td>
										<td class="text-center text-danger"><h4>
												<strong>₩</strong> <strong> <script>
													document.write(sum
															.toString());
												</script>
												</strong><strong>원</strong>
											</h4></td>
										<td> </td>
										<td> </td>
									</tr>
								</tbody>
							</table>
							<form action="/completed.buy" name="formgo" method="post">
								<input type="hidden" value="${dto.product_name }" name="name">
								<input type="hidden" value="${amount }" name="amount"> <input
									type="hidden" value="${loginID }" name="ID"> <input
									type="hidden" value="${dao.nickname }" name="nickname">
							</form>

							<input type="submit" value="결제하기" onclick="requestPay()"
								class="btn btn-success btn-lg btn-block"> <span
								class="glyphicon glyphicon-chevron-right"></span>

							<script>
								var buyer = "${dao.name }";
								var name = "${dto.product_name }";
								const numberStr2 = "${dto.product_price }";
								const number2 = numberStr.replace(/,/g, "");
								var result2 = number2 * $
								{
									amount
								};
								function requestPay() {
									var form = document.formgo;
									// IMP.request_pay(param, callback) 결제창 호출
									var IMP = window.IMP; // 생략 가능
									IMP.init("imp52470434"); // 예: imp00000000
									IMP.request_pay({ // param
										pg : "html5_inicis",
										pay_method : "card",
										/* merchant_uid: "ORD20180131-0000011", */
										name : name,
										/* amount: result2, */
										amount 100: ,
										buyer_email : "",
										buyer_name : buyer,
										buyer_tel : ""

									}, function(rsp) { // callback
										if (rsp.success) {
											form.submit();
										} else {
											var msg = '결제에 실패하였습니다.';
											msg += '에러내용 : ' + rsp.error_msg;
											alert(msg)
										}
									});
								}
							</script>

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
		$("#logout").on("click", function() {
			location.href = "/logout.mem";
		})
	</script>

</body>
</html>