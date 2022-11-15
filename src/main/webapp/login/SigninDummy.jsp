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
<script src="https://code.jquery.com/jquery-3.6.1.js"> </script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
body {
	min-height: 100vh;
	/*  background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
      to(#1d466c));
   background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
   background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
   background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
   background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);  */
	background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.2)),
		url("/image/signinbg.jpg");
	background-size: cover;
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15;
}

table {
	border: 1px solid black;
	width: auto;
	height: auto;
	margin: auto;

	/* text-align: center; */
}
</style>


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
				<c:choose>
					<c:when test="${loginID != null}">
						<!-- 로그인을 한 사용자 -->
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
								<li class="nav-item"><a class="nav-link" href="/index.jsp">Home</a></li>
								<li class="nav-item"><a class="nav-link"href="/contact/contact.jsp">About us</a></li>
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
<!-- 										<li><a class="dropdown-item" style="color: white;" -->
<!-- 											href="#">뭐 넣지</a></li> -->
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
								<li class="nav-item"><a class="nav-link"href="/contact/contact.jsp">About us</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/list.tips?cpage=1">Tips</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/list.market?cpage=1">Market</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/list.qna?cpage=1">Q&A</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/login/LoginDummy.jsp">Login</a></li>
								<li class="nav-item"><a class="nav-link"
									href="">Signin</a></li>
								<li></li>
							</ul>
						</div>
					</c:when>
				</c:choose>
				</div>
		</nav>



		<div class="container">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">
					<h4 class="mb-3">회원가입</h4>
					<form action="complete.mem" class="validation-form" novalidate
						method="post">


						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="id">아이디</label> <input type="text"
									class="form-control" id="id" name="ID" value="" required>
								<span id=result2></span>
								<div class="invalid-feedback">아이디를 입력해 주세요.</div>

							</div>
							<div class="col-2 mt-4">
								<!-- 								<button type="button" id="check"
									class=" btn btn-secondary btn-sm btn-block pull-right "
									style="float: left;">중복확인</button> -->
								<div id="result"></div>

							</div>

						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="passwd">패스워드</label> <input type="password"
									class="form-control" id="passwd" name="passwd" placeholder=""
									value="" required>
								<div class="invalid-feedback">패스워드를 입력해주세요.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="passck">패스워드 확인</label> <input type="password"
									class="form-control" id="passwdck" name="passwdck"
									placeholder="" value="" required>
								<div id="div3"></div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="namee">이름</label> <input type="text"
									class="form-control" id="nama" name="nama" value="" required>
								<div class="invalid-feedback">이름을 입력해주세요.</div>
								<div id="div9"></div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="nickname">별명</label> <input type="text"
									class="form-control" id="nickname" name="nickname"
									placeholder="" value="" required> <span id=result3></span>
							</div>
							<div class="col-2 mt-4">


								<div class="invalid-feedback">별명을 입력해주세요.</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="email">이메일</label> <input type="email"
								class="form-control" id="mail" name="mail"
								placeholder="you@example.com" required>
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
							<div id="div7"></div>
						</div>

						<div class="mb-3">
							<label for="phone">휴대폰 번호 (하이픈 "-" 제외)</label> <input type="text"
								class="form-control" id="number" name="number" value="" required>
							<div class="invalid-feedback">휴대폰 번호를 입력해주세요.</div>
							<div id="div6"></div>
						</div>




						<div class="row">
							<div class="col-6 mb-3">
								<label for="zipcode ">우편번호</label> <input type="text"
									class="form-control " id="zipcode" name="zipcode"
									placeholder="" value="" required>

							</div>
							<div class="col-2 mt-4">
								<input type="button" value="찾기" id="btnsearch"
									class="btn btn-secondary btn-sm btn-block float-left">
								<div class="invalid-feedback">우편번호를 입력해주세요.</div>
							</div>
						</div>


						<div class="mb-3">
							<label for="address">주소</label> <input type="text"
								class="form-control" id="address1" name="address1" required>
							<div class="invalid-feedback">주소를 입력해주세요.</div>
						</div>

						<div class="mb-3">
							<label for="address2">상세주소</label> <input type="text"
								class="form-control" id="address2" name="address2" value=""
								required>
							<div class="invalid-feedback">상세주소를 입력해주세요.</div>
						</div>


						<hr class="mb-4">
						<div class="mb-4"></div>
						<button class="btn btn-secondary btn-lg-2 btn-block" type="submit">가입
						</button>
					</form>
				</div>
			</div>
		</div>

		<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    
    
    document.getElementById("btnsearch").onclick = function() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  document.getElementById('zipcode').value = data.zonecode;
                  document.getElementById("address1").value = data.jibunAddress;
                  // 도로명주소
                  document.getElementById("address2").focus();

               }
            }).open();
   }

