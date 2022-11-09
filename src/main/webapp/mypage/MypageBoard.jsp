<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <style>
    /* body {
      background: -webkit-linear-gradient(left, #3931af, #00c6ff);
    } */


    .emp-profile {
      border: 2px solid #212529;
      padding: 3%;
      margin-top: 3%;
      margin-bottom: 3%;
      border-radius: 0.5rem;
      background: #fff;
    }

    .profile-img {
      text-align: center;
    }

    .profile-img img {
      width: 70%;
      height: 100%;
    }

    .profile-img .file {
      position: relative;
      overflow: hidden;
      margin-top: -20%;
      width: 70%;
      border: none;
      border-radius: 0;
      font-size: 15px;
      background: #212529b8;
    }

    .profile-img .file input {
      position: absolute;
      opacity: 0;
      right: 0;
      top: 0;
    }

    .profile-head h5 {
      color: #333;
    }

    .profile-head h6 {
      color: #0062cc;
    }

    .profile-edit-btn {
      border: none;
      border-radius: 1.5rem;
      width: 70%;
      padding: 2%;
      font-weight: 600;
      color: #6c757d;
      cursor: pointer;
    }

    .proile-rating {
      font-size: 12px;
      color: #818182;
      margin-top: 5%;
    }

    .proile-rating span {
      color: #495057;
      font-size: 15px;
      font-weight: 600;
    }

    .profile-head .nav-tabs {
      margin-bottom: 5%;
    }

    .profile-head .nav-tabs .nav-link {
      font-weight: 600;
      border: none;
    }

    .profile-head .nav-tabs .nav-link.active {
      border: none;
      border-bottom: 2px solid #0062cc;
    }

    .profile-work {
      padding: 14%;
      margin-top: -15%;
    }

    .profile-work p {
      font-size: 12px;
      color: #818182;
      font-weight: 600;
      margin-top: 10%;
    }

    .profile-work a {
      text-decoration: none;
      color: #495057;
      font-weight: 600;
      font-size: 14px;
    }

    .profile-work ul {
      list-style: none;
    }

    .profile-tab label {
      font-weight: 600;
    }

    .profile-tab p {
      font-weight: 600;
      color: #0062cc;
    }
  </style>
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
            <li class="nav-item"><a class="nav-link" href="/tips/TipsDummy.jsp">Tips</a></li>
            <li class="nav-item"><a class="nav-link" href="/market/MarketDummy.jsp">Market</a></li>
            <li class="nav-item"><a class="nav-link" href="/qna/QnaDummy.jsp">Q&A</a></li>
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

    
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <div class="container emp-profile ">
      <form method="post">
        <div class="row">
          <div class="col-md-3">
            <div class="profile-img">
              아마도 사진?
            </div>
          </div>
          <div class="col-md-7">
            <div class="profile-head">
              <h5>
                콘스탄틴프로탄틴asa // 작성한 글 부분입니다.
              </h5>
              <h6>
                kh1234@naver.com
              </h6>
              <p class="proile-rating">Member : <span>Gold</span></p>
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                    aria-controls="home" aria-selected="true">About</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-md-2">
            <!-- <input type="submit" class="profile-edit-btn" name="btnAddMore" value="Edit Profile" /> -->
          </div>
        </div>
        <div class="row">
          <div class="col-md-3">
            <div class="profile-work">
              <p>My Page</p>
              <a href="/mypage/MypageDummy.jsp">프로필 정보</a><br />
              <a href="/mypage/MypageUpdate.jsp">프로필 수정</a><br />
              <a href="/mypage/MypageBoard.jsp">작성한 글</a><br />
              <a href="/mypage/MypageComment.jsp">작성한 댓글</a><br />
              <p>Order</p>
              <a href="/mypage/MypageOrderlist.jsp">구매 내역</a><br/>
              
            </div>
          </div>
          <div class="col-md-9">
            <div class="tab-content profile-tab" id="myTabContent">
              <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <div class="row">
                  <div class="col-md-3">
                    <label>User Id</label>
                  </div>
                  <div class="col-md-9">
                    <p>콘스탄틴프로탄틴</p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-3">
                    <label>Name</label>
                  </div>
                  <div class="col-md-9">
                    <p>윤성민</p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-3">
                    <label>Email</label>
                  </div>
                  <div class="col-md-9">
                    <p>kh1234@naver.com</p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-3">
                    <label>Phone</label>
                  </div>
                  <div class="col-md-9">
                    <p>010-1234-1234</p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-3">
                    <label>Address</label>
                  </div>
                  <div class="col-md-9">
                    <p>서울특별시 졸리구 피곤하동 KH아파트 123동 1202호</p>
                  </div>
                </div>
              </div>
              
            </div>
          </div>
        </div>
      </form>
    </div>





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