<%@page import="com.smhrd.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>Dimension by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script src="https://kit.fontawesome.com/b163195086.js" crossorigin="anonymous"></script>
</head>
<body>

	<div id="wrapper">
	
		<h2 class="major">리뷰 작성</h2>
		
	 	<form action="RevieWriteCon" method="post">
			<div class="fields">
				<div class="field">
				<input type="text" placeholder="제목 작성" name="name">
				</div>
				<div class="field">
					<label for="review">Review</label>
					<textarea name="review" id="review" rows="10"></textarea>
				</div>
			</div>
			<ul class="actions">
				<li><input type="submit" value="Upload" class="primary" /></li>
				<li><input type="reset" value="Reset" /></li>
			</ul>
		</form>
	
		<!-- Footer -->
		<footer id="footer">
			<p &copy; class="copyright"style="color:#FFAF00 ">&copy; 안.길</p>
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
</body>
</html>