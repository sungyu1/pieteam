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
	</head>
	<body class="generic">

		<div class="wrapper">
			<div class="container">
			  <div class="sign-up-container">
				<form action="JoinCon" method="post">
				 <input type="text" id="inpute" placeholder="id을 입력하세요" name="id">
				 <button class="form_btn" value="ID 중복체크" onclick="checKE()">중복체크</button>
				 <input type="password" placeholder="PW을 입력해주세요.">
				 <input type="text" placeholder="이름을 입력해주세요.">
				 <input type="text" placeholder="닉네임를 입력하세요.">
				 <input type="text" placeholder="나이를 입력하세요.">
				 <!-- <select name="gender" required oninvalid="this.setCustomValidity('성별을 선택해주세요')" oninput="this.setCustomValidity('')"> --> 
				 <!-- <button value="M">남</button> -->
				 <!-- <button value="W">여</button> -->
				 <label><input type="radio" name="fruit" value="M"> 남자</label>
      			 <label><input type="radio" name="fruit" value="W"> 여자</label>
				 <!-- </select> -->
				 <button class="form_btn">signIn</button>
				</form>
			  </div>
			  <div class="sign-in-container">
				<form>
				  <h1>Loign</h1>
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
				  <input type="text" placeholder="ID를 입력하세요.">
				  <input type="password" placeholder="PW를 입력하세요.">
				  <button class="form_btn">Sign In</button>
				</form>
			  </div>
			  <div class="overlay-container">
				<div class="overlay-left">
				  <h1>Loign</h1>
				  
				  <button id="signIn" class="overlay_btn">Sign In</button>
				</div>
				<div class="overlay-right">
				  <h1>SignUp</h1>
				 
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

	</body>
</html>