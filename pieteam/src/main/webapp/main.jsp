<%@page import="com.smhrd.model.Member"%>
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
			width: 1306px; /* 1698:끝까지 큰화면 */
			height: 700px;
			position: fixed;
		}
	</style>
	<body class="is-preload">
<%
//session 값 가지고 오기
		Member loginMember = (Member)session.getAttribute("loginMember");
%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

					

							<%if(loginMember!=null){ %>
								<a href="update.jsp" style="color:black"><h5>개인정보수정</h5></a>
								<a href="LogoutCon" style="color:black"><h5>Logout</h5></a>
								<%if(loginMember.getM_id().equals("admin")){ %>
									<header id="header">
										<ul class="icons">
											<li><button class="form_btn" onclick="changeIframe('selectMember.jsp')">회원정보관리</button></li>
											<li><a href="#"><button class="form_btn" onclick="changeIframe('selectCctv.jsp')">CCTV관리</button></a></li>
											<li><a href="#"><button class="form_btn" onclick="changeIframe('selectPolice.jsp')">파출소관리</button></a></li>
											<li><a href="#"><button class="form_btn" onclick="changeIframe('selectFire.jsp')">소방서관리</button></a></li>
											<li><a href="#"><button class="form_btn" onclick="changeIframe('selectSafe.jsp')">어린이보호관리</button></a></li>
											<li><a href="#"><button class="form_btn" onclick="changeIframe('selectMember.jsp')">커뮤니티관리</button></a></li>
										</ul>
									</header>
								<%}else{ %>
							<header id="header">
							<ul class="icons">
								<li><a href="All.jsp"><button class="form_btn" ><img src="./images/map.png"></button></a></li>
								<li><a href="cctv.jsp"><button class="form_btn" ><img src="./images/cctv.png"></button></a></li>
								<li><a href="police.jsp"><button class="form_btn" ><img src="./images/경찰2.png"></button></a></li>
								<li><a href="fire.jsp"><button class="form_btn" ><img src="./images/소방서.png"></button></a></li>
								<li><a href="safe.jsp"><button class="form_btn" ><img src="./images/학교.png"></button></a></li>
								<li><a href="reviewList.jsp"><button class="form_btn" ><img src="./images/커뮤니티.png"></button></a></li>
							</ul>
							</header>
								<%} %>
							<%}else{ %>								
								<a href="login.jsp" style="color:black; text-decoration: none; text-align: right"><h5>Login</h5></a>
								<header id="header">
								<ul class="icons">
									<li><a href="All.jsp"><button class="form_btn"><img src="./images/map.png"></button></a></li>
									<li><a href="cctv.jsp"><button class="form_btn" ><img src="./images/cctv.png"></button></a></li>
									<li><a href="police.jsp"><button class="form_btn" ><img src="./images/경찰2.png"></button></a></li>
									<li><a href="fire.jsp"><button class="form_btn" ><img src="./images/소방서.png"></button></a></li>
									<li><a href="safe.jsp"><button class="form_btn" ><img src="./images/학교.png"></button></a></li>
									<li><a href="reviewList.jsp"><button class="form_btn" ><img src="./images/커뮤니티.png"></button></a></li>
								</ul>
								</header>
								<script>
									function mouseOut(){
										$("#img").attr('src','./images/경찰서.png')
									}
								</script>
							<%} %>
							<!-- map-->
							<%if(loginMember != null){ %>
								<%if(loginMember.getM_id().equals("admin")){ %>
									<div id = "manage">
									<iframe src="selectMember.jsp" id="url" style="width:1698px; height:600px; align-content: center;"></iframe>
									</div>
							<%}} %>
							<script>
								function changeIframe(url){
									$('#url').attr('src', url)
								}
							</script>
							
									<div id="map">
									</div>
								
						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							Search
								<section id="search" class="alt">
									출발지
									<form method="post" action="#"> 
										<input type="text" name="Departure" id="Departure" placeholder="출발지"/>
									</form>
									목적지
									<form method="post" action="#">
										<input type="text" name="Arrival" id="Arrival" placeholder="목적지" />
									</form>
										<button type="button" id="reset" onclick="reset()"><img src="./images/재검색1.png"></button>
										<button type="button" id="saferoad" onclick="saferoad()"><img src="./images/moving.png"></button> 
										<button type="button" id="fastroad" onclick="fastroad()">빠른안전경로</button> 
										
								</section>
								<div style="height: 100px; background: red;     overflow: auto;">
									
									redredredredredred
									<br><br><br><br><br><br><br>
									redredredredredred
									
									


								</div>

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
								<!-- </nav> -->

							

							

							
						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script>
			function onClickSelect(e) {
				  const isActive = e.currentTarget.className.indexOf("active") !== -1;
				  if (isActive) {
				    e.currentTarget.className = "select";
				  } else {
				    e.currentTarget.className = "select active";
				  }
				}

				document.querySelector("#theme .select").addEventListener("click", onClickSelect);

				function onClickOption(e) {
				  const selectedValue = e.currentTarget.innerHTML;
				  document.querySelector("#theme .text").innerHTML = selectedValue;
				}

				var optionList = document.querySelectorAll("#theme .option");
				for (var i = 0; i < optionList.length; i++) {
				  var option = optionList[i];
				  option.addEventListener("click", onClickOption);
				}
			</script>

	</body>
</html>