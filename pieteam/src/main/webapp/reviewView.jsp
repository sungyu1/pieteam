<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<title>안.길</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<script src="https://kit.fontawesome.com/b163195086.js" crossorigin="anonymous"></script>
<!--  		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link
			href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
			rel="stylesheet"> -->
		<style>
   body {
	background-image: url('asset/img/bg.jpg');
	padding-left: 200px;
	padding-right: 200px;
	font-family: 'Do Hyeon', sans-serif;
}

.card-body {
	background-color: whitesmoke;
}

p {
	padding-top: 5px;
	padding-left: 20px;
	font-size: 30px;
}

#date{
	font-size : 20px;
	text-align : right;
} 
</style>
</head>
<jsp:useBean id="ReviewDAO" class="com.smhrd.model.ReviewDAO"/>
<c:set var="review" value="${ReviewDAO.selectOne(param.num)}"/>
<jsp:useBean id="CommentDAO" class="com.smhrd.model.CommentDAO"/>
<c:set var="commentList" value="${CommentDAO.selectComment(param.num)}"/>
<body>
<h2 class="major" style="text-align:center;">리뷰게시판</h2>
	<form>
		<div class="card-body" style="margin-top: 100px; margin-bottom: 10px; height: 150px">
			<p>${review.r_name}/${review.m_id}</p>
			<p id="date">작성일 : ${review.r_date}</p>
		</div>
		<div class="card-body" style="height: 300px">
			<p align="center">${review.r_content}</span>
		</div>
	
		<!-- 댓글작성 -->
		<div class="card mb-2">
			<div class="card-body">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><textarea class="form-control"
							id="exampleFormControlTextarea1" rows="3"></textarea>
						<button type="button" class="btn btn-dark mt-3" onclick="addReply()">post reply</button></li>
						<li style="list-style: none; text-align: right"><a href="reviewList.jsp"><input type="button" value="뒤로가기" /></a>
						<a href="#"><input type="button" value="글삭제"/></a></li>
				</ul>
				<ul class="list-group list-group-flush" id="reply">
					<c:forEach items="${commentList }" var="reply">
					<li class="list-group-item"><span>${reply.cmt_content} / ${reply.m_id}</span></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
		function addReply() {
			let ta = $('textarea').val()
			
			$.ajax({
				// 요청 경로
				url : 'CommentCon',
				// 요청 데이터(게시물번호, 작성댓글)
				data : {'reviewnum': ${param.num}, 'comment':ta},
				// 요청 방식(get,post)
				type : 'post',
				success : function(data) {
					// alert(data) -> success / fail
					$('#reply').prepend('<li class="list-group-item"><span>'+ta+' / ${loginMember.m_id}</span></li>')
				},
				error : function() {
					alert("통신실패")
				}
			})
		}
	</script>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>