/*     check.onclick = function() {

    let regi = document.getElementById("ID").value;
    let regex = /^[a-z0-9]{6,12}$/;
    let answer = regex.test(regi);

    if (answer) {
    alert("사용 가능한  ID 입니다.")
    } else {
    alert("아이디를 확인해 주세요.")
    }
    }   */
    
	 document.getElementById("id").onkeyup = function() {
		let id = document.getElementById("id").value;
		let regExp = /^[a-z]+[a-z0-9]{5,19}$/g;
	    let answer = regExp.test(id); 

		$.ajax({
			url:"duplCheck.mem",
			data:{"id":id}
		}).done(function(resp){
			console.log(resp);
			if(resp == "true"){
				
				$("#result2").html("이미 사용중인 아이디 입니다.");
				$("#result2").css("color","red")
			}else{
				if(answer){
				$("#result2").html("사용 가능한 아이디 입니다.");
				$("#result2").css("color","green")
				}
			      else {
			          document.getElementById("result2").innerHTML = "아이디를 확인해 주세요.";
			          $("#result2").css("color","red")
			       }
			}
		});   
    }
    
	 document.getElementById("nickname").onkeyup = function() {
			let nick = document.getElementById("nickname").value;
			let regExp = /^[가-힣]{2,8}$/g;
		    let answer = regExp.test(nick); 

			$.ajax({
				url:"nickCheck.mem",
				data:{"nickname":nick}
			}).done(function(resp){
				console.log(resp);
				if(resp == "true"){
					$("#result3").html("이미 사용중인 닉네임 입니다.");
					$("#result3").css("color","red")
				}else{
					if(answer){
					$("#result3").html("사용 가능한 닉네임 입니다.");
					$("#result3").css("color","green")
					}
				      else {
				          document.getElementById("result3").innerHTML = "닉네임을 확인해 주세요.";
				          $("#result3").css("color","red")
				       }
				}
			});   
	    }
    
/*     check2.onclick = function() {
      let regi = document.getElementById("nickname").value;
      let regex = /^[가-힣]{2,8}$/;
      let answer = regex.test(regi);

        if (answer) {
        alert("사용 가능한 닉네임 입니다.")
        } else {
        alert("닉네임을 확인해 주세요.")
        }
        } 
 */
      
      /* window.open("duplCheck.mem?ID=" + ID, "",
            "width=400,height=300"); */

   passwdck.onkeyup = function() {
      let passwd = document.getElementById("passwd").value;
      let passck = document.getElementById("passwdck").value;
      let regex2 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
      let answer1 = regex2.test(passwd);
      let answer2 = regex2.test(passck);
      console.log(answer2)
		if  (answer2.length <= 8 || answer2.length >= 20 ){
         document.getElementById("div3").innerHTML = "비밀번호는 영문 및 특수문자 숫자 포함, 8자 이상 20자 이하로 작성해주세요. ";
         $("#div3").css("color","red")
		}
       	if (answer2 == true && answer1 == true && (passwd.length == passck.length)) {
            document.getElementById("div3").innerHTML = "사용 가능한 패스워드 입니다.";
            $("#div3").css("color","green")
         }else if (passck.length != passwd.length){
             document.getElementById("div3").innerHTML = "비밀번호는 영문 및 특수문자 숫자 포함, 8자 이상 20자 이하로 작성해주세요. ";
             $("#div3").css("color","red")
         }
      }    
            
            passwd.onkeyup = function() {
            	console.log(123)
                let passwd = document.getElementById("passwd").value;
                let passck = document.getElementById("passwdck").value;
                let regex2 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
                let answer1 = regex2.test(passwd);
                let answer2 = regex2.test(passck);
                console.log(answer2)
          		if  (answer2.length <= 8 || answer2.length >= 20 ){
                   document.getElementById("div3").innerHTML = "비밀번호는 영문 및 특수문자 숫자 포함, 8자 이상 20자 이하로 작성해주세요. ";
                   $("#div3").css("color","red")
          		}
                 	if (answer2 == true && answer1 == true && (passwd.length == passck.length)) {
                      document.getElementById("div3").innerHTML = "사용 가능한 패스워드 입니다.";
                      $("#div3").css("color","green")
                   }else if (passck.length != passwd.length){
                       document.getElementById("div3").innerHTML = "비밀번호는 영문 및 특수문자 숫자 포함, 8자 이상 20자 이하로 작성해주세요. ";
                       $("#div3").css("color","red")
                   }
                }  
      

   nama.onkeyup = function() {
      let regi3 = document.getElementById("nama").value;
      let regex3 = /^[가-힣]{3,5}$/;
      let answer3 = regex3.test(regi3);
      if (answer3) {
         document.getElementById("div9").innerHTML = "";
      } else {
         document.getElementById("div9").innerHTML = "이름을 확인해 주세요.";
         $("#div9").css("color","red")

      }
   }

   number.onkeyup = function() {
      let regi4 = document.getElementById("number").value;
      let regex4 = /^01\d\d{3,4}\d{4}$/;
      let answer4 = regex4.test(regi4);
      if (answer4) {
         document.getElementById("div6").innerHTML = "";
      } else {
         document.getElementById("div6").innerHTML = "번호를 확인해 주세요.";
         $("#div6").css("color","red")
      }
   }

   mail.onkeyup = function() {
      let regi5 = document.getElementById("mail").value;
      let regex5 = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
      let answer5 = regex5.test(regi5); 
      if (answer5) {
         document.getElementById("div7").innerHTML = "";
      } else {
         document.getElementById("div7").innerHTML = "메일 주소를 확인해 주세요.";
         $("#div7").css("color","red")
      }
   }
   
   
  </script>
		<br> <br> <br> <br>
</main>
		<!-- Footer-->
		<footer class="bg-dark py-4 mt-auto ">
			<div class="container px-5 ">
				<div
					class="row align-items-center justify-content-between flex-column flex-sm-row ">
					<div class="text-center">
						<div class="small m-0 text-white">대표자 : 임근혁 | 담당자 : 윤성민 |
							책임자 : 유한호 | 관리자 : 이진혁 | 개발자 : 이승택 | 총관리 : 권준구</div>
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