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
<style>
#tipsthumbsup:hover {
	fill: #0d6efd;
}
</style>
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





		<!-- Page Content-->
		<form action="">
			<input type=hidden name="tips_seq" value="${i.tips_seq}">
			<input type=hidden name="tips_seq" value="${i.formedDate }">
			<section class="py-5">
				<div class="container px-5 my-5">
					<div class="row gx-5">
						<div class="col-lg-3">
							<div class="d-flex align-items-center mt-lg-5 mb-4">
								<img class="img-fluid rounded-circle"
									src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
								<div class="ms-3">
									<div class="fw-bold">${dto.tips_nickname}</div>
									<div class="text-muted">trainer</div>
								</div>
							</div>
						</div>
						<div class="col-lg-9">

							<article>

								<header class="mb-4">

									<h1 class="fw-bolder mb-1">${dto.tips_title}</h1>

									<div class="text-muted fst-italic mb-2">${i.formedDate }</div>

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
							<div class="container text-center">
								<button type="button" id="tipsthumbsup" class="btn-link"
									style="background-color: transparent; border: transparent;">

									<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
										viewBox="0 0 512 512">
                                                <!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                                <path
											d="M96 191.1H32c-17.67 0-32 14.33-32 31.1v223.1c0 17.67 14.33 31.1 32 31.1h64c17.67 0 32-14.33 32-31.1V223.1C128 206.3 113.7 191.1 96 191.1zM512 227c0-36.89-30.05-66.92-66.97-66.92h-99.86C354.7 135.1 360 113.5 360 100.8c0-33.8-26.2-68.78-70.06-68.78c-46.61 0-59.36 32.44-69.61 58.5c-31.66 80.5-60.33 66.39-60.33 93.47c0 12.84 10.36 23.99 24.02 23.99c5.256 0 10.55-1.721 14.97-5.26c76.76-61.37 57.97-122.7 90.95-122.7c16.08 0 22.06 12.75 22.06 20.79c0 7.404-7.594 39.55-25.55 71.59c-2.046 3.646-3.066 7.686-3.066 11.72c0 13.92 11.43 23.1 24 23.1h137.6C455.5 208.1 464 216.6 464 227c0 9.809-7.766 18.03-17.67 18.71c-12.66 .8593-22.36 11.4-22.36 23.94c0 15.47 11.39 15.95 11.39 28.91c0 25.37-35.03 12.34-35.03 42.15c0 11.22 6.392 13.03 6.392 22.25c0 22.66-29.77 13.76-29.77 40.64c0 4.515 1.11 5.961 1.11 9.456c0 10.45-8.516 18.95-18.97 18.95h-52.53c-25.62 0-51.02-8.466-71.5-23.81l-36.66-27.51c-4.315-3.245-9.37-4.811-14.38-4.811c-13.85 0-24.03 11.38-24.03 24.04c0 7.287 3.312 14.42 9.596 19.13l36.67 27.52C235 468.1 270.6 480 306.6 480h52.53c35.33 0 64.36-27.49 66.8-62.2c17.77-12.23 28.83-32.51 28.83-54.83c0-3.046-.2187-6.107-.6406-9.122c17.84-12.15 29.28-32.58 29.28-55.28c0-5.311-.6406-10.54-1.875-15.64C499.9 270.1 512 250.2 512 227z" />
                                            </svg>
									<!-- <i class="bi bi-hand-thumbs-up"></i> -->
								</button>
							</div>
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
			
				$("#golist,#tipsmodify,#tipsdelete").hide();
				
				console.log("${dto.tips_writer}");
				console.log("${loginID}");
				if("${loginID}" == "${dto.tips_writer}"){
					$("#golist,#tipsmodify,#tipsdelete").show();
				}
				else if(${member_role}){
					$("#golist,#tipsmodify,#tipsdelete").show();
				}
				

				$("#golist").on("click", function() {
					location.href = "list.tips?cpage=1"
				})

				$("#tipsdelete").on("click", function() {
					confirm("삭제하시겠습니까?");
					location.href = "/delete.tips?tips_seq=${dto.tips_seq }";
				})
				
				$("#tipsmodify").on("click", function() {
					location.href = "/gomodify.tips?tips_seq=${dto.tips_seq }"
				})
				
				$("#tipsthumbsup").on("click", function() {
				location.href = "/thumbsup.tips?cpage=1&tips_seq="+${dto.tips_seq }+""
			})
			
			$("#logout").on("click", function () {
                           location.href = "/logout.mem";
                        })
			</script>


		</div>
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