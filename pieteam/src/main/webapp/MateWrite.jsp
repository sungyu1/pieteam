<%@page import="com.smhrd.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>안.길</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
<body>

	
		<h2 class="major" style="text-align:center;">메이트 작성</h2>

	 	<form action="MateWriteCon" method="post">
		<table style="width: 1000px; height: 600px; margin: auto">
		<tr><td><input type="text" placeholder="제목 작성" name="name" required oninvalid="this.setCustomValidity('제목을 입력해주세요')" oninput="this.setCustomValidity('')"></td></tr>
		<tr><td><label for="mate">mate 구하기</label>
			<textarea name="mate" id="mate" rows="10"  required oninvalid="this.setCustomValidity('내용을 입력해주세요')" oninput="this.setCustomValidity('')"></textarea></td></tr>
		<tr><td><input type="submit" value="Upload" class="primary" />
				<input type="reset" value="Reset" />
				<a href="schoolmateList.jsp"><input type="button" value="Cancle" /></a></td></tr>
		</table>
		</form>
	
		<!-- Footer -->
		<footer id="footer">
			<p &copy; class="copyright">&copy; 안.길</p>
		</footer>


		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>