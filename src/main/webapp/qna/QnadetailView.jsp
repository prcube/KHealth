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

<script>
	$(function(){
		$("#update,#delete").hide();
		console.log("${dto.qna_writer}")
		if("${dto.qna_writer}" == "${loginID}") {
			$("#update,#delete").show();
		}
	})

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
						<li class="nav-item"><a class="nav-link" href="/list.tips?cpage=1"">Tips</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/market/MarketDummy.jsp">Market</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/list.qna?cpage=1">Q&A</a></li>
						<li class="nav-item"><a class="nav-link" href="">Login</a></li>
					</ul>
				</div>
			</div>
		</nav>





		<!-- Page Content-->
		<form action="" id="detailFrm" method="post">
			<section class="py-5">
				<div class="container px-5 my-5">
					<div class="row gx-5">
						<div class="col-lg-3">
							<div class="d-flex align-items-center mt-lg-5 mb-4">
								<img class="img-fluid rounded-circle"
									src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
								<div class="ms-3">
									<input type=hidden value=${dto.qna_seq } style="display: none;"
										name=qna_seq> <input type=hidden
										value=${dto.qna_title } style="display: none;" name=qna_title>
									<input type=hidden value=${dto.qna_contents }
										style="display: none;" name=qna_contents>
									<div class="fw-bold">${dto.qna_writer }</div>
									<div class="text-muted">News, Business</div>
								</div>
							</div>
						</div>
						<div class="col-lg-9">
							<!-- Post content-->
							<article>
								<!-- Post header-->
								<header class="mb-4">
									<!-- Post title-->
									<div readonly id="qna_title">
										<h1 class="fw-bolder mb-1" id="title">"${dto.qna_title}"
										</h1>
									</div>
									<!-- Post meta content-->
									<div class="text-muted fst-italic mb-2">${dto.qna_write_date }</div>
									<!-- Post categories-->
									<button type="button" class="btn btn-secondary" id="back">목록으로</button>
									<button type="button" class="btn btn-secondary" id="delete"
										name="seq">삭제하기</button>
									<button type="button" class="btn btn-secondary" id="update">수정하기</button>
								</header>
								<!-- Preview image figure-->
								<figure class="mb-4">
									<img class="img-fluid rounded"
										src="https://dummyimage.com/900x400/ced4da/6c757d.jpg"
										alt="..." />
								</figure>
								<!-- Post content-->
								<section class="mb-5">
									<div readonly>
										<p class="fs-5 mb-4" id="qna_contents">${dto.qna_contents }
										</p>
									</div>




								</section>
							</article>







							<!-- Comments section-->

							
									


										<section>
											<div class="card bg-light">
												<div class="card-body">
													<c:forEach var="list" items="${list }">
														              <input type=hidden name="qnaCms_writer" value="${list.qnaCms_writer }">
															          <input type=hidden name="qnaCms_seq" value="${list.qnaCms_seq }">
															         <input type=hidden name="contentsComments" id="input_contentsComments">
													<div class="d-flex mb-4 mt-4">
														<!-- Parent comment-->
														<div class="flex-shrink-0">
															<img class="rounded-circle"
																src="https://dummyimage.com/50x50/ced4da/6c757d.jpg"
																alt="..." />
														</div>
														<div class="ms-3">
										
															<div class="fw-bold" class = "updComment">${list.qnaCms_writer } ${list.qnaCms_write_date }</div>
															<div class = QnaCmsArea  name = qnaCms_contents>${list.qnaCms_contents }</div> 
															<c:if test = "${loginID == list.qnaCms_writer }">
																<button type= button class = "deleteComments" qnaCms_seq=${list.qnaCms_seq }>삭제</button>
																<button type= button class = "modifyComments" id = "modifyComments">수정하기</button>
																
															</c:if>
														</div>
													</div>

												

													
										</c:forEach>



							<section>
								<div class="card bg-light">
									<div class="card-body">

										<div class="d-flex mb-4">
											<!-- Parent comment-->
											<div class="flex-shrink-0">
											
											</div>
											
										</div>
										<!-- Comment form-->
										<form class="mb">
											<textarea class="form-control" rows="3"
												placeholder="Join the discussion and leave a comment!"
												id=comments name=comments></textarea>
										</form>
										<br>
										<button type="button" class="btn btn-secondary"
											id="commentsbutton">작성하기</button>
									
										<!-- Comment with nested comments-->
		</form>





		</div>
		</div>
		</section>
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
	<script>
	
	
	
	$(".deleteComments").on("click",function(){
		let target = $(this).attr("qnaCms_seq");
		location.href = "/delete.comments?qnaCms_seq="+target;
	})
                    //댓글 수정하기
                  $(".modifyComments").on("click",function(){
                	  $(this).closest(".ms-3").find(".QnaCmsArea").attr("contenteditable","true");
                      console.log($(this).closest(".ms-3").find(".QnaCmsArea").html())
                      $(this).closest(".ms-3").find(".modifyComments").css("display", "none");
                      $(this).closest(".ms-3").find(".deleteComments").css("display", "none");


                     
                     let modifyCommentsOk = $("<button>");
                     modifyCommentsOk.html("수정완료");
                     modifyCommentsOk.on("click",function(){
                     $("#detailFrm").attr("action","/update.comments");
                     $("#input_contentsComments").val($(".QnaCmsArea").html());
                     $("#detailFrm").submit();
                     
                    let target = $(this).attr("qnaCms_seq");
             		location.href = "/update.comments?qnaCms_seq="+target;
                     })
         
                     let modifyCommentsCancel = $("<button>");
                     modifyCommentsCancel.attr("type","button");
                     modifyCommentsCancel.html("취소");
                     modifyCommentsCancel.on("click",function(){
                        location.reload();
                     })
                     
                $(this).before(modifyCommentsOk);
                $(this).before(modifyCommentsCancel);
                  })
                  
               

     
     
        $("#back").on("click",function(){
         history.back(); //뒤로가기기능이랑 동일.
         })
           $("#delete").on("click",function(){
              $("#detailFrm").attr("action","/delete.qna")
              $("#detailFrm").submit();
              //
           
           })
       $("#update").on("click", function() {
               location.href = "/gomodify.qna?qna_seq=${dto.qna_seq }"
            })
        
            $("#commentsbutton").on("click",function(){
            	$("#detailFrm").attr("action","/write.comments");
            	$("#detailFrm").submit();
            })
        
        </script>

</body>

</html>


<div class="container">

	<div class="form-group row">
		<div class="col-sm-10">
			<input type="text" readonly class="form-control-plaintext"
				id="header" value="">
		</div>


	</div>