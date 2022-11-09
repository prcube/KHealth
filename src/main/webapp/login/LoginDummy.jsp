<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
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
<script src="https://code.jquery.com/jquery-3.6.1.js"> </script>
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

		<%
		String clientId = "_5b0QUYbnHTk93odBRsA";//애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://127.0.0.1/index.jsp", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
		%>

		<!-- 로그인 파트 -->
		<form action="/login.mem" method=post>
			<section class="vh-100">
				<div class="container py-5 h-100">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-12 col-md-8 col-lg-6 col-xl-5">
							<div class="card shadow-2-strong" style="border-radius: 1rem;">
								<div class="card-body p-5 text-center">

									<h3 class="mb-5">로그인</h3>

									<div class="form-outline mb-4">
										<input type="text" id="ID" name="ID"
											class="form-control form-control-lg"
											placeholder="아이디를 입력해 주세요" />

									</div>

									<div class="form-outline mb-4">
										<input type="password" id="passwd" name="passwd"
											class="form-control form-control-lg"
											placeholder="패스워드를 입력해 주세요" />
									</div>

									<!-- Checkbox -->
									<div class="form-check d-flex justify-content-start mb-4">
										<label class="form-check-label" for="form1Example3">암호
											기억하기 </label>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <input
											class="form-check-input" type="checkbox" value=""
											id="form1Example3" />
									</div>

									<button class="btn btn-primary btn-lg btn-block" type="submit"
										style="width: 100%;">로그인</button>
									<br> <br>
									<div>
										<a href="SigninDummy.jsp">
											<button type="button" class="btn text-secondary">회원가입</button>
										</a>

										<button type="button" class="btn text-secondary">아이디
											찾기</button>
									</div>

									<hr class="my-4">
									
									<a id="kakao-login-btn" href="javascript:loginWithKakao();">
										<img
										src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
										width="222" alt="카카오 로그인 버튼" />
									</a>
									<p id="token-result"></p>

									<a href="<%=apiURL%>"><img height="50"
										src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</form>
		
		
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
			integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL"
			crossorigin="anonymous"></script>
		<script>
  Kakao.init('2644b324a18137f288c55737e196f4ac'); // 사용하려는 앱의 JavaScript 키 입력
</script>

		<script>
// 		let target = $("#token-result").val();
// 		$.ajax({
// 			url : '/KakaoLoginAjaxController',
// 			data : "target="+target+"",
// 			dataType : "json" 
// 		})

 function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://127.0.0.1/login/LoginDummy.jsp',
      state: 'userme',
    });
  }

  function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
    })
      .then(function(res) {
        alert(JSON.stringify(res));
      })
      .catch(function(err) {
        alert(
          'failed to request user information: ' + JSON.stringify(err)
        );
      });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  
  function displayToken() {
    var token = getCookie('authorize-access-token');

    if(token) {
      Kakao.Auth.setAccessToken(token);
      document.querySelector('#token-result').innerText = 'login success, ready to request API';
      document.querySelector('button.api-btn').style.visibility = 'visible';
    }
  }
  
  displayToken();
  
  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
  
  
//   Kakao.API.request({
//   	  url: '/v2/user/me',
//   	  data: {
//   	    property_keys: ['kakao_account.email', 'profile_nickname'],
//   	  },
//   	})
//   	  .then(function(response) {
//   		  console.log("난 살아있다..");
//   	    console.log(response);
//   	  })
//   	  .catch(function(error) {
//   		console.log("나도 살아있다..");
//   	    console.log(error);
//   	  });
  
 


</script>

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

</body>
</html>