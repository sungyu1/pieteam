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
		<title>안.길</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<style>
		#map{
			background-color: black;
			width: 1100px;
			height: 600px;
			position: fixed;
		}
	</style>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
							<a href="#" text-align="right"><h5>Login</h5></a>
								<header id="header">
									
									<ul class="icons">
										<li><a href="All.jsp"><button class="form_btn" >전체보기</button></a></li>
										<li><a href="cctv.jsp"><button class="form_btn" >CCTV</button></a></li>
										<li><a href="police.jsp"><button class="form_btn" >파출소</button></a></li>
										<li><a href="fire.jsp"><button class="form_btn" >소방서</button></a></li>
										<li><a href="safe.jsp"><button class="form_btn" >어린이보호</button></a></li>
										<li><a href="reviewList.jsp"><button class="form_btn" >커뮤니티</button></a></li>
									</ul>
								</header>

							<!-- map-->
								<section id="">
									<div id="map">
										
										
									</div>
									
									</span>
								</section>

							

							
						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<section id="search" class="alt">
									<!-- 출발지 -->
									<form method="post" action="#"> 
										<input type="text" name="Departure" id="Departure" placeholder="출발지"/>
									</form>
									<!-- 목적지 -->
									<form method="post" action="#">
										<input type="text" name="Arrival" id="Arrival" placeholder="목적지" />
									</form>
										<button type="button" id="reset" onclick="reset()">재검색</button>
										<button type="button" id="saferoad" onclick="saferoad()">안전경로</button> 
										<!-- <button type="button" id="fastroad" onclick="fastroad()">빠른안전경로</button>  -->
										
								</section>

							<!-- Menu -->
								<!-- <nav id="menu">
									<div style="margin-top: 10px;">  
										출발지 : <input type="text" id="start" name="keyword" size="15"> 
										도착지 : <input type="text" id="end" name="keyword" size="15"> 
										<button type="button" id="reset" onclick="reset()">경로 재검색</button>
										<button type="button" id="saferoad" onclick="saferoad()">안전경로</button> 
										<button type="button" id="fastroad" onclick="fastroad()">빠른안전경로</button> 
									  </div> -->
									<!-- <header class="major">
										<h2>Menu</h2>
									</header>
									<ul>
										 <li><a href="index.html">Homepage</a></li>
										<li><a href="generic.html">Generic</a></li>
										<li><a href="elements.html">Elements</a></li>
										 
											<span class="opener">Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Etiam Dolore</a></li>
										<li><a href="#">Adipiscing</a></li>
										<li>
											<span class="opener">Another Submenu</span>
											<ul>
												<li><a href="#">Lorem Dolor</a></li>
												<li><a href="#">Ipsum Adipiscing</a></li>
												<li><a href="#">Tempus Magna</a></li>
												<li><a href="#">Feugiat Veroeros</a></li>
											</ul>
										</li>
										<li><a href="#">Maximus Erat</a></li>
										<li><a href="#">Sapien Mauris</a></li>
										<li><a href="#">Amet Lacinia</a></li>
									</ul> -->
								</nav>

							

							

							
						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>