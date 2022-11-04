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

		<link
			href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
			rel="stylesheet" id="bootstrap-css">
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
									<strong>배송지 정보</strong> <br> 2135 Sunset Blvd <br>
									Los Angeles, CA 90026 <br> <abbr title="Phone">P:</abbr>
									(213) 484-6829
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
										<td class="col-md-7"><em>Baked Rodopa Sheep Feta</em>
											</h4></td>
										<td class="col-md-2" style="text-align: center">2</td>
										<td class="col-md-2 text-center">$13</td>
										<td class="col-md-1 text-center">$26</td>
									</tr>
									<tr>
										<td class="col-md-9"><em>Lebanese Cabbage Salad</em>
											</h4></td>
										<td class="col-md-1" style="text-align: center">1</td>
										<td class="col-md-1 text-center">$8</td>
										<td class="col-md-1 text-center">$8</td>
									</tr>
									<tr>
										<td class="col-md-9"><em>Baked Tart with Thyme and
												Garlic</em>
											</h4></td>
										<td class="col-md-1" style="text-align: center">3</td>
										<td class="col-md-1 text-center">$16</td>
										<td class="col-md-1 text-center">$48</td>
									</tr>
									<tr>

										<td class="text-center"><h4>
												<strong>결제금액: </strong>
											</h4></td>
										<td class="text-center text-danger"><h4>
												<strong>$31.53</strong>
											</h4></td>
										<td> </td>
										<td> </td>
									</tr>
								</tbody>
							</table>
							<button type="button" class="btn btn-success btn-lg btn-block">
								결제하기   <span class="glyphicon glyphicon-chevron-right"></span>
							</button>
							</td>
						</div>
					</div>
				</div>
				</
			</div>
		</section>




		<!-- Footer-->
		<footer class="bg-dark py-4 mt-auto ">
			<div class="container px-5 ">
				<div
					class="row align-items-center justify-content-between flex-column flex-sm-row ">
					<div class="text-center"></div>
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
</body>

</html>