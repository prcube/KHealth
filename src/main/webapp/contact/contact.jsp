<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko-KR">

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.1.js">
	
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link rel="apple-touch-icon"
	href="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/favicon-180x180.png?v1.0.1" />
<meta name="msapplication-TileImage"
	content="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/favicon-270x270.png?v1.0.1" />

<link rel="preload"
	href="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/fonts/kakao/KakaoBig.woff2"
	as="font" type="font/woff2" crossorigin />
<link rel="preload"
	href="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/fonts/kakao/KakaoBig.woff"
	as="font" type="font/woff" crossorigin />
<link rel="preload"
	href="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/fonts/kakao/KakaoBig-Bold.woff2"
	as="font" type="font/woff2" crossorigin />
<link rel="preload"
	href="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/fonts/kakao/KakaoBig-Bold.woff"
	as="font" type="font/woff" crossorigin />

<meta name='robots' content='max-image-preview:large' />
<title>K-Health</title>


<script
	src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/vendors/browser/browser-selector.js"></script>
<script
	src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/ie11.js"></script>
<link rel='dns-prefetch' href='//dapi.kakao.com' />

<link rel='stylesheet' id='style-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/style.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='font-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/font.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='magnific-popup-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/vendors/modal/magnific-popup.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='magnific-popup-motion-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/vendors/modal/magnific-popup-motion.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='swiper-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/vendors/slider/swiper/swiper.min.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='reset-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/reset.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='layout-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/layout.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='ke-strap-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/ke-strap.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='blocks-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/blocks.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='main-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/main.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='sub-component-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/sub-component.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='sub-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/sub.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='strap-popup-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/popup-strap.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='rwd-layout-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/rwd-layout.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='rwd-strap-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/rwd-strap.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='rwd-blocks-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/rwd-blocks.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='rwd-main-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/rwd-main.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='rwd-component-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/rwd-component.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='rwd-sub-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/rwd-sub.css?ver=1.0.27'
	type='text/css' media='all' />
<link rel='stylesheet' id='ke-adminbar-css'
	href='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/css/admin-bar.css?ver=1.0.27'
	type='text/css' media='all' />
<script
	src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/vendors/jquery/jquery.min.js?ver=1.0.27'
	id='jquery-js'></script>
<link rel="https://api.w.org/"
	href="https://kakaoenterprise.com/wp-json/" />
<link rel="alternate" type="application/json"
	href="https://kakaoenterprise.com/wp-json/wp/v2/pages/55" />
<link rel="canonical" href="https://kakaoenterprise.com/info/about/" />
<link rel='shortlink' href='https://kakaoenterprise.com/?p=55' />
<link rel="alternate" type="application/json+oembed"
	href="https://kakaoenterprise.com/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fkakaoenterprise.com%2Finfo%2Fabout%2F" />
<link rel="alternate" type="text/xml+oembed"
	href="https://kakaoenterprise.com/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fkakaoenterprise.com%2Finfo%2Fabout%2F&#038;format=xml" />

</head>

