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
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75fab7aa29c4b6b3c0b3ade35a4bd975"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js">

                        </script>
<script type="text/javascript"
   src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
   charset="utf-8"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- dropdown 해결해준 script -->
<script
   src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
   integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
   integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
   crossorigin="anonymous"></script>

</head>

<style>
#btn-back-to-top {
   position: fixed;
   bottom: 20px;
   right: 10px;
   display: none;
}

.videoleft {
   transform: translateX(-5%);
   opacity: 0;
   transition: .8s;
}

.videoleft.active {
   transform: translateX(0);
   opacity: 1;
}

.videoright {
   transform: translateX(+5%);
   opacity: 0;
   transition: .8s;
}

.videoright.active {
   transform: translateX(0);
   opacity: 1;
}

.card1 {
   transform: translateX(-50%);
   opacity: 0;
   transition: .8s;
}

.card1.active {
   transform: translateX(0);
   opacity: 1;
}

.card2 {
   /* transform: translateX(-50%); */
   opacity: 0;
   transition: .8s;
}

.card2.active {
   transform: translateX(0);
   opacity: 1;
}

.card3 {
   transform: translateX(+50%);
   opacity: 0;
   transition: .8s;
}

.card3.active {
   transform: translateX(0);
   opacity: 1;
}

.card4 {
   transform: translateY(+50%);
   opacity: 0;
   transition: .8s;
}

.card4.active {
   transform: translateY(0);
   opacity: 1;
}

.scroll-container {
   scroll-behavior: smooth;
   overflow-y: scroll;
}

#seq70:hover{
	cursor:pointer;
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


                                 <c:choose>
                                    <c:when test="${loginID != null}">
                                       <!-- 로그인을 한 사용자 -->
                                       <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                             <li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
                                             <li class="nav-item"><a class="nav-link"
                           href="#indexcontact">Contact</a></li>
                                             <li class="nav-item"><a class="nav-link"href="/contact/contact.jsp">About us</a></li>
                                             <li class="nav-item"><a class="nav-link" href="/list.tips?cpage=1">Tips</a>
                                             </li>
                                             <li class="nav-item"><a class="nav-link"
                                                   href="/list.market?cpage=1">Market</a></li>
                                             <li class="nav-item"><a class="nav-link" href="/list.qna?cpage=1">Q&A</a>
                                             </li>

                                          
                                          <!-- dropdown -->
                                          <li class="nav-item dropdown">
                                             <a class="nav-link dropdown-toggle" style="color: white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                ${loginID }님
                                             </a>
                                             <ul class="dropdown-menu dropdown-menu-dark" >
                                                <li class="dropdown-item"><a href="/mypage.mem" style="color:white; text-decoration: none;">Mypage</a></li>
                                                <li><a class="dropdown-item" style="color: white;" href="/list.wish?cpage=1">장바구니</a></li>
