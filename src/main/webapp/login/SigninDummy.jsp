<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>K-Health</title>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="/css/styles.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.6.1.js"> </script>
</head>

<body class="d-flex flex-column h-100">
  <main class="flex-shrink-0">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark position: fixed; top: 0px;">
      <div class="container px-5 " id="sticky-wrapper" class="sticky-wrapper">
        <a class="navbar-brand" href="/index.jsp"><img src="/image/khealth logo.png" height="100px"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
            class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="">Intro</a></li>
            <li class="nav-item"><a class="nav-link" href="">Contact</a></li>
            <li class="nav-item"><a class="nav-link" href="/list.tips">Tips</a></li>
            <li class="nav-item"><a class="nav-link" href="/market/MarketDummy.jsp">Market</a></li>
            <li class="nav-item"><a class="nav-link" href="/qna/QnaDummy.jsp">Q&A</a></li>
            <li class="nav-item"><a class="nav-link" href="">Login</a></li>
          </ul>
        </div>
      </div>
    </nav>


    
    <section class="h-100 h-custom gradient-custom-2">
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
              <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                <div class="card-body p-0">
                  <div class="row g-0">
                    <div class="col-lg-6">
                      <div class="p-5">
                        <h3 class="fw-normal mb-5" >General Infomation</h3>
      
                        
      
                        <div class="row">
                          <div class="col-md-6 mb-4 pb-2">
      
                            <div class="form-outline">
                              <input type="text" id="form3Examplev2" class="form-control form-control-lg" />
                              <label class="form-label" for="form3Examplev2">First name</label>
                            </div>
      
                          </div>
                          <div class="col-md-6 mb-4 pb-2">
      
                            <div class="form-outline">
                              <input type="text" id="form3Examplev3" class="form-control form-control-lg" />
                              <label class="form-label" for="form3Examplev3">Last name</label>
                            </div>
      
                          </div>
                        </div>
      
                        
      
                        <div class="mb-4 pb-2">
                          <div class="form-outline">
                            <input type="text" id="form3Examplev4" class="form-control form-control-lg" />
                            <label class="form-label" for="form3Examplev4">Position</label>
                          </div>
                        </div>
      
                        <div class="row">
                          <div class="col-md-6 mb-4 pb-2 mb-md-0 pb-md-0">
      
                            <div class="form-outline">
                              <input type="text" id="form3Examplev5" class="form-control form-control-lg" />
                              <label class="form-label" for="form3Examplev5">Bussines Arena</label>
                            </div>
      
                          </div>
                          <div class="col-md-6">
      
                           
      
                          </div>
                        </div>
      
                      </div>
                    </div>
                    <div class="col-lg-6 bg-indigo text-white bg-dark " style="border-radius: 0px 15px 15px 0px;"  >
                      <div class="p-5 " >
                        <h3 class="fw-normal mb-5 ">Contact Details</h3>
      
                        <div class="mb-4 pb-2">
                          <div class="form-outline form-white">
                            <input type="text" id="form3Examplea2" class="form-control form-control-lg" />
                            <label class="form-label" for="form3Examplea2">Street + Nr</label>
                          </div>
                        </div>
      
                        <div class="mb-4 pb-2">
                          <div class="form-outline form-white">
                            <input type="text" id="form3Examplea3" class="form-control form-control-lg" />
                            <label class="form-label" for="form3Examplea3">Additional Information</label>
                          </div>
                        </div>
      
                        <div class="row">
                          <div class="col-md-5 mb-4 pb-2">
      
                            <div class="form-outline form-white">
                              <input type="text" id="form3Examplea4" class="form-control form-control-lg" />
                              <label class="form-label" for="form3Examplea4">Zip Code</label>
                            </div>
      
                          </div>
                          <div class="col-md-7 mb-4 pb-2">
      
                            <div class="form-outline form-white">
                              <input type="text" id="form3Examplea5" class="form-control form-control-lg" />
                              <label class="form-label" for="form3Examplea5">Place</label>
                            </div>
      
                          </div>
                        </div>
      
                        <div class="mb-4 pb-2">
                          <div class="form-outline form-white">
                            <input type="text" id="form3Examplea6" class="form-control form-control-lg" />
                            <label class="form-label" for="form3Examplea6">Country</label>
                          </div>
                        </div>
      
                        <div class="row">
                          <div class="col-md-5 mb-4 pb-2">
      
                            <div class="form-outline form-white">
                              <input type="text" id="form3Examplea7" class="form-control form-control-lg" />
                              <label class="form-label" for="form3Examplea7">Code +</label>
                            </div>
      
                          </div>
                          <div class="col-md-7 mb-4 pb-2">
      
                            <div class="form-outline form-white">
                              <input type="text" id="form3Examplea8" class="form-control form-control-lg" />
                              <label class="form-label" for="form3Examplea8">Phone Number</label>
                            </div>
      
                          </div>
                        </div>
      
                        <div class="mb-4">
                          <div class="form-outline form-white">
                            <input type="text" id="form3Examplea9" class="form-control form-control-lg" />
                            <label class="form-label" for="form3Examplea9">Your Email</label>
                          </div>
                        </div>
      
                        <div class="form-check d-flex justify-content-start mb-4 pb-3">
                          <input class="form-check-input me-3" type="checkbox" value="" id="form2Example3c" />
                          <label class="form-check-label text-white" for="form2Example3">
                            I do accept the <a href="#!" class="text-white"><u>Terms and Conditions</u></a> of your
                            site.
                          </label>
                        </div>
      
                        <button type="button" class="btn btn-light btn-lg"
                          data-mdb-ripple-color="dark">Register</button>
      
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>


  <!-- Footer-->
  <footer class="bg-dark py-4 mt-auto ">
    <div class="container px-5 ">
      <div class="row align-items-center justify-content-between flex-column flex-sm-row ">
        <div class="text-center">
          <div class="small m-0 text-white">대표자 : 임근혁 | 담당자 : 윤성민 | 책임자 : 유한호 | 관리자 : 이진혁 | 개발자 : 이승택 | 총관리 : 권준구
          </div>
          <div class="small m-0 text-white"></div>
          <div class="small m-0 text-white">케이헬스 주식회사 (www.k-health.com) | 사업자등록번호 : 851-12-34567</div>
          <div class="small m-0 text-white">Copyright &copy; K-Health Corp. All rights reserved.</div>
          <div class="small m-0 text-white">서울특별시 중구 남대문로 120 대일빌딩 3층</div>

          <img src="/image/instagram.png" height="20px">
          <span class="text-white mx-1">&middot;</span>
          <img src="/image/facebook.png" height="20px">
          <span class="text-white mx-1">&middot;</span>
          <img src="/image/youtube.png" height="20px">
          <span class="/image/text-white mx-1">&middot;</span>
          <img src="/image/twitter.png" height="20px">
        </div>
      </div>
    </div>
  </footer>
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="/js/scripts.js"></script>

</body>

</html>