<body data-rsssl=1
	class="d-flex flex-column h-100 page-template page-template-sub page-template-info-about page-template-subinfo-about-php page page-id-55 page-child parent-pageid-51 jt-popup--show">


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
					<li class="nav-item"><a class="nav-link" href="/list.tips">Tips</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/market/MarketDummy.jsp">Market</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/qna/QnaDummy.jsp">Q&A</a></li>
					<li class="nav-item"><a class="nav-link" href="">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<main id="main" class="flex-shrink-0">


		<div class="article">
			<div class="article-header about-visual">
				<div class="wrap-middle">
					<h1 class="sr-only">회사소개</h1>
					

					<p class="article-intro">
						최고의 기술, 최적의 방법으로 <br /> 기업들의 디지털 혁신을 실현합니다
					</p>
					<p class="article-addition">
						카카오엔터프라이즈는 국내 대표 IT 플랫폼 사업자로서 <br /> 더 스마트한 비즈니스, 더 스마트한 일상을 만들기
						위해 출범했습니다.
					</p>
				</div>
				<!-- .wrap-middle -->
			</div>
			<!-- .article-header -->

			<div class="article-body">

				<div class="about-browse ke-popup-video__delegate">
					<div class="about-browse__list">
						<div class="about-browse__item">
							<div class="about-browse__thumb">
								<figure class="ke-lazyload">
									<span class="ke-lazyload__color-preview"></span>
									<img width="476" height="340"
										data-unveil="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-05.jpg"
										src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/layout/blank.gif"
										alt="" />
									<noscript>
										<img
											src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-05.jpg"
											alt="" />
									</noscript>
								</figure>
								<!-- .ke-lazyload -->
							</div>
							<!-- .about-browse__thumb -->

							<b lang="en" class="about-browse__title">Business with AI</b>
						</div>
						<!-- .about-browse__item -->

						<div class="about-browse__item">
							<div class="about-browse__thumb">
								<figure class="ke-lazyload">
									<span class="ke-lazyload__color-preview"></span>
									<img width="476" height="340"
										data-unveil="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-01.jpg"
										src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/layout/blank.gif"
										alt="" />
									<noscript>
										<img
											src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-01.jpg"
											alt="" />
									</noscript>
								</figure>
								<!-- .ke-lazyload -->
							</div>
							<!-- .about-browse__thumb -->

							<b lang="en" class="about-browse__title">Tech with AI</b>
						</div>
						<!-- .about-browse__item -->

						<div class="about-browse__item">
							<div class="about-browse__thumb">
								<figure class="ke-lazyload">
									<span class="ke-lazyload__color-preview"></span>
									<img width="476" height="340"
										data-unveil="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-07.jpg"
										src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/layout/blank.gif"
										alt="" />
									<noscript>
										<img
											src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-07.jpg"
											alt="" />
									</noscript>
								</figure>
								<!-- .ke-lazyload -->
							</div>
							<!-- .about-browse__thumb -->

							<b lang="en" class="about-browse__title">Work with AI</b>
						</div>
						<!-- .about-browse__item -->

						<div class="about-browse__item">
							<div class="about-browse__thumb">
								<figure class="ke-lazyload">
									<span class="ke-lazyload__color-preview"></span>
									<img width="476" height="340"
										data-unveil="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-04.jpg"
										src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/layout/blank.gif"
										alt="" />
									<noscript>
										<img
											src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-04.jpg"
											alt="" />
									</noscript>
								</figure>
								<!-- .ke-lazyload -->
							</div>
							<!-- .about-browse__thumb -->

							<b lang="en" class="about-browse__title">Connect with AI</b>
						</div>
						<!-- .about-browse__item -->

						<div class="about-browse__item">
							<div class="about-browse__thumb">
								<figure class="ke-lazyload">
									<span class="ke-lazyload__color-preview"></span>
									<img width="476" height="340"
										data-unveil="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-08.jpg"
										src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/layout/blank.gif"
										alt="" />
									<noscript>
										<img
											src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-08.jpg"
											alt="" />
									</noscript>
								</figure>
								<!-- .ke-lazyload -->
							</div>
							<!-- .about-browse__thumb -->

							<b lang="en" class="about-browse__title">Future with AI</b>
						</div>
						<!-- .about-browse__item -->

						<div class="about-browse__item">
							<div class="about-browse__thumb">
								<figure class="ke-lazyload">
									<span class="ke-lazyload__color-preview"></span>
									<img width="476" height="340"
										data-unveil="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-02.jpg"
										src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/layout/blank.gif"
										alt="" />
									<noscript>
										<img
											src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-02.jpg"
											alt="" />
									</noscript>
								</figure>
								<!-- .ke-lazyload -->
							</div>
							<!-- .about-browse__thumb -->

							<b lang="en" class="about-browse__title">Life with AI</b>
						</div>
						<!-- .about-browse__item -->

						<div class="about-browse__item">
							<div class="about-browse__thumb">
								<figure class="ke-lazyload">
									<span class="ke-lazyload__color-preview"></span>
									<img width="476" height="340"
										data-unveil="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-06.jpg"
										src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/layout/blank.gif"
										alt="" />
									<noscript>
										<img
											src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-browse-06.jpg"
											alt="" />
									</noscript>
								</figure>
								<!-- .ke-lazyload -->
							</div>
							<!-- .about-browse__thumb -->

							<b lang="en" class="about-browse__title">Place with AI</b>
						</div>
						<!-- .about-browse__item -->
					</div>
					<!-- .about-browse__list -->
				</div>
				<!-- .about-browse -->

				<div class="about-intro">
					<div class="wrap-narrow">
						<div class="about-message">
							<div class="about-message__title">
								<div class="about-intro__logo">
									<figure class="ke-lazyload">
										<img width="258" height="36"
											data-unveil="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-intro-logo.svg"
											src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/layout/blank.gif"
											alt="" />
										<noscript>
											<img
												src="https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/images/sub/info/about-intro-logo.svg"
												alt="" />
										</noscript>
									</figure>
									<!-- .ke-lazyload -->
								</div>
								<!-- .about-intro__logo -->
							</div>
							<!-- .about-message__title -->

							<div class="about-message__content">
								<p>
									카카오엔터프라이즈는 카카오의 사내독립기업(CIC) AI Lab이 분사해 <br /> 2019년 12월 공식
									출범했습니다.
								</p>
								<p>
									인공지능(AI), 클라우드, 검색 등 오랜 시간 동안 축적한 카카오의 기술력과 서비스 경험을 <br /> 결합해
									기존에 진행하던 사업을 더욱 속도감 있게 전개하고, 신규 성장 동력 확보를 위해 <br /> 본격적으로 비즈니스
									파트너들과 함께하는 엔터프라이즈 IT 기업을 지향합니다.
								</p>
								<p>
									급변하는 비즈니스 환경에 최적화된 디지털 혁신 솔루션을 제시하고, <br /> 기술 기업으로서 기술고도화를 위한
									R&D 투자도 강화해 나가고 있습니다.
								</p>
								<!-- .about-message__buttons -->
							</div>
							<!-- .about-message__content -->
						</div>
						<!-- .about-message -->

						<div class="about-message">
							<h2 lang="en" class="about-message__title">Manifesto</h2>

							<div class="about-message__content">
								<b> 우리는 꿈을 현실로 만드는 여정에 함께하는 동반자들이다. <br /> 우리는 사람들이 자신의 꿈을
									실현하는 것을 도움으로써 <br /> 더 나은 세상을 만드는데 기여한다.
								</b>
								<p>
									AI 기술과 서비스, <br /> 그리고 혁신적인 아이디어로 우리 모두의 꿈을 현실로 만듭니다.
								</p>
							</div>
							<!-- .about-message__content -->
						</div>
						<!-- .about-message -->
					</div>
					<!-- .wrap-narrow -->

					<!-- .wrap -->
				</div>
				<!-- .about-intro -->

				<div class="about-philosophy">
					<div class="wrap-narrow">
						<h2 lang="en" class="about-philosophy__title">The way we work</h2>

						<div class="about-philosophy__slogan-wrap">
							<div class="about-philosophy__slogan">
								<div class="about-philosophy__slogan-key">
									<b lang="en">Why not?</b>
									<p>당연한 것들에 대한 도전</p>
								</div>
								<!-- .about-philosophy__slogan-key -->

								<div class="about-philosophy__slogan-key">
									<b lang="en">If Kakao Enterprise,</b>
									<p>카카오스러운 생각에 대한 기대</p>
								</div>
								<!-- .about-philosophy__slogan-key -->

								<div class="about-philosophy__slogan-bracket">
									<span lang="en">(</span><span lang="en">)</span>
								</div>
							</div>
							<!-- .about-philosophy__slogan -->
						</div>
						<!-- .about-philosophy__slogan-wrap -->

						<p class="about-philosophy__desc">
							인공지능과 데이터, 클라우드, 검색 기술로 우리의 비즈니스와 <br /> 일상에 유례없는 변화를 이끌어내는 것. <br />
							그리고 이 변화를 더 많은 사람들이, 쉽게 누릴 수 있는 세상을 만드는 것. <br /> 그것이 바로 우리가 기술을
							다루는 방식이자 철학입니다.
						</p>
						<!-- .about-philosophy__desc -->
					</div>
					<!-- .wrap-narrow -->
				</div>
				<!-- .about-philosophy -->

	</main>
	<!-- .main_container -->

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

	<!-- .global-sticky-banner -->

	<script
		src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/vendors/greensock/gsap.min.js?ver=1.0.27'
		id='gsap-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/vendors/greensock/ScrollToPlugin.min.js?ver=1.0.27'
		id='scrolltoplugin-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/vendors/greensock/ScrollTrigger.min.js?ver=1.0.27'
		id='scrolltrigger-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/vendors/modal/jquery.magnific-popup.min.js?ver=1.0.27'
		id='magnific-popup-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-includes/js/clipboard.min.js?ver=1.0.27'
		id='clipboard-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/vendors/jt/jt-unveil.js?ver=1.0.27'
		id='jtunveil-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-includes/js/imagesloaded.min.js?ver=1.0.27'
		id='imagesloaded-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/vendors/slider/swiper/swiper.min.js?ver=1.0.27'
		id='swiper-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/vendors/isotope/isotope.pkgd.min.js?ver=1.0.27'
		id='isotope-js'></script>
	<script
		src='//dapi.kakao.com/v2/maps/sdk.js?appkey=d926364c5e8c02b9d6080189557ecf63&#038;ver=1.0.27'
		id='kakao-map-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/jt.js?ver=1.0.27'
		id='jt-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/ke-strap.js?ver=1.0.27'
		id='ke-strap-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/main.js?ver=1.0.27'
		id='main-js'></script>
	<script
		src='https://kakaoenterprise.com/wp-content/themes/kakaoenterprise/js/popup-strap.js?ver=1.0.27'
		id='strap-popup-js'></script>

</body>
</html>
