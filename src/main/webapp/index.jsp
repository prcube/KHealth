<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
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
<link href="css/styles.css" rel="stylesheet" />
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75fab7aa29c4b6b3c0b3ade35a4bd975"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js">
   
</script>
<script type="text/javascript"
   src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
   charset="utf-8"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>

<style>
#btn-back-to-top {
   position: fixed;
   bottom: 20px;
   right: 10px;
   display: none;
}
</style>

<body class="d-flex flex-column h-100">

	<!-- Back to top button -->
	<button type="button" class="btn btn-light btn-floating btn-sm bg-dark"
		style="border-radius: 100px; border-color: transparent;"
		id="btn-back-to-top">
		<i class="bi bi-chevron-up" style="color: white;"></i>
	</button>
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<nav
			class="navbar navbar-expand-lg navbar-dark bg-dark position: fixed; top: 0px;">
			<div class="container px-5 " id="sticky-wrapper"
				class="sticky-wrapper">
				<a class="navbar-brand" href=""><img
					src="image/khealth logo.png" height="100px"></a>
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
                     href="/list.tips?cpage=1">Tips</a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="/list.market?cpage=1">Market</a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="/list.qna?cpage=1">Q&A</a></li>


                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
                     <ul class="dropdown-menu dropdown-menu-dark">
                        <li class="nav-item"><a class="nav-link"
                           href="login/LoginDummy.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="/mypage.mem">Mypage</a></li>
                        <li class="nav-item"><a class="nav-link"
                           href="login/SigninDummy.jsp">Signin</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <c:choose>
                           <c:when test="${loginID != null}">
                              <!-- 로그인을 한 사용자 -->
                              <li class="nav-item"><a class="nav-link" style="color: white">${loginID }님 <br> 안녕하세요?</a></li>
                              <input type="button" id="logout" style="WIDTH: 60pt; HEIGHT: 20pt" value="로그아웃">
                           </c:when>
                           <c:when test="${loginID == null}">
                              <!-- 로그인을 한 사용자 -->
                              <a style="color: white"></a>
                           </c:when>
                        </c:choose>
                     </ul></li>


					</ul>
				</div>
			</div>
		</nav>






      <header class="bg-dark py-5">
         <div class="container px-5">
            <!-- <캐러셀캐러셀> -->
            <div id="carouselExampleCaptions"
               class="carousel slide carousel-fade" data-bs-ride="false">
               <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleCaptions"
                     data-bs-slide-to="0" class="active" aria-current="true"
                     aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleCaptions"
                     data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleCaptions"
                     data-bs-slide-to="2" aria-label="Slide 3"></button>
               </div>
               <div class="carousel-inner">
                  <div class="carousel-item active">
                     <img src="/image/index1.png" style="border-radius: 15px;"
                        class="d-block w-100" alt="...">
                     <div class="carousel-caption d-none d-md-block">
                        <h5>First slide label</h5>
                        <p>Some representative placeholder content for the first
                           slide.</p>
                     </div>
                  </div>
                  <div class="carousel-item">
                     <img src="/image/index2.png" style="border-radius: 15px;"
                        class="d-block w-100" alt="...">
                     <div class="carousel-caption d-none d-md-block">
                        <h5>Second slide label</h5>
                        <p>Some representative placeholder content for the second
                           slide.</p>
                     </div>
                  </div>
                  <div class="carousel-item">
                     <img src="/image/index3.png" style="border-radius: 15px;"
                        class="d-block w-100" alt="...">
                     <div class="carousel-caption d-none d-md-block">
                        <h5>Third slide label</h5>
                        <p>Some representative placeholder content for the third
                           slide.</p>
                     </div>
                  </div>
               </div>
               <button class="carousel-control-prev" type="button"
                  data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
               </button>
               <button class="carousel-control-next" type="button"
                  data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
               </button>
            </div>
         </div>
      </header>
      <!--         캐러셀끝 -->

      <!-- 동영상 파트-->
      <section class="py-5" id="features">
         <div class="container px-5 my-5">
            <div class="row gx-5">
               <div class="col-lg-4 mb-5 mb-lg-0">
                  <h2 class="fw-bolder mb-5">K-Health Media</h2>
               </div>
               <div class="col-lg-12">
                  <div class="row gx-5 gy-5 row-cols-1 row-cols-md-2">

                     <div class="col mb-5" style="height: 400px;">
                        <div
                           class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                           <i class="bi bi-toggles2"></i>
                        </div>
                        <iframe class="rounded-3" width="100%" height="100%"
                           src="https://www.youtube.com/embed/ptpmRrzRtWQ"
                           title="YouTube video player" frameborder="0"
                           allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                           allowfullscreen></iframe>
                     </div>
                     <div class="col mb-5" style="height: 400px;">
                        <div
                           class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                           <i class="bi bi-building"></i>
                        </div>
                        <iframe class="rounded-3" width="100%" height="100%"
                           src="https://www.youtube.com/embed/q6TI60e7kWY"
                           title="YouTube video player" frameborder="0"
                           allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                           allowfullscreen></iframe>

                     </div>

                     <div class="col mb-5 " style="height: 400px;">
                        <div
                           class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                           <i class="bi bi-toggles2"></i>
                        </div>
                        <h2 class="h5">Featured title</h2>
                        <iframe class="rounded-3" width="100%" height="100%"
                           src="https://www.youtube.com/embed/FQy6mzpcBs0"
                           title="YouTube video player" frameborder="0"
                           allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                           allowfullscreen></iframe>
                     </div>
                     <div class="col mb-5 " style="height: 400px;">
                        <div
                           class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                           <i class="bi bi-toggles2"></i>
                        </div>
                        <h2 class="h5">Featured title</h2>
                        <iframe class="rounded-3" width="100%" height="100%"
                           src="https://www.youtube.com/embed/O94yEoGXtBY"
                           title="YouTube video player" frameborder="0"
                           allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                           allowfullscreen></iframe>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <!-- Testimonial section-->

      <div class="py-5 bg-light">
         <div class="container px-5 my-5">
            <div class="row gx-5 justify-content-center">
               <div class="col-lg-10 col-xl-7">
                  <div class="text-center">
                     <div class="fs-5 mb-4 fst-italic ">
                        "고객 여러분들의 운동을 위해 전문적인 프로그램과 <br>회원 간 정보 교환 및 운동용품 구매를 <br>케이
                        헬스에서 제공해 드리며<br> 고객 여러분께 성심성의를 다해 도와드립니다."
                     </div>
                     <div class="d-flex align-items-center justify-content-center">
                        <img class="rounded-circle me-3"
                           src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                        <div class="fw-bold">
                           임근혁 <span class="fw-bold text-primary mx-1">/</span> CEO,
                           K-Health
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>


      <!-- Blog preview section-->
      <section class="py-5">
         <div class="container px-5 my-5">
            <div class="row gx-5 justify-content-center">
               <div class="col-lg-8 col-xl-6">
                  <div class="text-center">
                     <h2 class="fw-bolder">K-HEALTH 강사진 소개</h2>
                     <p class="lead fw-normal text-muted mb-5">최고의 강사진이 여러분의 건강을
                        책임지겠습니다</p>
                  </div>
               </div>
            </div>
            <div class="row gx-5">
               <div class="col-lg-4 mb-5">
                  <div class="card h-100 shadow border-0">
                     <img class="card-img-top"
                        src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                     <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">어깨전문</div>
                        <a class="text-decoration-none link-dark stretched-link"
                           href="#!">
                           <h5 class="card-title mb-3">임근혁</h5>
                        </a>
                        <p class="card-text mb-0">불균형한 어깨를 완벽하게 대칭으로 만들 수 있는 꿀팁!</p>
                     </div>
                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                           <div class="d-flex align-items-center">
                              <img class="rounded-circle me-3"
                                 src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                              <div class="small">
                                 <div class="fw-bold">Kelly Rowan</div>
                                 <div class="text-muted">March 12, 2022 &middot; 6 min
                                    read</div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 mb-5">
                  <div class="card h-100 shadow border-0">
                     <img class="card-img-top"
                        src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
                     <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
                        <a class="text-decoration-none link-dark stretched-link"
                           href="#!">
                           <h5 class="card-title mb-3">Another blog post title</h5>
                        </a>
                        <p class="card-text mb-0">This text is a bit longer to
                           illustrate the adaptive height of each card. Some quick example
                           text to build on the card title and make up the bulk of the
                           card's content.</p>
                     </div>
                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                           <div class="d-flex align-items-center">
                              <img class="rounded-circle me-3"
                                 src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                              <div class="small">
                                 <div class="fw-bold">Josiah Barclay</div>
                                 <div class="text-muted">March 23, 2022 &middot; 4 min
                                    read</div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 mb-5">
                  <div class="card h-100 shadow border-0">
                     <img class="card-img-top"
                        src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
                     <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
                        <a class="text-decoration-none link-dark stretched-link"
                           href="#!">
                           <h5 class="card-title mb-3">The last blog post title is a
                              little bit longer than the others</h5>
                        </a>
                        <p class="card-text mb-0">Some more quick example text to
                           build on the card title and make up the bulk of the card's
                           content.</p>
                     </div>
                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                           <div class="d-flex align-items-center">
                              <img class="rounded-circle me-3"
                                 src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                              <div class="small">
                                 <div class="fw-bold">Evelyn Martinez</div>
                                 <div class="text-muted">April 2, 2022 &middot; 10 min
                                    read</div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>








            <!-- 카카오지도 카카오지도-->
            <section class="py-5" id="features">
               <div class="container px-4 py-4 my-5 bg-light">
                  <div class="row gx-5">
                     <div class="col-lg-7 mb-5 mb-lg-0">
                        <div id="map" style="width: 100%; height: 400px;"></div>
                        <script>
                           var container = document
                                 .getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                           var options = { //지도를 생성할 때 필요한 기본 옵션
                              center : new kakao.maps.LatLng(
                                    37.5679067, 126.9830668), //지도의 중심좌표.
                              level : 3
                           //지도의 레벨(확대, 축소 정도)

                           };
                           var map = new kakao.maps.Map(container,
                                 options); //지도 생성 및 객체 리턴
                           var markerPosition = new kakao.maps.LatLng(
                                 37.5679067, 126.9830668);
                           var marker = new kakao.maps.Marker({
                              position : markerPosition
                           });
                           marker.setMap(map);

                           map.setDraggable(false);
                        </script>
                     </div>
                     <div class="col-lg-5">
                        <div class="row gx-5 row-cols-1 row-cols-md-1">
                           <div class="col mb-5" style="float: left;">
                              <div
                                 class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                                 <i class="bi bi-map"></i>
                              </div>
                              <h2 class="h5">오시는길</h2>
                              <p class="mb-0">Paragraph of text beneath the heading to
                                 explain the heading. Here is just a bit more text.</p>
                           </div>
                        </div>
                        <div class="row gx-5 row-cols-1 row-cols-md-1">
                           <div class="col mb-5 mb-md-0 mt-5">
                              <div
                                 class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                                 <i class="bi bi-telephone"></i>
                              </div>
                              <h2 class="h5">전화 문의</h2>
                              <p class="mb-0">Paragraph of text beneath the heading to
                                 explain the heading. Here is just a bit more text.</p>
                           </div>

                        </div>
                     </div>
                  </div>
               </div>
            </section>

            <!-- Call to action-->
            <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
               <div
                  class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                  <div class="mb-4 mb-xl-0">
                     <div class="fs-3 fw-bold text-white">New products,
                        delivered to you.</div>
                     <div class="text-white-50">Sign up for our newsletter for
                        the latest updates.</div>
                  </div>
                  <div class="ms-xl-4">
                     <div class="input-group mb-2">
                        <input class="form-control" type="text"
                           placeholder="Email address..." aria-label="Email address..."
                           aria-describedby="button-newsletter" />
                        <button class="btn btn-outline-light" id="button-newsletter"
                           type="button">Sign up</button>
                     </div>
                     <div class="small text-white-50">We care about privacy, and
                        will never share your data.</div>
                  </div>
               </div>
            </aside>
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
   <script src="js/scripts.js"></script>