<!--                                                 <li><a class="dropdown-item" style="color: white;" href="#">뭐 넣지</a></li> -->
                                                <li>
                                                   <hr class="dropdown-divider">
                                                </li>
                                                <li><input type="button" class="btn btn-link" id="logout" style="color:white; text-decoration: none;" value="로그아웃"></li>
                                             </ul>
                                          </li>
                                          </ul>


                  </div>
               </c:when>
               <c:when test="${loginID == null}">
                  <!-- 로그인을 안한 사용자 -->
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                     <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link"
                           href="#indexcontact">Contact</a></li>
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





      <header class="bg-dark py-5">
         <div class="container px-5">
            <!-- <캐러셀캐러셀> -->
            <div id="carouselExampleCaptions"
               class="carousel slide carousel-fade" data-bs-ride="carousel">
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
                     <img src="/image/c2.png" style="border-radius: 15px;"
                        class="d-block w-100" alt="...">
                     <div class="carousel-caption d-none d-md-block">
                        
                     </div>
                  </div>
                  <div class="carousel-item">
                     <img src="/image/c4.png" style="border-radius: 15px;"
                        class="d-block w-100" alt="..." id="seq70" onclick="javascript:toseq70();">
                        
                     <div class="carousel-caption d-none d-md-block">
                        
                     </div>
                  </div>
                  <div class="carousel-item">
                     <img src="/image/c3.png" style="border-radius: 15px;"
                        class="d-block w-100" alt="...">
                     <div class="carousel-caption d-none d-md-block">
                        
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
         <div class="container px-5 my-5 ">
            <div class="row">
               <h2 class="fw-bolder mb-5">금주의 추천 영상</h2>
            </div>
            <div class="row ">
               <!-- 동영상1번 -->
               <div class="videoleft col-12 col-lg-6 mb-5 ">
                  <div class="row">
                     <div class="col-2">
                        <div
                           class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                           
                           <i class="fa-solid fa-dumbbell"></i>
                        </div>
                     </div>
                     <div class="col-10">
                        <h1 class="h3 mt-2">4 Science-Based Steps</h1>
                     </div>
                  </div>
                  <div class="row-12" style="height: 400px;">
                     <iframe class="row-12 rounded-3" width="100%" height="100%"
                        src="https://www.youtube.com/embed/ptpmRrzRtWQ"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                  </div>
               </div>

               <!-- 동영상2번 -->
               <div class="videoright col-12 col-lg-6 mb-5 ">
                  <div class="row">
                     <div class="col-2">
                        <div
                           class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                           <i class="fa-solid fa-fire-flame-curved"></i>
                        </div>
                     </div>
                     <div class="col-10">
                        <h1 class="h3 mt-2">Squat Rack Beginner's Guide</h1>
                     </div>
                  </div>
                  <div class="row" style="height: 400px;">
                     <iframe class="rounded-3" width="100%" height="100%"
                        src="https://www.youtube.com/embed/q6TI60e7kWY"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                  </div>
               </div>
            </div>

            <div class="row ">

               <!-- 동영상3번 -->
               <div class="videoleft col-12 col-lg-6 mb-5">
                  <div class="row">
                     <div class="col-2">
                        <div
                           class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                           <i class="fa-sharp fa-solid fa-heart-pulse"></i>
                        </div>
                     </div>
                     <div class="col-10">
                        <h2 class="h3 mt-2">Bench Press Routine</h2>
                     </div>
                  </div>
                  <div class="row" style="height: 400px;">
                     <iframe class="rounded-3" width="100%" height="100%"
                        src="https://www.youtube.com/embed/FQy6mzpcBs0"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                  </div>
               </div>

               <!-- 동영상4번 -->
               <div class="videoright col-12 col-lg-6 mb-5">
                  <div class="row">
                     <div class="col-2">
                        <div
                           class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                           <i class="fa-solid fa-bolt"></i>
                        </div>
                     </div>
                     <div class="col-10">
                        <h2 class="h3 mt-2">Build A V-Tapered Back</h2>
                     </div>
                  </div>
                  <div class="row" style="height: 400px;">
                     <iframe class="rounded-3" width="100%" height="100%"
                        src="https://www.youtube.com/embed/O94yEoGXtBY"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                  </div>
               </div>


            </div>
         </div>
         <script>
                                 const option = {
                                    root: null, // viewport
                                    rootMargin: "0px",
                                    threshold: .5,  // 50%가 viewport에 들어와 있어야 callback 실행
                                 }

                                 const observer = new IntersectionObserver(entries => {
                                    entries.forEach(entry => {
                                       console.log(entry.isIntersecting);
                                       if (entry.isIntersecting) {
                                          entry.target.classList.add("active");
                                       } else {
                                          entry.target.classList.remove("active");
                                       }
                                    });
                                 }, option);

                                 const videoleft = document.querySelectorAll('.videoleft');
                                 const videoright = document.querySelectorAll('.videoright');


                                 // 반복문을 돌려 모든 DOM에 적용
                                 videoleft.forEach(el => observer.observe(el));
                                 videoright.forEach(el => observer.observe(el));

                              </script>
      </section>


      <!-- Testimonial section-->

      <div class="py-5 bg-light">
         <div class="container px-5 my-5">
            <div class="row gx-5 justify-content-center">
               <div class="col-lg-10 col-xl-7">
                  <div class="text-center">
                     <div class="fs-5 mb-4 fst-italic ">
                        "5000만 국민 건강을 위해 전문적인 프로그램과 <br>회원 간 정보 교환 및 최적의 상품 구매를 
                        <br>K-Health에서 제공해 드리며,<br> 고객 여러분께 최고의 서비스를 약속 드립니다."
                     </div>
                     <div class="d-flex align-items-center justify-content-center">
                        
                        <div class="fw-bold">
                           임근혁 <span class="fw-bold text-primary mx-1">/</span> 
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
                     <h2 class="fw-bolder">K-HEALTH 스태프 소개</h2>
                     <p class="lead fw-normal text-muted mb-5">최고의 코칭 스태프들이 여러분의 건강을
                        책임지겠습니다.</p>
                  </div>
               </div>
            </div>
            <div class="row gx-5">
               <div class="card1 col-lg-4 mb-5">
                  <div class="card h-100 shadow border-0">
                     <img class="card-img-top"
                        src="/image/p4.png" alt="..." />
                     <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">어깨
                           전문</div>
                        <a class="text-decoration-none link-dark stretched-link"
                           href="#!">
                           <h5 class="card-title mb-3">Dwayne Johnson</h5>
                        </a>
                        <p class="card-text mb-0">불균형한 어깨를 완벽하게 대칭으로 만들 수 있는 꿀팁!</p>
                     </div>
                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                           <div class="d-flex align-items-center">
                              
                              
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 mb-5">
                  <div class="card2 h-100 shadow border-0">
                     <img class="card-img-top"
                        src="/image/p2.png" alt="..." />
                     <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">하체
                           전문</div>
                        <a class="text-decoration-none link-dark stretched-link"
                           href="#!">
                           <h5 class="card-title mb-3">Agatha Collins</h5>
                        </a>
                        <p class="card-text mb-0">가장 효율적인 하체근육 키우는 법, 과학적인 효율적인
                           하체운동!</p>
                     </div>
                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                           <div class="d-flex align-items-center">
                              
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 mb-5">
                  <div class="card3 h-100 shadow border-0">
                     <img class="card-img-top"
                        src="/image/p3.png" alt="..." />
                     <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">등
                           전문</div>
                        <a class="text-decoration-none link-dark stretched-link"
                           href="#!">
                           <h5 class="card-title mb-3">Dorothy Bell</h5>
                        </a>
                        <p class="card-text mb-0">완벽한 뒤태를 만들기 위한 효과적인 등 운동!</p>
                     </div>
                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                           <div class="d-flex align-items-center">
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="row gx-5">
               <div class="col-lg-4 mb-5">
                  <div class="card4 h-100 shadow border-0">
                     <img class="card-img-top"
                        src="/image/p1.png" alt="..." />
                     <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">재활
                           전문</div>
                        <a class="text-decoration-none link-dark stretched-link"
                           href="#!">
                           <h5 class="card-title mb-3">Andrew Kim</h5>
                        </a>
                        <p class="card-text mb-0">부상을 방지를 위한 필수 운동습관!</p>
                     </div>
                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                           <div class="d-flex align-items-center">
                              
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 mb-5">
                  <div class="card4 h-100 shadow border-0">
                     <img class="card-img-top"
                        src="/image/p5.png" alt="..." />
                     <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">식단
                           전문</div>
                        <a class="text-decoration-none link-dark stretched-link"
                           href="#!">
                           <h5 class="card-title mb-3">Benjamin Barclay</h5>
                        </a>
                        <p class="card-text mb-0">다이어트 및 벌크업을 위한 고효율의 식단!</p>
                     </div>
                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                           <div class="d-flex align-items-center">
                              
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-lg-4 mb-5">
                  <div class="card4 h-100 shadow border-0">
                     <img class="card-img-top"
                        src="/image/p6.png" alt="..." />
                     <div class="card-body p-4">
                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">체력
                           전문</div>
                        <a class="text-decoration-none link-dark stretched-link"
                           href="#!">
                           <h5 class="card-title mb-3">DeMar DeRozan</h5>
                        </a>
                        <p class="card-text mb-0">일상에 필요한 기초 체력과 개인에 맞는 정확한 운동법!</p>
                     </div>
                     <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                        <div class="d-flex align-items-end justify-content-between">
                           <div class="d-flex align-items-center">
                              
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <script>
                                    const option2 = {
                                       root: null, // viewport
                                       rootMargin: "0px",
                                       threshold: .5,  // 50%가 viewport에 들어와 있어야 callback 실행
                                    }

                                    const observer2 = new IntersectionObserver(entries => {
                                       entries.forEach(entry => {
                                          console.log(entry.isIntersecting);
                                          if (entry.isIntersecting) {
                                             entry.target.classList.add("active");
                                          } else {
                                             entry.target.classList.remove("active");
                                          }
                                       });
                                    }, option2);

                                    const card1 = document.querySelectorAll('.card1');
                                    const card2 = document.querySelectorAll('.card2');
                                    const card3 = document.querySelectorAll('.card3');
                                    const card4 = document.querySelectorAll('.card4');


                                    // 반복문을 돌려 모든 DOM에 적용
                                    card1.forEach(el => observer.observe(el));
                                    card2.forEach(el => observer.observe(el));
                                    card3.forEach(el => observer.observe(el));
                                    card4.forEach(el => observer.observe(el));

                                 </script>








            <!-- 카카오지도 카카오지도-->
            <div class="scroll=container" id="indexcontact"></div>
            <section class="py-5 mt-5" id="features">
               <div class="container px-4 py-4 my-5 bg-light">
                  <div class="row gx-5">
                     <div class="col-lg-7 mb-5 mb-lg-0">
                        <div id="map" style="width: 100%; height: 400px;"></div>
                        <script>
                                                var container = document
                                                   .getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                                                var options = { //지도를 생성할 때 필요한 기본 옵션
                                                   center: new kakao.maps.LatLng(
                                                      37.5679067, 126.9830668), //지도의 중심좌표.
                                                   level: 3
                                                   //지도의 레벨(확대, 축소 정도)

                                                };
                                                var map = new kakao.maps.Map(container,
                                                   options); //지도 생성 및 객체 리턴
                                                var markerPosition = new kakao.maps.LatLng(
                                                   37.5679067, 126.9830668);
                                                var marker = new kakao.maps.Marker({
                                                   position: markerPosition
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
                              <p class="mb-0">서울특별시 중구 남대문로 120 대일빌딩 2F, 3F<br><br>
                              지하철 2호선 을지로입구역 3번출구 100M<br>1호선 종각역 4번, 5번 출구 200M
                           
                              </p>
                           </div>
                        </div>
                        <div class="row gx-5 row-cols-1 row-cols-md-1">
                           <div class="col mb-5 mb-md-0 mt-5">
                              <div
                                 class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
                                 <i class="bi bi-telephone"></i>
                              </div>
                              <h2 class="h5">전화 문의</h2>
                              <p class="mb-0">1544-9970 | 02-722-0858</p>
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
                     <div class="fs-3  text-white">이메일을 입력하시고 최신 정보를 받아보세요!</div>
                     <div class="text-white-50">K-Health의 특가정보를 보내드립니다.</div>
                  </div>
                  <div class="ms-xl-4">
                     <div class="input-group mb-2">
                        <input class="form-control" type="text"
                           placeholder="Email" aria-label="Email address..."
                           aria-describedby="button-newsletter" /><a href="/index.jsp"><button class="btn btn-outline-light " id="button-newsletter"
                           type="button" >제출</button></a>
                        
                     </div>
                     <div class="small text-white-50">개인정보는 안정하게, 데이터는 소중하게 보관합니다!</div>
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
                  class="text-white mx-1">&middot;</span> <img
                  src="/image/twitter.png" height="20px">

               <!-- Bootstrap core JS-->
               <script
                  src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
               <!-- Core theme JS-->
               <script src="js/scripts.js"></script>

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
</body>
<!-- 네이버 로그인 callback -->
<script type="text/javascript">
                        var naver_id_login = new naver_id_login("_5b0QUYbnHTk93odBRsA", "http://127.0.0.1/");
                        // 접근 토큰 값 출력
                        //alert(naver_id_login.oauthParams.access_token);
                        // 네이버 사용자 프로필 조회
                        naver_id_login.get_naver_userprofile("naverSignInCallback()");
                        // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
                        function naverSignInCallback() {
                           //alert(naver_id_login.getProfileData('name'));
                           //alert(naver_id_login.getProfileData('email'));
                           //alert(naver_id_login.getProfileData('nickname'));
                           //alert(naver_id_login.getProfileData('mobile'));
                        }
                     </script>
<script>
                        //@@@@@@@@TOP 스크롤 버튼스크립트
                        //Get the button
                        let mybutton = document.getElementById("btn-back-to-top");

                        // When the user scrolls down 20px from the top of the document, show the button
                        window.onscroll = function () {
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

                        $("#logout").on("click", function () {
                           location.href = "/logout.mem";
                        })
                        
                        function toseq70(){
                        	location.href = "/detail.market?cpage=1&product_seq=70"
                        }
                     </script>

</html>