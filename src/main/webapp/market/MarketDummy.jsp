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
						<li class="nav-item"><a class="nav-link" href="/list.tips?cpage=1">Tips</a></li>
						<li class="nav-item"><a class="nav-link" href="">Market</a></li>
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
               <input type="button" id="logout" style="WIDTH: 60pt; HEIGHT: 20pt"
                  value="로그아웃">
            </c:when>
            <c:when test="${loginID == null}">
               <!-- 로그인을 한 사용자 -->
               <a style="color: white"></a>
            </c:when>
         </c:choose>
      </nav>


      <!-- 상품페이지-->
      <section class="py-5">
         <div class="container px-5 my-5">

            <div class="row gx-5 justify-content-center">
               <div class="col-lg-8 col-xl-6">
                  <div class="text-center">
                     <h2 class="fw-bolder">From our blog</h2>
                     <p class="lead fw-normal text-muted mb-5">Lorem ipsum, dolor
                        sit amet consectetur adipisicing elit. Eaque fugit ratione dicta
                        mollitia. Officiis ad.</p>
                  </div>
               </div>
            </div>
         </div>
         <div
            class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-3 px-5 justify-content-center">
            <c:choose>

               <c:when test="${not empty list}">
                  <c:forEach var="i" items="${list }">

                     <div class="col mb-5 ">
                        <div class="card h-100 shadow border-0 row-cols-xs-3">
                           <!-- Product image-->
                           <img class="card-img-top"
                              src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                              alt="..." />
                           <!-- Product details-->
                           <div class="card-body p-4">
                              <div class="text-center">
                                 <!-- Product name-->
                                 <h5 class="fw-bolder">${i.product_name }</h5>
                                 <!-- Product price-->
                                 ${i.product_price }
                              </div>
                           </div>
                           <!-- Product actions-->
                           <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                              <div class="text-center">
                                 <a class="btn btn-outline-dark mt-auto"
                                    href="/product/ProductView.jsp">View options</a>
                              </div>
                           </div>
                        </div>
                        </div>
                  </c:forEach>
               </c:when>
               <c:otherwise>
                  <div>출력할 내용이 없습니다.</div>
               </c:otherwise>
            </c:choose>
         </div>
         <div class="navi" style="text-align: center;">${navi}</div>



			<!--                <div class="col mb-5"> -->
         <!--                   <div class="card h-100 shadow border-0"> -->
         <!--                      Sale badge -->
         <!--                      <div class="badge bg-dark text-white position-absolute" -->
         <!--                         style="top: 0.5rem; right: 0.5rem">Sale</div> -->
         <!--                      Product image -->
         <!--                      <img class="card-img-top" -->
         <!--                         src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
         <!--                      Product details -->
         <!--                      <div class="card-body p-4"> -->
         <!--                         <div class="text-center"> -->
         <!--                            Product name -->
         <!--                            <h5 class="fw-bolder">Special Item</h5> -->
         <!--                            Product reviews -->
         <!--                            <div -->
         <!--                               class="d-flex justify-content-center small text-warning mb-2"> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                            </div> -->
         <!--                            Product price -->
         <!--                            <span class="text-muted text-decoration-line-through">$20.00</span> -->
         <!--                            $18.00 -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                      Product actions -->
         <!--                      <div class="card-footer p-4 pt-0 border-top-0 bg-transparent"> -->
         <!--                         <div class="text-center"> -->
         <!--                            <a class="btn btn-outline-dark mt-auto" href="#">Add to -->
         <!--                               cart</a> -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                   </div> -->
         <!--                </div> -->

         <!--                <div class="col mb-5"> -->
         <!--                   <div class="card h-100 shadow border-0"> -->
         <!--                      Sale badge -->
         <!--                      <div class="badge bg-dark text-white position-absolute" -->
         <!--                         style="top: 0.5rem; right: 0.5rem">Sale</div> -->
         <!--                      Product image -->
         <!--                      <img class="card-img-top" -->
         <!--                         src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
         <!--                      Product details -->
         <!--                      <div class="card-body p-4"> -->
         <!--                         <div class="text-center"> -->
         <!--                            Product name -->
         <!--                            <h5 class="fw-bolder">Sale Item</h5> -->
         <!--                            Product price -->
         <!--                            <span class="text-muted text-decoration-line-through">$50.00</span> -->
         <!--                            $25.00 -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                      Product actions -->
         <!--                      <div class="card-footer p-4 pt-0 border-top-0 bg-transparent"> -->
         <!--                         <div class="text-center"> -->
         <!--                            <a class="btn btn-outline-dark mt-auto" href="#">Add to -->
         <!--                               cart</a> -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                   </div> -->
         <!--                </div> -->
         <!--                <div class="col mb-5"> -->
         <!--                   <div class="card h-100 shadow border-0"> -->
         <!--                      Product image -->
         <!--                      <img class="card-img-top" -->
         <!--                         src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
         <!--                      Product details -->
         <!--                      <div class="card-body p-4"> -->
         <!--                         <div class="text-center"> -->
         <!--                            Product name -->
         <!--                            <h5 class="fw-bolder">Popular Item</h5> -->
         <!--                            Product reviews -->
         <!--                            <div -->
         <!--                               class="d-flex justify-content-center small text-warning mb-2"> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                            </div> -->
         <!--                            Product price -->
         <!--                            $40.00 -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                      Product actions -->
         <!--                      <div class="card-footer p-4 pt-0 border-top-0 bg-transparent"> -->
         <!--                         <div class="text-center"> -->
         <!--                            <a class="btn btn-outline-dark mt-auto" href="#">Add to -->
         <!--                               cart</a> -->

         <!--                         </div> -->
         <!--                      </div> -->
         <!--                   </div> -->
         <!--                </div> -->

         <!--                <div class="col mb-5"> -->
         <!--                   <div class="card h-100 shadow border-0"> -->
         <!--                      Sale badge -->
         <!--                      <div class="badge bg-dark text-white position-absolute" -->
         <!--                         style="top: 0.5rem; right: 0.5rem">Sale</div> -->
         <!--                      Product image -->
         <!--                      <img class="card-img-top" -->
         <!--                         src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
         <!--                      Product details -->
         <!--                      <div class="card-body p-4"> -->
         <!--                         <div class="text-center"> -->
         <!--                            Product name -->
         <!--                            <h5 class="fw-bolder">Sale Item</h5> -->
         <!--                            Product price -->
         <!--                            <span class="text-muted text-decoration-line-through">$50.00</span> -->
         <!--                            $25.00 -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                      Product actions -->
         <!--                      <div class="card-footer p-4 pt-0 border-top-0 bg-transparent"> -->
         <!--                         <div class="text-center"> -->
         <!--                            <a class="btn btn-outline-dark mt-auto" href="#">Add to -->
         <!--                               cart</a> -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                   </div> -->
         <!--                </div> -->
         <!--                <div class="col mb-5"> -->
         <!--                   <div class="card h-100 shadow border-0"> -->
         <!--                      Product image -->
         <!--                      <img class="card-img-top" -->
         <!--                         src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
         <!--                      Product details -->
         <!--                      <div class="card-body p-4"> -->
         <!--                         <div class="text-center"> -->
         <!--                            Product name -->
         <!--                            <h5 class="fw-bolder">Fancy Product</h5> -->
         <!--                            Product price -->
         <!--                            $120.00 - $280.00 -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                      Product actions -->
         <!--                      <div class="card-footer p-4 pt-0 border-top-0 bg-transparent"> -->
         <!--                         <div class="text-center"> -->
         <!--                            <a class="btn btn-outline-dark mt-auto" href="#">View -->
         <!--                               options</a> -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                   </div> -->
         <!--                </div> -->
         <!--                <div class="col mb-5"> -->
         <!--                   <div class="card h-100 shadow border-0"> -->
         <!--                      Sale badge -->
         <!--                      <div class="badge bg-dark text-white position-absolute" -->
         <!--                         style="top: 0.5rem; right: 0.5rem">Sale</div> -->
         <!--                      Product image -->
         <!--                      <img class="card-img-top" -->
         <!--                         src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
         <!--                      Product details -->
         <!--                      <div class="card-body p-4"> -->
         <!--                         <div class="text-center"> -->
         <!--                            Product name -->
         <!--                            <h5 class="fw-bolder">Special Item</h5> -->
         <!--                            Product reviews -->
         <!--                            <div -->
         <!--                               class="d-flex justify-content-center small text-warning mb-2"> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                            </div> -->
         <!--                            Product price -->
         <!--                            <span class="text-muted text-decoration-line-through">$20.00</span> -->
         <!--                            $18.00 -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                      Product actions -->
         <!--                      <div class="card-footer p-4 pt-0 border-top-0 bg-transparent"> -->
         <!--                         <div class="text-center"> -->
         <!--                            <a class="btn btn-outline-dark mt-auto" href="#">Add to -->
         <!--                               cart</a> -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                   </div> -->
         <!--                </div> -->
         <!--                <div class="col mb-5"> -->
         <!--                   <div class="card h-100 shadow border-0"> -->
         <!--                      Product image -->
         <!--                      <img class="card-img-top" -->
         <!--                         src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
         <!--                      Product details -->
         <!--                      <div class="card-body p-4"> -->
         <!--                         <div class="text-center"> -->
         <!--                            Product name -->
         <!--                            <h5 class="fw-bolder">Popular Item</h5> -->
         <!--                            Product reviews -->
         <!--                            <div -->
         <!--                               class="d-flex justify-content-center small text-warning mb-2"> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                               <div class="bi-star-fill"></div> -->
         <!--                            </div> -->
         <!--                            Product price -->
         <!--                            $40.00 -->
         <!--                         </div> -->
         <!--                      </div> -->
         <!--                      Product actions -->
         <!--                      <div class="card-footer p-4 pt-0 border-top-0 bg-transparent"> -->
         <!--                         <div class="text-center"> -->
         <!--                            <a class="btn btn-outline-dark mt-auto" href="#">Add to -->
         <!--                               cart</a> -->

         <!--                         </div> -->
         <!--                      </div> -->
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

</body>
</html>