</body>


<%
String clientId = "_5b0QUYbnHTk93odBRsA";//애플리케이션 클라이언트 아이디값";
String clientSecret = "VA5gRXY82n";//애플리케이션 클라이언트 시크릿값";
String code = request.getParameter("code");
String state = request.getParameter("state");
String redirectURI = URLEncoder.encode("http://127.0.0.1/index.jsp", "UTF-8");
String apiURL;
apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
apiURL += "client_id=" + clientId;
apiURL += "&client_secret=" + clientSecret;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&code=" + code;
apiURL += "&state=" + state;
String access_token = "";
String refresh_token = "";
System.out.println("apiURL=" + apiURL);
try {
   URL url = new URL(apiURL);
   HttpURLConnection con = (HttpURLConnection) url.openConnection();
   con.setRequestMethod("GET");
   int responseCode = con.getResponseCode();
   BufferedReader br;
   System.out.print("responseCode=" + responseCode);
   if (responseCode == 200) { // 정상 호출
      br = new BufferedReader(new InputStreamReader(con.getInputStream()));
   } else { // 에러 발생
      br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
   }
   String inputLine;
   StringBuffer res = new StringBuffer();
   while ((inputLine = br.readLine()) != null) {
      res.append(inputLine);
   }
   br.close();
   if (responseCode == 200) {
      out.println(res.toString());
   }
} catch (Exception e) {
   System.out.println(e);
}
%>
</body>



<script>
   //@@@@@@@@TOP 스크롤 버튼스크립트
   //Get the button
   let mybutton = document.getElementById("btn-back-to-top");

   // When the user scrolls down 20px from the top of the document, show the button
   window.onscroll = function() {
      scrollFunction();
   };

   function scrollFunction() {
      if (document.body.scrollTop > 20
            || document.documentElement.scrollTop > 200) {
         mybutton.style.display = "block";
      } else {
         mybutton.style.display = "none";
      }
   }
   // When the user clicks on the button, scroll to the top of the document
   mybutton.addEventListener("click", backToTop);

   function backToTop() {
      document.body.scrollTop = 0;
      document.documentElement.scrollTop = 0;
   }

   $("#logout").on("click", function() {
      location.href = "/logout.mem";
   })
</script>

</html>