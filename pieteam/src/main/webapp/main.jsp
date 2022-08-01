<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Dimension by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Dimension by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script src="https://kit.fontawesome.com/b163195086.js" crossorigin="anonymous"></script>
	</head>
	<body class="is-preload">
<%
		// session 값 가지고 오기
		Member loginMember = (Member)session.getAttribute("loginMember");
		
%>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="logo">
							<!-- 표지판-->
							 <!--  <i class="fa-solid fa-signs-post fa-2x" style="color: #FFB432;"></i> -->
						</div>
						<div class="content">
							<div class="inner">
								<h1 style="color: #FFB432 ">안.길</h1>
								<p style="color:#FFB432 ">안전하게 가족에게 돌아가 안기길</a>
								
							</div>
						</div>
						<nav>
						<ul>
								<%if(loginMember == null){ %>
									<li><a href="#Login" ><b style="color:#FFAF00 ">로그인</b></a></li>
									<li><a href="cctv_view.jsp" ><b style="color:#FFAF00">안심경로</b></a></li>
									<li><a href="#Login" ><b style="color:#FFAF00">경로추천</b></a></li>
									<li><a href="#Login"><b style="color:#FFAF00">커뮤니티</b></a></li>
									
									
									<!--  <li><a href="#Join" ><b style="color:#FFAF00 ">회원가입</b></a></li>
									<li><a href="cctv_view.jsp" ><b style="color:#FFAF00">안심경로</b></a></li>-->
								<%}else{ %>
									<li><a href="LogoutCon" ><b style="color:#FFAF00 ">로그아웃</b></a></li>
									<li><a href="update.jsp" ><b style="color:#FFAF00 ">정보수정</b></a></li>
									<%if(loginMember.getM_id().equals("admin")){ %>
										<li><a href="select.jsp" ><b style="color:#FFAF00">회원관리</b></a></li>
										<li><a href="selectCctv.jsp"><b style="color:#FFAF00">CCTV</b></a></li>
										<li><a href="selectPolice.jsp"><b style="color:#FFAF00">파출소</b></a></li>
										<li><a href="selectFire.jsp"><b style="color:#FFAF00">소방서</b></a></li>
										<li><a href="selectSafe.jsp"><b style="color:#FFAF00">보호구역</b></a></li>
										<li><a href="#"><b style="color:#FFAF00">위험관리</b></a></li>
										<li><a href="#"><b style="color:#FFAF00">커뮤니티관리</b></a></li>
									<%}else{ %>
									<li><a href="cctv_view.jsp" ><b style="color:#FFAF00">안심경로</b></a></li>
									<li><a href="safepath.jsp" ><b style="color:#FFAF00">경로추천</b></a></li>
									<li><a href="reviewList.jsp"><b style="color:#FFAF00">커뮤니티</b></a></li>
									<%} %>
								<%} %>
							</ul>
						</nav>
					</header>

				<!-- Main -->
						<div id="main">

							<!-- Member 로그인-->
							<article id="Login"><!-- intro -->
								<!-- <h2 class="major">로그인</h2> -->
								
								<!--<span class="image main"><img src="images/pic01.jpg" alt=""/></span>--> 
								
								<!-- 로그인 -->
								<div id="menu">	
									<div class="sign-in-container">
										<div class="container">
										<form action="LoginCon" method="post">
											<h2 style="color:#ffb432 ">로그인</h2>
											<div class="social-links" style="display: flex;	justify-content:start;">
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
											<h6>or use your account</h6>
											<input type="text"  placeholder="id을 입력하세요" name="id">
											<input type="password" placeholder="PW를 입력하세요" name="pw">
											<button class="form_btn" >Sign In</button>
										</form>
									</div>
									<a href="#Join"><h6>아이디가 없으신가요?</h6></a>
									<a href="#Join"><h6>비밀번호를 잊어버리셨나요?</h6></a>
								</nav>	
							</article>
						 

						<!-- 회원가입 -->
						<!-- Join -->
							<article id="Join"><!-- work -->
								
								<div class="social-links">
									<h2>회원가입</h2>								  
								 <form action="JoinCon" method="post">
								 <input type="text" id="inpute" placeholder="id을 입력하세요" name="id" required oninvalid="this.setCustomValidity('아이디를 입력해주세요')" oninput="this.setCustomValidity('')">
								 <input type="button" value="ID 중복체크" onclick="checKE()"><br>
								
								 <span id ="resultCheck"></span><br>
									<input type="password"  placeholder="PW를 입력하세요" name="pw" required oninvalid="this.setCustomValidity('비밀번호를 입력해주세요')" oninput="this.setCustomValidity('')">
									<input type="text"  placeholder="이름을입력해주세요." name="name" required oninvalid="this.setCustomValidity('이름을 입력해주세요')" oninput="this.setCustomValidity('')">
									<input type="text"  placeholder="닉네임입력해주세요." name="nickname" required oninvalid="this.setCustomValidity('닉네임을 입력해주세요')" oninput="this.setCustomValidity('')">
									<input type="text"  placeholder="나이입력해주세요." name="age" required oninvalid="this.setCustomValidity('나이를 입력해주세요')" oninput="this.setCustomValidity('')" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
									<select name="gender" required oninvalid="this.setCustomValidity('성별을 선택해주세요')" oninput="this.setCustomValidity('')">
									<option value="">성별 선택</option>
									<option value="M">남</option>
									<option value="W">여</option>
									</select>
									<input type="submit" value="JoinUs"  style="color:#FFB432;" class="button fit">
									</form>
								</div>
							</article>

						<!-- safe -->
							<article id="safe"><!-- about -->
								<h2 class="major" style="color:#FFB432 ">안심경로</h2>
								<span class="image main"><img src="" alt="" /></span>
								
							</article>
						<!-- pathways -->
							<article id="pathways"><!-- about -->
								<h2 class="major" style="color:#FFB432 ">경로추천</h2>
								<span class="image main"><img src="" alt="" /></span>
								
							</article>

						<!-- community -->
							<article id="community"><!--contact  -->
								<h2 class="major" style="color:#FFB432 ">커뮤니티</h2>
								<form method="post" action="#">
									<div class="container">

										
										<table class="table">
										  <tr>
											  <th style="color:#FFAF00">글 제목</th>
											  <th style="color:#FFAF00">작성자</th>
											  <th style="color:#FFAF00">조회수</th>
										  </tr>
										
										</table>
										<a href="#community"><button id="writeBtn">글작성</button></a>
										</div>
									
									
									
									<!-- <div class="fields">
										<div class="field half">
											<label for="name">Name</label>
											<input type="text" name="name" id="name" />
										</div>
										<div class="field half">
											<label for="email">Email</label>
											<input type="text" name="email" id="email" />
										</div>
										<div class="field">
											<label for="message">Message</label>
											<textarea name="message" id="message" rows="4"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="form_btn" value="Send Message" class="primary" /></li>
										<li><input type="reset" value="Reset" /></li>
									</ul> -->
								</form>
								<!-- <ul class="icons"> 인스타,페이스북 버튼위치
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
								</ul> -->
							</article>

							<!-- Writing -->
							<article id="Writing"></article>



						<!-- Elements -->
							<article id="elements">
								<h2 class="major">Elements</h2>

								<section>
									<h3 class="major">Text</h3>
									<p>This is <b>bold</b> and this is <strong>strong</strong>. This is <i>italic</i> and this is <em>emphasized</em>.
									This is <sup>superscript</sup> text and this is <sub>subscript</sub> text.
									This is <u>underlined</u> and this is code: <code>for (;;) { ... }</code>. Finally, <a href="#">this is a link</a>.</p>
									<hr />
									<h2>Heading Level 2</h2>
									<h3>Heading Level 3</h3>
									<h4>Heading Level 4</h4>
									<h5>Heading Level 5</h5>
									<h6>Heading Level 6</h6>
									<hr />
									<h4>Blockquote</h4>
									<blockquote>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan faucibus. Vestibulum ante ipsum primis in faucibus lorem ipsum dolor sit amet nullam adipiscing eu felis.</blockquote>
									<h4>Preformatted</h4>
									<pre><code>i = 0;

