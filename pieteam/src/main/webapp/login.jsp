<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>안길</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!-- <link rel="stylesheet" href="assets/css/main.css" /> -->
		<link rel="stylesheet" href="assets/css/login.css" />
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</head>
	<body class="generic">

	 	<div class="wrapper">
			<div class="container">
			  <div class="sign-up-container">
				<form action="JoinCon" method="post">
				 <input type="text" id="inputID" placeholder="id을 입력하세요" name="id" required oninvalid="this.setCustomValidity('아이디를 입력해주세요')" oninput="this.setCustomValidity('')">
				 <button class="form_btn" value="ID 중복체크" onclick="checKE()">중복체크</button>
				 <span id ="resultCheck"></span>
				 <input type="password" placeholder="PW을 입력해주세요." name="pw" required oninvalid="this.setCustomValidity('비밀번호를 입력해주세요')" oninput="this.setCustomValidity('')">
				 <input type="text" placeholder="이름을 입력해주세요." name="name" required oninvalid="this.setCustomValidity('이름을 입력해주세요')" oninput="this.setCustomValidity('')">
				 <input type="text" placeholder="닉네임을 입력하세요." name="nickname" required oninvalid="this.setCustomValidity('닉네임을 입력해주세요')" oninput="this.setCustomValidity('')">
				 <input type="text" placeholder="나이를 입력하세요." name="age" required oninvalid="this.setCustomValidity('나이를 입력해주세요')" oninput="this.setCustomValidity('')" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
				 <!-- <select name="gender" required oninvalid="this.setCustomValidity('성별을 선택해주세요')" oninput="this.setCustomValidity('')"> --> 
				 <!-- <button value="M">남</button> -->
				 <!-- <button value="W">여</button> -->
				 <label><input type="radio" name="gender" value="M" required oninvalid="this.setCustomValidity('성별을 선택해주세요')" oninput="this.setCustomValidity('')"> 남자</label>
      			 <label><input type="radio" name="gender" value="W"> 여자</label>
				 <!-- </select> -->
				 <button type="submit" class="form_btn">sign In</button>
				</form>
			  </div>
			  <div class="sign-in-container">
				<form action="LoginCon" method="post">
				  <h1>Login</h1>
				  <div class="social-links">
					<div>
					  <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
					</div>
					<div>
					  <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
					</div>
					<div>
					  <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
					</div>
				  </div>
				  <span>or use your account</span>
				  <input type="text" placeholder="ID를 입력하세요." name="id">
				  <input type="password" placeholder="PW를 입력하세요." name="pw">
				  <button type="submit" class="form_btn">Sign In</button>
				</form>
			  </div>
			  <div class="overlay-container">
				<div class="overlay-left">
				  <h1>Login</h1>
				  
				  <button id="signIn" class="overlay_btn">Sign In</button>
				</div>
				<div class="overlay-right">
				  <h1>Sign Up</h1>
				 
				  <button id="signUp" class="overlay_btn">Sign Up</button>
				</div>
			  </div>
			</div>
		  </div>

		<!-- Scripts -->
		  	
			<script src="assets/js/login.js"></script>
			<!-- <script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> -->
			
			<!-- id 중복체크 -->
			<script>
				function checKE() {
					var inputID = $('#inputID').val()
					console.log(inputID)
					
					$.ajax({
						// 요청 경로
						url : 'IDCheckCon',
						// 요청 데이터{키:실제값}
						data : {'inputID':inputID},
						// 요청 방식
						type : 'get',
						// 요청-응답 성공
						success : function(data){
							if(data=='true'){ // data가 true -> 사용할 수 없는 아이디
								$('#resultCheck').text('사용할 수 없는 아이디입니다')
							}else{ // data가 false -> 사용할 수 있는 아이디
								$('#resultCheck').text('사용할 수 있는 아이디입니다')								
							}
						},
						error : function(){
							alert("통신실패!")
						}
						
					})
				}
			</script>

	</body>
</html>