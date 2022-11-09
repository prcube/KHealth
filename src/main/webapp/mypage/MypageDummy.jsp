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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
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

.mypageBtn {
	background-color: transparent;
	border: none;
}

#imform {
	display: none;
}
</style>

<script>
	$(function(){
		if(${member_role}){
			let adminBtn = $("#btnArea").append("<button>");
			adminBtn.attr("type", "button");
			adminBtn.text("관리자 페이지로 이동");
			
			adminBtn.on("click",function(){
				location.href="/admin/admindummy.jsp";
			})
		}
	});
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
						<li class="nav-item"><a class="nav-link"
							href="/tips/TipsDummy.jsp">Tips</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/market/MarketDummy.jsp">Market</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/qna/QnaDummy.jsp">Q&A</a></li>
						<li class="nav-item"><a class="nav-link" href="">Login</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<link
			href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
			rel="stylesheet" id="bootstrap-css">
		<script
			src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script
			src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!------ Include the above in your HEAD tag ---------->


		<div class="container emp-profile">
			<form acition="" method="post" id="mypageFrm">
				<div class="row">
					<div class="col-md-3">
						<div class="profile-img">${dto.nickname }</div>
					</div>

					<div class="col-md-7">
						<div class="profile-head">
							<h5>${dto.name }</h5>
							<p class="proile-rating">
								Member : <span>Gold</span>
							</p>
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href='#' onclick="aboutTab()" role="tab"
									aria-controls="home" aria-selected="true">About</a></li>

								<li class="nav-item"><a class="nav-link active"
									id="board-tab" data-toggle="tab" href='#' onclick="boardTab()"
									role="tab" aria-controls="home" aria-selected="true">Board</a></li>

								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href='#' onclick="commentsTab()" role="tab"
									aria-controls="home" aria-selected="true">Comments</a></li>

								<li class="nav-item"><a class="nav-link active"
									id="orderlist-tab" data-toggle="tab" href='#'
									onclick="orderlistTab()" role="tab" aria-controls="home"
									aria-selected="true">Orderlist</a></li>
							</ul>
							
							<div id="mypageComments">
							    <table id="tableMypage" style="border: 1px solid black; display: none;">
							        <tr>
							            <td>번호</td>
							            <td>제목</td>
							            <td>내용</td>
							            <td>작성자</td>
							            <td>작성날짜</td>
							        </tr>
							    </table>
							</div>
							
							<script>
							    function commentsTab() {
							        $("#information").css("display", "none")
							        $("#tableMypage").css("display", "block")
							        $.ajax({
							            url: "/mypageComments.ajax?cpage=1",
							            dataType: "json"
							        }).done(function (resp) {
							            console.log(resp);
							            console.log(JSON.parse(resp.list)[0]);
							            let target = JSON.parse(resp.list);
							            console.log(target[0].qnaCms_writer);
							
							            for (let i = 0; i < target.length; i++) {
							                let tr = $("<tr>");
							
							                let tdSeq = $("<td>");
							                tdSeq.append(target[i].qnaCms_seq);
							
							                let tdTitle = $("<td>");
							                tdTitle.append(target[i].qnaCms_parent_seq);
							
							                let tdContents = $("<td>");
							                tdContents.append(target[i].qnaCms_contents);
							
							                let tdWriter = $("<td>");
							                tdWriter.append(target[i].qnaCms_writer);
							
							                let tdDate = $("<td>");
							                tdDate.append(target[i].qnaCms_write_date);
							
							                tr.append(tdSeq);
							                tr.append(tdTitle);
							                tr.append(tdContents);
							                tr.append(tdWriter);
							                tr.append(tdDate);
							                $("table").append(tr);
							            }
							        })
							
							    }
							
							</script>

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
							<button class="mypageBtn" id="mypageInformation" type=button>프로필
								정보</button>
							<br />
							<button class="mypageBtn" id="modifyBtn" type=button>프로필
								수정</button>
							<br />
							<button class="mypageBtn" id="aa" type=button>작성한 글</button>
							<br />
							<button class="mypageBtn" id="bb" type=button>작성한 댓글</button>
							<br />
							<p>Order</p>
							<button class="mypageBtn" id="cc" type=button>구매 내역</button>
							<br />
						</div>
					</div>

					<script>
						$("#mypageInformation").on("click",function(){
							location.href = "/mypage.mem"
						})
						$("#aa").on("click",function(){
							location.href = "/mypage/MypageBoard.jsp"
						})
						$("#bb").on("click",function(){
							location.href = "/mypage/MypageComment.jsp"
						})
						$("#cc").on("click",function(){
							location.href = "/mypage/MypageOrderlist.jsp"
						})
						
					</script>


					<div class="col-md-9" id="information">
						<div class="tab-content profile-tab" id="myTabContent">
							<div class="tab-pane fade show active" id="home" role="tabpanel"
								aria-labelledby="home-tab">
							
								<input type=hidden id="input_modify_nickname" name="modify_nickname">
								<input type=hidden id="input_modify_mail" name="modify_mail">
								<input type=hidden id="input_modify_number" name="modify_number">
								<input type=hidden id="input_modify_address1" name="modify_address1">
								
								<div class="row">
									<div class="col-md-3">
										<label>Name</label>
									</div>
									<div class="col-md-9">
										<p>${dto.name }</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<label>User NickName</label>
									</div>
									<div class="col-md-9">
										<p class="modify" id="modify_nickname">${dto.nickname }</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<label>Email</label>
									</div>
									<div class="col-md-9">
										<p class="modify" id="modify_mail">${dto.mail }</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<label>Phone</label>
									</div>
									<div class="col-md-9">
										<p class="modify" id="modify_number">${dto.number }</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<label>Address</label>
									</div>
									<div class="col-md-9">
										<p class="modify" id="modify_address1">${dto.address1 }</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<label>Join Date</label>
									</div>
									<div class="col-md-9">
										<p>${dto.launch_date }</p>
									</div>
			</form>
		</div>
		<div id=btnArea></div>
		</div>
		</div>
		<script>
			//mypage 수정
			let modifyOk = $("<button>");
				modifyOk.html("수정완료");

			let modifyCancel = $("<button>");
				modifyCancel.attr("type", "button");
				modifyCancel.text("취소");
				modifyCancel.addClass("btn");

			$("#modifyBtn").on("click", function() {
				$(".modify").attr("contenteditable", "true");

				$("#btnArea").append(modifyOk);
				$("#btnArea").append(modifyCancel);
			})

			modifyOk.on("click", function() {
				$("#mypageFrm").attr("action", "/update.mem")
				$("#input_modify_nickname").val($("#modify_nickname").text());
				$("#input_modify_mail").val($("#modify_mail").text());
				$("#input_modify_number").val($("#modify_number").text());
				$("#input_modify_address1").val($("#modify_address1").text());
				console.log($("#input_modify_nickname").val())
				$("#mypageFrm").submit();
			})
			modifyCancel.on("click", function() {
				location.reload();
			});
		</script>


		</div>
		</div>

		</div>






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