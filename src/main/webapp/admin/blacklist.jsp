<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.1.js">
	
</script>
</head>
<body>

	<table class="table align-middle mb-0 bg-white">
		<thead class="bg-light">
			<tr>
				<th>번호</th>
				<th>닉네임</th>
				<th>등록일시</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${list }">
				<tr>
					<td>${i.blacklist_seq }</td>
					<td>${i.blacklist_member_nickname }</td>
					<td>${i.blacklist_date }</td>
					<td><button type="button" class="removeBlacklistBtn" removeBlacklist_seq="${i.blacklist_seq }">블랙리스트 해제</button></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	
	<br><br><br><br>
	<form action="/blacklist.admin" method="post">

		<div>
			<input type="text" placeholder="차단 대상 별명 입력" name="member_nickname">
			<button id="addBlacklistBtn">블랙리스트 등록</button>
		</div>
	</form>

	<script>
		$(".removeBlacklistBtn").on("click",function(){
			
			let reallyremove = confirm("정말로 블랙리스트에서 제거하시겠습니까?");
			
			if(reallyremove){
				let target = $(this).attr("removeBlacklist_seq");
				location.href = "/removeblacklist.admin?removeBlacklist_seq="+target+"";
			}
		})	
	</script>
</body>
</html>