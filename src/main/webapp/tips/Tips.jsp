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
.board-border {
	border: 2px solid #212529;
	padding: 0%;
	margin-top: 3%;
	margin-bottom: 3%;
	border-radius: 0.5rem;
	background: #fff;
}

a {
	text-decoration: none;
	color: black;
}
/* tr { */
/* 	border-color: transparent; */
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


		<ul class="nav nav-tabs mt-3" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
					data-bs-target="#home-tab-pane" type="button" role="tab"
					aria-controls="home-tab-pane" aria-selected="true">가슴</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
					data-bs-target="#profile-tab-pane" type="button" role="tab"
					aria-controls="profile-tab-pane" aria-selected="false">등</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
					data-bs-target="#contact-tab-pane" type="button" role="tab"
					aria-controls="contact-tab-pane" aria-selected="false">하체</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="disabled-tab" data-bs-toggle="tab"
					data-bs-target="#disabled-tab-pane" type="button" role="tab"
					aria-controls="disabled-tab-pane" aria-selected="false">어깨</button>
			</li>
		</ul>


		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="home-tab-pane"
				role="tabpanel" aria-labelledby="home-tab" tabindex="0">
				<div class="container board-border">
					<table class="table align-middle  mb-0 bg-white">
						<thead class="bg-light">
							<tr>
								<th>Name</th>
								<th>Bullet Point</th>
								<th>Title</th>
								<th>Status</th>
								<th>Position</th>
								<th>view count</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${not empty list}">
								<c:forEach var="i" items="${list}">
									<tbody>
										<tr>
											<td>
												<div class="d-flex align-items-center">
													<div class="ms-3">
														<p class="fw-bold mb-1">${i.rn }</p>
													</div>
												</div>
											</td>
											<td>${i.tips_bullet }</td>
											<td>
												<p class="fw-normal mb-1">
													<a href="/detail.tips?tips_seq=${i.tips_seq }">${i.tips_title }</a>
												</p>
												<p class="text-muted mb-0"></p>
											</td>
											<td>${i.tips_nickname }</td>
											<td>${i.formedDate }</td>
											<td>${i.tips_view_count }</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:when>
						</c:choose>

					</table>

				</div>


			</div>
			<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel"
				aria-labelledby="profile-tab" tabindex="0">
				<div class="container board-border">
					<table class="table align-middle mb-0 bg-white">
						<thead class="bg-light">
							<tr>
								<th>Name</th>
								<th>Bullet Point</th>
								<th>Title</th>
								<th>Status</th>
								<th>Position</th>
								<th>view count</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${not empty list}">
								<c:forEach var="i" items="${list}">
									<tbody>
										<tr>
											<td>
												<div class="d-flex align-items-center">
													<div class="ms-3">
														<p class="fw-bold mb-1">${i.rn }</p>
													</div>
												</div>
											</td>
											<td>${i.tips_bullet }</td>
											<td>
												<p class="fw-normal mb-1">
													<a href="/detail.tips?tips_seq=${i.tips_seq }">${i.tips_title }</a>
												</p>
												<p class="text-muted mb-0"></p>
											</td>
											<td>${i.tips_nickname }</td>
											<td>${i.formedDate }</td>
											<td>${i.tips_view_count }</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:when>
						</c:choose>

					</table>

				</div>
			</div>
			<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel"
				aria-labelledby="contact-tab" tabindex="0">
				<div class="container board-border">
					<table class="table align-middle mb-0 bg-white">
						<thead class="bg-light">
							<tr>
								<th>Name</th>
								<th>Bullet Point</th>
								<th>Title</th>
								<th>Status</th>
								<th>Position</th>
								<th>view count</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${not empty list}">
								<c:forEach var="i" items="${list}">
									<tbody>
										<tr>
											<td>
												<div class="d-flex align-items-center">
													<div class="ms-3">
														<p class="fw-bold mb-1">${i.rn }</p>
													</div>
												</div>
											</td>
											<td>${i.tips_bullet }</td>
											<td>
												<p class="fw-normal mb-1">
													<a href="/detail.tips?tips_seq=${i.tips_seq }">${i.tips_title }</a>
												</p>
												<p class="text-muted mb-0"></p>
											</td>
											<td>${i.tips_nickname }</td>
											<td>${i.formedDate }</td>
											<td>${i.tips_view_count }</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:when>
						</c:choose>

					</table>

				</div>
			</div>
			<div class="tab-pane fade" id="disabled-tab-pane" role="tabpanel"
				aria-labelledby="disabled-tab" tabindex="0">
				<div class="container board-border">
					<table class="table align-middle mb-0 bg-white">
						<thead class="bg-light">
							<tr>
								<th>Name</th>
								<th>Bullet Point</th>
								<th>Title</th>
								<th>Status</th>
								<th>Position</th>
								<th>view count</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${not empty list}">
								<c:forEach var="i" items="${list}">
									<tbody>
										<tr>
											<td>
												<div class="d-flex align-items-center">
													<div class="ms-3">
														<p class="fw-bold mb-1">${i.rn }</p>
													</div>
												</div>
											</td>
											<td>${i.tips_bullet }</td>
											<td>
												<p class="fw-normal mb-1">
													<a href="/detail.tips?tips_seq=${i.tips_seq }">${i.tips_title }</a>
												</p>
												<p class="text-muted mb-0"></p>
											</td>
											<td>${i.tips_nickname }</td>
											<td>${i.formedDate }</td>
											<td>${i.tips_view_count }</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:when>
						</c:choose>

					</table>

				</div>

			</div>
		</div>

		<button type="button" class="btn btn-secondary" style="float: right"
			name="tipswrite" id="tipswrite">작성하기</button>





		<script>
			$("#tipswrite").hide();
			console.log(${member_role});
			if (${member_role}) {
				$("#tipswrite").show()
			}

			$("#tipswrite").on("click", function() {
				location.href = "/tips/tipswrite.jsp?cpage=1"
			})
		</script>

	</main>
	<div class="row mb-3">
		<div class="col" style="text-align: center;">${navi }</div>
	</div>


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
</body>
</html>