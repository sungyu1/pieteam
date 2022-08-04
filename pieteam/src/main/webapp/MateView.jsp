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
			<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


	<style>
		.major{
			font-family: 'Noto Sans KR', sans-serif;
		}
		table>tr{
			font-family: 'Noto Sans KR', sans-serif;
		} 
	</style>
		<style>
   body {
	background-image: url('asset/img/bg.jpg');
	padding-left: 200px;
	padding-right: 200px;
	font-family: 'Do Hyeon', sans-serif;
}

.card-body {
	background-color:rgba(173,212,0,0.25);
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

textarea {
    width: 925px;
    height: 6.25em;
    border: none;
    resize: none;
  }  
  li{
  list-style: none;
  } 
</style>
</head>
<jsp:useBean id="MateDAO" class="com.smhrd.model.MateDAO"/>
<c:set var="mate" value="${MateDAO.selectOne(param.num)}"/>
<%-- <jsp:useBean id="MateDAO2" class="com.smhrd.model.MateDAO"/>
<c:set var="mateupdate" value="${MateDAO2.updateMate(param.num)}"/> --%>
<body>
<h2 class="major" style="text-align:center;">등교메이트 구하기</h2>
	<form>
		<div class="card-body" style="margin-top: 100px; margin-bottom: 10px; height: 150px">
			<p>${mate.mate_name}/${mate.m_id}</p>
			<p id="date">작성일 : ${mate.mate_date}</p>
		</div>
		<div class="card-body" style="height: 300px">
			<p align="center">${mate.mate_memo}</p>
		</div>
		</form>
		 <!-- 메이트 등록 -->
		<div class="card mb-2">
			<div class="card-body">
				
					<input type="text" name="mate_id" id="mate_id" placeholder="아이디를 입력하세요">
					<button type="submit" class="btn btn-dark mt-3" id="mate" onclick="addReply()" style="background-color:#1E552E; color: white !important;">With Mate</button><!-- onclick="addReply()" -->
				
						<a href="schoolmateList.jsp"><input type="button" value="back" /></a>
						<a href="DeleteMate?num=${param.num }"><input type="button" value="remove"/></a>
			</div>
		</div>
	

	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 	<script>
		function addReply() {
			let ta = $('#mate_id').val()
			
			$.ajax({
				// 요청 경로
				url : 'MateCon',
				// 요청 데이터(게시물번호, 작성댓글)
				data : {'matenum': ${param.num}, 'mate_id':ta},
				// 요청 방식(get,post)
				type : 'post',
				success : function(data) {
					// alert(data) -> success / fail
					/* $('#reply').prepend('<li class="list-group-item"><span>'+ta+' / ${loginMember.m_id}</span></li>') */
					const res = $.trim(data);
					if(res =='success'){
						$("#mate").hide();
						alert("메이트 매치 성공 !")
						location.href='schoolmateList.jsp'
					}else{
						alert("아이디를 확인해주세요")
					}

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