while (!deck.isInOrder()) {
    print 'Iteration ' + i;
    deck.shuffle();
    i++;
}

print 'It took ' + i + ' iterations to sort the deck.';</code></pre>
								</section>

								<section>
									<h3 class="major">Lists</h3>

									<h4>Unordered</h4>
									<ul>
										<li>Dolor pulvinar etiam.</li>
										<li>Sagittis adipiscing.</li>
										<li>Felis enim feugiat.</li>
									</ul>

									<h4>Alternate</h4>
									<ul class="alt">
										<li>Dolor pulvinar etiam.</li>
										<li>Sagittis adipiscing.</li>
										<li>Felis enim feugiat.</li>
									</ul>

									<h4>Ordered</h4>
									<ol>
										<li>Dolor pulvinar etiam.</li>
										<li>Etiam vel felis viverra.</li>
										<li>Felis enim feugiat.</li>
										<li>Dolor pulvinar etiam.</li>
										<li>Etiam vel felis lorem.</li>
										<li>Felis enim et feugiat.</li>
									</ol>
									<h4>Icons</h4>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
									</ul>

									<h4>Actions</h4>
									<ul class="actions">
										<li><a href="#" class="button primary">Default</a></li>
										<li><a href="#" class="button">Default</a></li>
									</ul>
									<ul class="actions stacked">
										<li><a href="#" class="button primary">Default</a></li>
										<li><a href="#" class="button">Default</a></li>
									</ul>
								</section>

								<section>
									<h3 class="major">Table</h3>
									<h4>Default</h4>
									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th>Name</th>
													<th>Description</th>
													<th>Price</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Item One</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Two</td>
													<td>Vis ac commodo adipiscing arcu aliquet.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Three</td>
													<td> Morbi faucibus arcu accumsan lorem.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Four</td>
													<td>Vitae integer tempus condimentum.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Five</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="2"></td>
													<td>100.00</td>
												</tr>
											</tfoot>
										</table>
									</div>

									<h4>Alternate</h4>
									<div class="table-wrapper">
										<table class="alt">
											<thead>
												<tr>
													<th>Name</th>
													<th>Description</th>
													<th>Price</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Item One</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Two</td>
													<td>Vis ac commodo adipiscing arcu aliquet.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Three</td>
													<td> Morbi faucibus arcu accumsan lorem.</td>
													<td>29.99</td>
												</tr>
												<tr>
													<td>Item Four</td>
													<td>Vitae integer tempus condimentum.</td>
													<td>19.99</td>
												</tr>
												<tr>
													<td>Item Five</td>
													<td>Ante turpis integer aliquet porttitor.</td>
													<td>29.99</td>
												</tr>
											</tbody>
											<tfoot>
												<tr>
													<td colspan="2"></td>
													<td>100.00</td>
												</tr>
											</tfoot>
										</table>
									</div>
								</section>

								<section>
									<h3 class="major">Buttons</h3>
									<ul class="actions">
										<li><a href="#" class="button primary">Primary</a></li>
										<li><a href="#" class="button">Default</a></li>
									</ul>
									<ul class="actions">
										<li><a href="#" class="button">Default</a></li>
										<li><a href="#" class="button small">Small</a></li>
									</ul>
									<ul class="actions">
										<li><a href="#" class="button primary icon solid fa-download">Icon</a></li>
										<li><a href="#" class="button icon solid fa-download">Icon</a></li>
									</ul>
									<ul class="actions">
										<li><span class="button primary disabled">Disabled</span></li>
										<li><span class="button disabled">Disabled</span></li>
									</ul>
								</section>

								<section>
									<h3 class="major">Form</h3>
									<form method="post" action="#">
										<div class="fields">
											<div class="field half">
												<label for="demo-name">Name</label>
												<input type="text" name="demo-name" id="demo-name" value="" placeholder="Jane Doe" />
											</div>
											<div class="field half">
												<label for="demo-email">Email</label>
												<input type="email" name="demo-email" id="demo-email" value="" placeholder="jane@untitled.tld" />
											</div>
											<div class="field">
												<label for="demo-category">Category</label>
												<select name="demo-category" id="demo-category">
													<option value="">-</option>
													<option value="1">Manufacturing</option>
													<option value="1">Shipping</option>
													<option value="1">Administration</option>
													<option value="1">Human Resources</option>
												</select>
											</div>
											<div class="field half">
												<input type="radio" id="demo-priority-low" name="demo-priority" checked>
												<label for="demo-priority-low">Low</label>
											</div>
											<div class="field half">
												<input type="radio" id="demo-priority-high" name="demo-priority">
												<label for="demo-priority-high">High</label>
											</div>
											<div class="field half">
												<input type="checkbox" id="demo-copy" name="demo-copy">
												<label for="demo-copy">Email me a copy</label>
											</div>
											<div class="field half">
												<input type="checkbox" id="demo-human" name="demo-human" checked>
												<label for="demo-human">Not a robot</label>
											</div>
											<div class="field">
												<label for="demo-message">Message</label>
												<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
											</div>
										</div>
										<ul class="actions">
											<li><input type="form_btn" value="Send Message" class="primary" /></li>
											<li><input type="reset" value="Reset" /></li>
										</ul>
									</form>
								</section>

							</article>

					</div>

				<!-- Footer -->
					<footer id="footer">
						<p &copy; class="copyright"style="color:#FFB432 ">&copy; 안.길</p>
					</footer>

			</div>

		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

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


