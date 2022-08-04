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
			  <div class="sign-in-container">
				<form action="insertP" method="post">
				 <input type="text" id="inputID" placeholder="경찰서이름을 입력하세요" name="name" required oninvalid="this.setCustomValidity('이름을 입력해주세요')" oninput="this.setCustomValidity('')">
				 <input type="text" placeholder="경찰서주소를 입력해주세요." name="addr" required oninvalid="this.setCustomValidity('주소를 입력해주세요')" oninput="this.setCustomValidity('')">
				 <input type="text" placeholder="위도를 입력해주세요." name="lat" required oninvalid="this.setCustomValidity('위도를 입력해주세요')" oninput="this.setCustomValidity('')">
				 <input type="text" placeholder="경도를 입력하세요." name="lon" required oninvalid="this.setCustomValidity('경도를 입력해주세요')" oninput="this.setCustomValidity('')">
				 <input type="text" placeholder="관리전화번호를 입력하세요." name="tel" required oninvalid="this.setCustomValidity('관리전봐번호를 입력해주세요')" oninput="this.setCustomValidity('')" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
				 <button type="submit" class="form_btn">register</button>
				</form>
			  </div>
			  
			  <div class="overlay-container">
				<div class="overlay-right">
				  <h1>경찰서 등록</h1>
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